<?php
// If they are saving the Information
error_reporting(0);

if ($_POST['submit_bt'] == 'บันทึกข้อมูล' || $_POST['submit_bt'] == 'บันทึกข้อมูล และแก้ไขต่อ') {
    if ($_POST['submit_bt'] == 'บันทึกข้อมูล') {
        $redirect = true;
    } else {
        $redirect = false;
    }
    $arrData = array();
    $arrData = $functions->replaceQuote($_POST);

    if ($arrData['ref'] != "") {
      //  $arrData['announce_ref'] = $functions->seoTitle($arrData['ref']);
    } else {
       // $arrData['announce_ref'] = $functions->seoTitle($arrData['announce_title']);
    }
    // print_r($arrData);

    $announce->SetValues($arrData);




    if ($announce->GetPrimary() == '') {
        $announce->SetValue('created_at', DATE_TIME);
        $announce->SetValue('updated_at', DATE_TIME);
    } else {
        $announce->SetValue('updated_at', DATE_TIME);
    }

   $birthday =  ($_POST['activity_date_year'] - 543) . '-' .  $_POST['activity_date_month'] .'-'. $_POST['activity_date_day'];

    $announce->SetValue('activity_date', $birthday);


  //  $announce->Save();
    if ($announce->Save()) {
        SetAlert('เพิ่ม แก้ไข ข้อมูลสำเร็จ', 'success');
        //Redirect if needed

        if (isset($_FILES['file_array'])) {

            $Allfile = "";
            $Allfile_ref = "";
            for ($i = 0; $i < count($_FILES['file_array']['tmp_name']); $i++) {
                if ($_FILES["file_array"]["name"][$i] != "") {
                    unset($arrData['webs_money_image']);

                    $targetPath = DIR_ROOT_FILES . "/";

                    $newImage = DATE_TIME_FILE . "_" . $_FILES['file_array']['name'][$i];

                    $cdir = getcwd(); // Save the current directory

                    chdir($targetPath);

                    copy($_FILES['file_array']['tmp_name'][$i], $targetPath . $newImage);

                    chdir($cdir); // Restore the old working directory   

                    $announce_file->SetValue('file_name', $newImage);

                    if ($_POST['file_name_ref'][$i] == '') {

                        //$Allfile_ref .= "|_|" . $newImage;
                        //$announce_file->SetValue('file_name', substr($Allfile, 3));
                        $announce_file->SetValue('file_name_ref', $newImage);
                    } else {
                        //$Allfile_ref .= "|_|" .   $functions->seoTitle($_POST['file_name_ref'][$i]);
                        $announce_file->SetValue('file_name_ref', $functions->seoTitle($_POST['file_name_ref'][$i]));
                    }

                    $announce_file->SetValue('announce_id', $announce->GetPrimary());
                    $announce_file->SetValue('type', "image");
                    //$announce_file->Save();
                    if ($announce_file->Save()) {

                        //SetAlert('เพิ่ม แก้ไข ข้อมูลสำเร็จ','success');
                        $announce_file->ResetValues();
                    } else {
                        SetAlert('ไม่สามารถเพิ่ม แก้ไข ข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
                    }
                }
            }
        }


        if ($_FILES["cover_img_array"]["name"][0] != "") {

            $targetPath = DIR_ROOT_COVER . "/";

            $newImage = DATE_TIME_FILE . "_" . $_FILES['cover_img_array']['name'][0];

//         ภาพหน้าปก



            $cdir = getcwd(); // Save the current directory

            chdir($targetPath);

            copy($_FILES['cover_img_array']['tmp_name'][0], $targetPath . $newImage);

            chdir($cdir); // Restore the old working directory   

            $announce->SetValue('cover_img', $newImage);




            if ($announce->Save()) {

                //SetAlert('เพิ่ม แก้ไข ข้อมูลสำเร็จ','success');
                //$announce->ResetValues();
            } else {
                SetAlert('ไม่สามารถเพิ่ม แก้ไข ข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
            }
        }

        //อัพโหลด ไฟล์เอกสาร

        if ($_FILES["file_doc"]["name"] != "") {

            $targetPath = DIR_ROOT_DOCUMENT . "/";

            $newImage = DATE_TIME_FILE . "_" . $_FILES['file_doc']['name'];

            $cdir = getcwd(); // Save the current directory

            chdir($targetPath);

            copy($_FILES['file_doc']['tmp_name'], $targetPath . $newImage);

            chdir($cdir); // Restore the old working directory   
            $announce_file->SetValue('file_name', $newImage);
            $announce_file->SetValue('file_name_ref', $newImage);
            $announce_file->SetValue('type', "file");

            $announce_file->SetValue('announce_id', $announce->GetPrimary());
            //$announce_file->Save();
            if ($announce_file->Save()) {

                //SetAlert('เพิ่ม แก้ไข ข้อมูลสำเร็จ','success');
                $announce_file->ResetValues();
            } else {
                SetAlert('ไม่สามารถเพิ่ม แก้ไข ข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
            }
        }



        if ($redirect) {
            header('location:' . ADDRESS_ADMIN_CONTROL . 'announce');
            die();
        } else {
            header('location:' . ADDRESS_ADMIN_CONTROL . 'announce&action=edit&id=' . $announce->GetPrimary());
            die();
        }
    } else {
        SetAlert('ไม่สามารถเพิ่ม แก้ไข ข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
    }
}
//delete file
if ($_GET['announce_file_id'] != '' && $_GET['action'] == 'edit') {

    $announce_file->SetPrimary((int) $_GET['announce_file_id']);

    if ($announce_file->Delete()) {
        // Set alert and redirect
        if (unlink(DIR_ROOT_FILES . $announce_file->GetValue('file_name'))) {
            //	fulldelete($location); 
            SetAlert('Delete Data Success', 'success');
        }
    } else {
        SetAlert('ไม่สามารถลบข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
        //	echo $_GET['announce_file_id'];
    }
}
//delete cover image
if ($_GET['cover_img_id'] != '' && $_GET['action'] == 'edit') {

    $arrImage = array(
        'cover_img' => '',
        'updated_at' => DATE_TIME
    );

    $arrImgID = array("id" => $_GET['cover_img_id']);

    if ($announce->updateSQL($arrImage, $arrImgID)) {
        if (unlink(DIR_ROOT_COVER . $announce->GetValue('cover_img'))) {
            //SetAlert('Delete Data Success','success');
        }
    } else {
        SetAlert('ไม่สามารถลบข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
    }
}

//delete document
if ($_GET['document_id'] != '' && $_GET['action'] == 'edit') {

    $announce_file->SetPrimary((int) $_GET['document_id']);

    if ($announce_file->Delete()) {
        // Set alert and redirect
        if (unlink(DIR_ROOT_DOCUMENT . $announce_file->GetValue('file_name'))) {
            //	fulldelete($location); 
            SetAlert('Delete Data Success', 'success');
        }
    } else {
        SetAlert('ไม่สามารถลบข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
        //	echo $_GET['announce_file_id'];
    }
}

// If Deleting the Page
if ($_GET['id'] != '' && $_GET['action'] == 'del') {
    // Get all the form data
    $arrDel = array('id' => $_GET['id']);
    $announce->SetValues($arrDel);

    // Remove the info from the DB
    if ($announce->Delete()) {
        // Set alert and redirect
        SetAlert('Delete Data Success', 'success');
        header('location:' . ADDRESS_ADMIN_CONTROL . 'announce');
        die();
    } else {
        SetAlert('ไม่สามารถลบข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
    }
}

if ($_GET['id'] != '' && $_GET['action'] == 'edit') {
    // For Update
    $announce->SetPrimary((int) $_GET['id']);
    // Try to get the information
    if (!$announce->GetInfo()) {
        SetAlert('ไม่สามารถค้นหาข้อมูลได้ กรุณาลองใหม่อีกครั้ง');
        $announce->ResetValues();
    }
}
?>
<?php if ($_GET['action'] == "add" || $_GET['action'] == "edit") { ?>
    <div class="row-fluid">

        <div class="span12">
            <div><a href="<?php echo ADDRESS_ADMIN_CONTROL ?>announce" class="myButton"> BACK</a>
            <p></p>
            </div>

            <?php
            // Report errors to the user
            Alert(GetAlert('error'));
            Alert(GetAlert('success'), 'success');
            ?>
            <div class="da-panel collapsible">
                <div class="da-panel-header"> <span class="da-panel-title"> <i class="icol-<?php echo ($announce->GetPrimary() != '') ? 'application-edit' : 'add' ?>"></i> <?php echo ($announce->GetPrimary() != '') ? 'แก้ไข' : 'เพิ่ม' ?> ข้อมูล </span> </div>
                <div class="da-panel-content da-form-container">
                    <form id="validate" enctype="multipart/form-data" action="<?php echo ADDRESS_ADMIN_CONTROL ?>announce<?php echo ($announce->GetPrimary() != '') ? '&id=' . $announce->GetPrimary() : ''; ?>" method="post" class="da-form">
                        <?php if ($announce->GetPrimary() != ''): ?>
                            <input type="hidden" name="id" value="<?php echo $announce->GetPrimary() ?>" />
                            <input type="hidden" name="created_at" value="<?php echo $announce->GetValue('created_at') ?>" />
                            <input type="hidden" name="cover_img" value="<?php echo $announce->GetValue('cover_img') ?>" />
                            <input type="hidden" name="activity_date" value="<?php echo $announce->GetValue('activity_date') ?>" />
                        <?php endif; ?>
                        <div class="da-form-inline">
                            <div class="da-form-row">
                                <label class="da-form-label">ชื่อ-สกุล <span class="required">*</span></label>
                                <div class="da-form-item large">
                                    <input type="text" name="announce_title" id="announce_title" value="<?php echo ($announce->GetPrimary() != '') ? $announce->GetValue('announce_title') : ''; ?>" class="span12 required" />
                                </div>
                            </div>
                            <div class="da-form-row">
                                <label class="da-form-label">เพศ <span class="required">*</span></label>
                                <div class="da-form-item large">
                                    <ul class="da-form-list">
                                        <?php
                                        $getStatus = $announce->get_enum_values('sex');
//                                        print_r($getStatus);
//                                        print_r($announce->GetValue('sex'));
                                        $i = 1;
                                        foreach ($getStatus as $status) {
                                           // echo $status;
                                            ?>
                                            <li>
                                                <input type="radio" name="sex" id="sex" value="<?php echo $status ?>" <?php echo ($announce->GetPrimary() != "") ? ($announce->GetValue('sex') == $status) ? "checked=\"checked\"" : "" : ($i == 1) ? "checked=\"checked\"" : "" ?> class="required"/>
                                                <label><?php echo $status ?></label>
                                            </li>
                                            <?php $i++;
                                        }
                                        ?>
                                    </ul>
                                </div>
                            </div>
                            <div class="da-form-row">
                                <label class="da-form-label">วันเกิด <span class="required">*</span></label>
                                <div class="da-form-item large">
                                    <?php

                                    list($year, $month, $day) = explode("-", $announce->GetValue('activity_date'));
                                    ?>
                                    <input type="number" minlength="2" maxlength="2" name="activity_date_day" id="activity_date" value="<?php echo $day?>" class="span1 required" placeholder="วัน" />
                                    <input type="number" minlength="2" maxlength="2" name="activity_date_month" id="activity_date" value="<?php echo $month ?>" class="span1 required" placeholder="เดือน"/>
                                    <input type="number" minlength="4" maxlength="4" name="activity_date_year" id="activity_date" value="<?php echo ($year != ''?  $year + 543 : '') ?>" class="span2 required" placeholder="ปี พ.ศ."/>
                                </div>
                            </div>

                            <fieldset class="da-form-inline">
                                <legend><i class="fa fa-picture-o"></i>  อัพโหลดภาพ [JPG, PNG, GIF]</legend>
                                <div class="da-form-row">
                                    <label class="da-form-label">ภาพ</label>
                                    <div class="da-form-item large">
                                        <?php
                                        $sql = "SELECT * FROM " . $announce->getTbl() . " WHERE id = '" . $announce->GetPrimary() . "' AND cover_img not in('')";
                                        $query = $db->Query($sql);
                                        if ($db->NumRows($query) > 0) {

                                            while ($row = $db->FetchArray($query)) {
                                                ?>
                                                <div class="span4">
                                                    <p> <a class="fancybox" href="<?php echo ADDRESS_COVER . $row['cover_img'] ?>"> <img class="img-polaroid" src="<?php echo ADDRESS_COVER . $row['cover_img'] ?>" style="max-width:150px;"/></a> <span class=""> <a class="da-button red small" href="<?php echo ADDRESS_ADMIN_CONTROL ?>announce&action=edit&id=<?php echo $_GET['id'] ?>&cover_img_id=<?php echo $row['id'] ?>" style="color:#FFF; size:20px; text-decoration: none;" onclick="return confirm('Are you sure you want to delete?')" > ลบไฟล์ </a></span> </p>
                                                </div>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </div>
                                </div>
                                <div class="da-form-row">
                                    <label class="da-form-label">อัพโหลดภาพ</label>
                                    <div class="da-form-item large">
                                        <input id="input-3" type="file" class="file" name="cover_img_array[]" data-show-upload="false" data-show-caption="true" multiple=true>
                                        <div id="errorBlock44" class="help-block"></div>
                                    </div>
                                </div>
                            </fieldset>



                            <div class="da-form-row">
                                <label class="da-form-label">Note <span class="required"></span></label>
                                <div class="da-form-item large">
                                    <textarea name="announce" id="announce" class="span12 tinymce"><?php echo ($announce->GetPrimary() != '') ? $announce->GetValue('announce') : ''; ?></textarea>
                                    <label for="announce" generated="true" class="error" style="display:none;"></label>
                                </div>
                            </div>



                        </div>
                        <div class="btn-row">
                            <input type="submit" name="submit_bt" value="บันทึกข้อมูล" class="btn btn-success" />
                            <input type="submit" name="submit_bt" value="บันทึกข้อมูล และแก้ไขต่อ" class="btn btn-primary" />
                            <a href="<?php echo ADDRESS_ADMIN_CONTROL ?>announce" class="btn btn-danger">ยกเลิก</a> </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php } else { ?>
    <div class="row-fluid">
        <div class="span12">
    <?php
    // Report errors to the user
    Alert(GetAlert('error'));
    Alert(GetAlert('success'), 'success');
    ?>
            <div class="da-panel collapsible">
                <div class="da-panel-header"> <span class="da-panel-title"> <i class="icol-grid"></i> ข้อมูลทั้งหมด </span> </div>
                <div class="da-panel-toolbar">
                    <div class="btn-toolbar">
                        <div class="btn-group">
                            <a class="btn" href="<?php echo ADDRESS_ADMIN_CONTROL ?>announce&action=add"><i class="icol-add"></i> เพิ่มข้อมูล</a>
                            <button class="btn" id="myBtn"><i class="icol-find"></i> ค้นหาวันเกิด</button>
                            <?php if($_POST['selectMonth'] != ''){
                                $thai_month_arr = array(
                                    "0"=>"",
                                    "1"=>"มกราคม",
                                    "2"=>"กุมภาพันธ์",
                                    "3"=>"มีนาคม",
                                    "4"=>"เมษายน",
                                    "5"=>"พฤษภาคม",
                                    "6"=>"มิถุนายน",
                                    "7"=>"กรกฎาคม",
                                    "8"=>"สิงหาคม",
                                    "9"=>"กันยายน",
                                    "10"=>"ตุลาคม",
                                    "11"=>"พฤศจิกายน",
                                    "12"=>"ธันวาคม"
                                );
                                ?>
                            <a class="btn"  id=""><b style="padding-left: 10px; font-size: 14px;color: blue; text-decoration: none;"> <?=$_POST['selectMonth'] != '' ? ' เดือนที่เลือก : '. $thai_month_arr[$_POST['selectMonth']]:'' ?></b></a>
                                <?php }?>
                         </div>

                    </div>
                </div>



                <div class="da-panel-content da-table-container" style=" overflow-x: scroll; white-space: nowrap; ">


                    <table id="da-ex-datatable-sort" class="da-table" sort="0" order="asc" width="1000">
                        <thead>
                            <tr>
                                <th>ลำดับ</th>
                                <th>รูป</th>
                                <th style="min-width: 150px;">ชื่อ-สกุล</th>
                                <th>เพศ</th>
                                <th style="min-width: 150px;"><img style="display:none;" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDI5NiAyOTYiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI5NiAyOTYiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiPgogIDxnPgogICAgPHBhdGggZD0ibTI0NS4zMjgsMjU2LjMzNGMtMTQuOTk5LDAtMjIuOTUyLTYuNTU5LTI5LjM0Mi0xMS44MjgtNS43NTMtNC43NDQtOS45MDktOC4xNzItMTkuMTYyLTguMTcyLTkuMjUxLDAtMTMuNDA3LDMuNDI4LTE5LjE1OSw4LjE3Mi02LjM4OSw1LjI3LTE0LjM0MSwxMS44MjgtMjkuMzM5LDExLjgyOC0xNC45OTgsMC0yMi45NS02LjU1OS0yOS4zNC0xMS44MjgtNS43NTMtNC43NDQtOS45MDgtOC4xNzItMTkuMTYtOC4xNzItOS4yNSwwLTEzLjQwNiwzLjQyOC0xOS4xNTcsOC4xNzItNi4zOSw1LjI3LTE0LjM0MiwxMS44MjgtMjkuMzQsMTEuODI4LTE0Ljk5OCwwLTIzLjM2Ni02LjU1OS0yOS43NTUtMTEuODI4LTEuOTMyLTEuNTk0LTMuNTc0LTMuMDMyLTUuNTc0LTQuMjQ5djU1Ljc0M2gyNjR2LTU2LjAxNWMtMiwxLjI3MS0zLjY2OSwyLjgwOC01Ljc0Nyw0LjUyMS02LjM4OSw1LjI2OS0xMy45MjYsMTEuODI4LTI4LjkyNSwxMS44Mjh6IiBmaWxsPSIjMDAwMDAwIi8+CiAgICA8cGF0aCBkPSJtMTYsMTgxdjQxLjU5OWM3LDIuMzc4IDExLjcwOSw2LjIyNyAxNS43NTUsOS41NjMgNS43NTEsNC43NDQgMTAuMTE1LDguMTcyIDE5LjM2NSw4LjE3MiA5LjI1MSwwIDEzLjUxMS0zLjQyOCAxOS4yNjMtOC4xNzIgNi4zODktNS4yNyAxNC4zOTMtMTEuODI4IDI5LjM5LTExLjgyOCAxNC45OTgsMCAyMi45NzYsNi41NTkgMjkuMzY2LDExLjgyOCA1Ljc1Myw0Ljc0NCA5LjkyMSw4LjE3MiAxOS4xNzMsOC4xNzIgOS4yNTEsMCAxMy40MTQtMy40MjggMTkuMTY2LTguMTcyIDYuMzg5LTUuMjcgMTQuMzQ0LTExLjgyOCAyOS4zNDItMTEuODI4IDE0Ljk5OSwwIDIyLjk1NCw2LjU1OSAyOS4zNDMsMTEuODI4IDUuNzUzLDQuNzQ0IDkuOTEsOC4xNzIgMTkuMTYzLDguMTcyIDkuMjUyLDAgMTIuOTkzLTMuNDI4IDE4Ljc0Ni04LjE3MiA0LjIxNi0zLjQ3NyA4LjkyNi03LjUwMiAxNS45MjYtOS44NDh2LTQxLjMxNGgtMjYzLjk5OHoiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxyZWN0IHdpZHRoPSIxOTgiIHg9IjQ5IiB5PSI5OSIgaGVpZ2h0PSI2NSIgZmlsbD0iIzAwMDAwMCIvPgogICAgPHBhdGggZD0iTTkwLDQ3LjQyNmM1LTIuODE2LDguNjY1LTguMjE5LDguNjY1LTE0LjQyNmMwLTkuMTEyLTE2LjQxNy0zMy0xNi40MTctMzNTNjUuNjI0LDIzLjg4OCw2NS42MjQsMzMgICBjMCw2LjIwOSwzLjM3NiwxMS42MTEsOC4zNzYsMTQuNDI3VjgyaDE2VjQ3LjQyNnoiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxwYXRoIGQ9Ik0xNTYsNDcuMTIzYzUtMi44ODksOC4xNjctOC4xMjQsOC4xNjctMTQuMTIzYzAtOS4xMTItMTYuNDE3LTMzLTE2LjQxNy0zM3MtMTYuNjI1LDIzLjg4OC0xNi42MjUsMzMgICBjMCw2LjQwOCwzLjg3NCwxMS45NTEsOC44NzQsMTQuNjg0VjgyaDE2VjQ3LjEyM3oiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxwYXRoIGQ9Ik0yMjIsNDcuNDI2YzUtMi44MTYsOC42NjUtOC4yMTksOC42NjUtMTQuNDI2YzAtOS4xMTItMTYuNDE3LTMzLTE2LjQxNy0zM3MtMTYuNjI1LDIzLjg4OC0xNi42MjUsMzMgICBjMCw2LjIwOSwzLjM3NiwxMS42MTEsOC4zNzYsMTQuNDI3VjgyaDE2VjQ3LjQyNnoiIGZpbGw9IiMwMDAwMDAiLz4KICA8L2c+Cjwvc3ZnPgo=" /> วันเกิด</th>

                                <th style="min-width: 150px;">วันที่บันทึก</th>
                                <th style="min-width: 150px;">แก้ไขล่าสุด</th>
                                <th>ตัวเลือก</th>
                            </tr>
                        </thead>
                        <tbody>
    <?php

    if($_POST['selectMonth'] != ''){
        $sql = "SELECT * FROM " . $announce->getTbl() . " WHERE MONTH(activity_date) = ".$_POST['selectMonth']." ORDER BY DAY(activity_date) ASC";
    }else{
        $sql = "SELECT * FROM " . $announce->getTbl() . " ORDER BY id";
    }

    $query = $db->Query($sql);
    $no = 1;
    while ($row = $db->FetchArray($query)) {
        list($y,$m,$d) = explode('-', $row['activity_date']);
        if (date('m') == $m){
            $classBirthDay = '#9bf4ff';
            $showImgCake = '<img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDI5NiAyOTYiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI5NiAyOTYiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiPgogIDxnPgogICAgPHBhdGggZD0ibTI0NS4zMjgsMjU2LjMzNGMtMTQuOTk5LDAtMjIuOTUyLTYuNTU5LTI5LjM0Mi0xMS44MjgtNS43NTMtNC43NDQtOS45MDktOC4xNzItMTkuMTYyLTguMTcyLTkuMjUxLDAtMTMuNDA3LDMuNDI4LTE5LjE1OSw4LjE3Mi02LjM4OSw1LjI3LTE0LjM0MSwxMS44MjgtMjkuMzM5LDExLjgyOC0xNC45OTgsMC0yMi45NS02LjU1OS0yOS4zNC0xMS44MjgtNS43NTMtNC43NDQtOS45MDgtOC4xNzItMTkuMTYtOC4xNzItOS4yNSwwLTEzLjQwNiwzLjQyOC0xOS4xNTcsOC4xNzItNi4zOSw1LjI3LTE0LjM0MiwxMS44MjgtMjkuMzQsMTEuODI4LTE0Ljk5OCwwLTIzLjM2Ni02LjU1OS0yOS43NTUtMTEuODI4LTEuOTMyLTEuNTk0LTMuNTc0LTMuMDMyLTUuNTc0LTQuMjQ5djU1Ljc0M2gyNjR2LTU2LjAxNWMtMiwxLjI3MS0zLjY2OSwyLjgwOC01Ljc0Nyw0LjUyMS02LjM4OSw1LjI2OS0xMy45MjYsMTEuODI4LTI4LjkyNSwxMS44Mjh6IiBmaWxsPSIjMDAwMDAwIi8+CiAgICA8cGF0aCBkPSJtMTYsMTgxdjQxLjU5OWM3LDIuMzc4IDExLjcwOSw2LjIyNyAxNS43NTUsOS41NjMgNS43NTEsNC43NDQgMTAuMTE1LDguMTcyIDE5LjM2NSw4LjE3MiA5LjI1MSwwIDEzLjUxMS0zLjQyOCAxOS4yNjMtOC4xNzIgNi4zODktNS4yNyAxNC4zOTMtMTEuODI4IDI5LjM5LTExLjgyOCAxNC45OTgsMCAyMi45NzYsNi41NTkgMjkuMzY2LDExLjgyOCA1Ljc1Myw0Ljc0NCA5LjkyMSw4LjE3MiAxOS4xNzMsOC4xNzIgOS4yNTEsMCAxMy40MTQtMy40MjggMTkuMTY2LTguMTcyIDYuMzg5LTUuMjcgMTQuMzQ0LTExLjgyOCAyOS4zNDItMTEuODI4IDE0Ljk5OSwwIDIyLjk1NCw2LjU1OSAyOS4zNDMsMTEuODI4IDUuNzUzLDQuNzQ0IDkuOTEsOC4xNzIgMTkuMTYzLDguMTcyIDkuMjUyLDAgMTIuOTkzLTMuNDI4IDE4Ljc0Ni04LjE3MiA0LjIxNi0zLjQ3NyA4LjkyNi03LjUwMiAxNS45MjYtOS44NDh2LTQxLjMxNGgtMjYzLjk5OHoiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxyZWN0IHdpZHRoPSIxOTgiIHg9IjQ5IiB5PSI5OSIgaGVpZ2h0PSI2NSIgZmlsbD0iIzAwMDAwMCIvPgogICAgPHBhdGggZD0iTTkwLDQ3LjQyNmM1LTIuODE2LDguNjY1LTguMjE5LDguNjY1LTE0LjQyNmMwLTkuMTEyLTE2LjQxNy0zMy0xNi40MTctMzNTNjUuNjI0LDIzLjg4OCw2NS42MjQsMzMgICBjMCw2LjIwOSwzLjM3NiwxMS42MTEsOC4zNzYsMTQuNDI3VjgyaDE2VjQ3LjQyNnoiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxwYXRoIGQ9Ik0xNTYsNDcuMTIzYzUtMi44ODksOC4xNjctOC4xMjQsOC4xNjctMTQuMTIzYzAtOS4xMTItMTYuNDE3LTMzLTE2LjQxNy0zM3MtMTYuNjI1LDIzLjg4OC0xNi42MjUsMzMgICBjMCw2LjQwOCwzLjg3NCwxMS45NTEsOC44NzQsMTQuNjg0VjgyaDE2VjQ3LjEyM3oiIGZpbGw9IiMwMDAwMDAiLz4KICAgIDxwYXRoIGQ9Ik0yMjIsNDcuNDI2YzUtMi44MTYsOC42NjUtOC4yMTksOC42NjUtMTQuNDI2YzAtOS4xMTItMTYuNDE3LTMzLTE2LjQxNy0zM3MtMTYuNjI1LDIzLjg4OC0xNi42MjUsMzMgICBjMCw2LjIwOSwzLjM3NiwxMS42MTEsOC4zNzYsMTQuNDI3VjgyaDE2VjQ3LjQyNnoiIGZpbGw9IiMwMDAwMDAiLz4KICA8L2c+Cjwvc3ZnPgo=" />';
        }else{
            $classBirthDay = 'transparent';
            $showImgCake = '';
        }

        ?>
                                <tr style="background: <?=$classBirthDay ?>;">
                                    <td class="center"><?php echo $no++ ?></td>
                                    <td style="text-align:center; max-width:100px;"><a class="fancybox" href="<?php echo $row['cover_img'] == '' ? NO_IMAGE : ADDRESS_COVER . $row["cover_img"] ?>">
        <?php echo $row['cover_img'] == '' ? '<img class="img_cover img-polaroid" src=' . NO_IMAGE . '>' : '<img class="img_cover img-polaroid" src=' . ADDRESS_COVER . $row["cover_img"] . '>' ?></a></td>
                                    <td style="min-width: 150px;"><div class="word-wrap"><?php echo $showImgCake.' '. $row['announce_title']; ?></div></td>
                                    <td class="center"><?php echo $row['sex']; ?></td>
                                    <td class="center" style="min-width: 150px;">
                                        <div class="word-wrap">
                                            <?php



                                            echo  ($y+543).'-'. $m.'-'.$d;




                                            ?>

                                        </div>
                                    </td>
                                    <td class="center" style="min-width: 150px;"><div class="word-wrap"><?php echo ($row['created_at']) ?></div></td>
                                    <td class="center" style="min-width: 150px;"><div class="word-wrap"><?php echo ($row['updated_at']) ?></div></td>

                                    <td class="center"><div class="word-wrap"> <a href="<?php echo ADDRESS_ADMIN_CONTROL ?>announce&action=edit&id=<?php echo $row['id'] ?>" class="btn btn-primary btn-small">แก้ไข / ดู</a> <a href="#" onclick="if(confirm('คุณต้องการลบข้อมูลนี้หรือใม่?') == true) {
                                                document.location.href = '<?php echo ADDRESS_ADMIN_CONTROL ?>announce&action=del&id=<?php echo $row['id'] ?>'
                                                        }" class="btn btn-danger btn-small">ลบ</a> </div></td>
                                </tr>
                                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

<?php } ?>
<script src="<?php echo ADDRESS_ADMIN ?>plugins/fileinput/js/fileinput.min.js" type="text/javascript"></script>
<script src="<?php echo ADDRESS_ADMIN ?>plugins/fileinput/js/fileinput_locale_th.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

<script type="text/javascript">
                                            $('#short_announce').maxlength({max: 300});
                                            $("#input-2").fileinput({
                                                language: "th",
                                                allowedFileExtensions: ["jpg", "gif", "png"],
                                                elErrorContainer: "#errorBlock43",
                                            });
                                            $("#input-3").fileinput({
                                                language: "th",
                                                allowedFileExtensions: ["jpg", "gif", "png"],
                                                elErrorContainer: "#errorBlock44",
                                            });
                                            $("#input-4").fileinput({
                                                language: "th",
                                                elErrorContainer: "#errorBlock45",
                                            });


                                            $(document).ready(function () {


                                                $(".fancybox").fancybox({
                                                    prevEffect: 'none',
                                                    nextEffect: 'none',
                                                    closeBtn: false,
                                                    helpers: {
                                                        title: {type: 'inside'},
                                                        buttons: {}
                                                    }
                                                });



                                            });


</script>
<!--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">-->


    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 999; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    </head>




    <!-- Trigger/Open The Modal -->


    <!-- The Modal -->
<style>

</style>
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <form action="" method="POST">

                <fieldset>

                    <legend>เลือกเดือน</legend>

                    <ul class=form-fields>

                        <li>
                            <select name="selectMonth" id="">
                                <option value="1">มกราคม</option>
                                <option value="2">กุมภาพันธ์</option>
                                <option value="3">มีนาคม</option>
                                <option value="4">เมษายน</option>
                                <option value="5">พฤษภาคม</option>
                                <option value="6">มิถุนายน</option>
                                <option value="7">กรกฎาคม</option>
                                <option value="8">สิงหาคม</option>
                                <option value="9">กันยายน</option>
                                <option value="10">ตุลาคม</option>
                                <option value="11">พฤศจิกายน</option>
                                <option value="12">ธันวาคม</option>
                            </select>
                            <button class="btn btn-primary btn-small" type="submit">Submit</button>
                        </li>


                    </ul>

                </fieldset>


            </form>

        </div>

    </div>

    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal
        btn.onclick = function() {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>



<script>
    $(function () {

      //  $("#activity_date").datepicker({dateFormat: "yy-mm-dd"}).val()
    });
</script>
<style>
    /*Colored Label Attributes*/
    .label {
        background-color: #BFBFBF;
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        color: #FFFFFF;
        font-size: 9.75px;
        font-weight: bold;
        padding-bottom: 2px;
        padding-left: 4px;
        padding-right: 4px;
        padding-top: 2px;
        text-transform: uppercase;
        white-space: nowrap;
    }

    .label:hover {
        opacity: 80;
    }

    .label.success {
        background-color: #46A546;
    }
    .label.success2 {
        background-color: #CCC;
    }
    .label.success3 {
        background-color: #61a4e4;

    }

    .label.warning {
        background-color: #FC9207;
    }

    .label.failure {
        background-color: #D32B26;
    }

    .label.alert {
        background-color: #33BFF7;
    }

    .label.good-job {
        background-color: #9C41C6;
    }
    table th{
        overflow : auto;
    }



    .myButton {
        -moz-box-shadow: 3px 4px 0px 0px #8a2a21;
        -webkit-box-shadow: 3px 4px 0px 0px #8a2a21;
        box-shadow: 3px 4px 0px 0px #8a2a21;
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24437));
        background:-moz-linear-gradient(top, #c62d1f 5%, #f24437 100%);
        background:-webkit-linear-gradient(top, #c62d1f 5%, #f24437 100%);
        background:-o-linear-gradient(top, #c62d1f 5%, #f24437 100%);
        background:-ms-linear-gradient(top, #c62d1f 5%, #f24437 100%);
        background:linear-gradient(to bottom, #c62d1f 5%, #f24437 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24437',GradientType=0);
        background-color:#c62d1f;
        -moz-border-radius:18px;
        -webkit-border-radius:18px;
        border-radius:18px;
        border:1px solid #d02718;
        display:inline-block;
        cursor:pointer;
        color:#ffffff;
        font-family:Arial;
        font-size:17px;
        padding:7px 25px;
        text-decoration:none;
        text-shadow:0px 1px 0px #810e05;
    }
    .myButton:hover {
        background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24437), color-stop(1, #c62d1f));
        background:-moz-linear-gradient(top, #f24437 5%, #c62d1f 100%);
        background:-webkit-linear-gradient(top, #f24437 5%, #c62d1f 100%);
        background:-o-linear-gradient(top, #f24437 5%, #c62d1f 100%);
        background:-ms-linear-gradient(top, #f24437 5%, #c62d1f 100%);
        background:linear-gradient(to bottom, #f24437 5%, #c62d1f 100%);
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24437', endColorstr='#c62d1f',GradientType=0);
        background-color:#f24437;
        color: white;
    }
    .myButton:active {
        position:relative;
        top:1px;
    }


</style>
