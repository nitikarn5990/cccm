<div class="title3">
    <h1>กิจกรรมอบต.</h1>
</div>
<div class="detail" style="padding-top:10px;">
    <?= $activity->getDataDesc('activity', 'id = ' . $_GET['id']) ?>
    <div class="file">
        <?php
        $strSQL = "SELECT * FROM " . $activity_file->getTbl() . " WHERE activity_id = " . $_GET['id'] . "";
        $objQuery = $db->Query($strSQL);
        $Num_Rows = $db->NumRows($objQuery);
        if ($Num_Rows > 0) {
            while ($row = $db->FetchArray($objQuery)) {
                ?>
                <p>
                    <b>
                        <i class="fa fa-paperclip"></i>ไฟล์แนบ
                        <a target="_blank" href="<?=ADDRESS_DOCUMENT . $row['file_name'] ?>"><?=  $row['file_name'] ?></a>
                    </b>
                </p>
                <?php
            }
        }
        ?>

    </div>
</div>
<?php
if ($activity->getDataDesc('activity_date', 'id = ' . $_GET['id']) != '') {
    echo '<p><b>ประกาศวันที่ ' . $functions->ShowDateTh($activity->getDataDesc('activity_date', 'id = ' . $_GET['id'])) . '</b></p>';
}
?>
        