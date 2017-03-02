<div class="announce">
    <div class="title3">
        <h1>ประกาศของอบต.</h1>
    </div>
    <div class="clear">&nbsp;</div>

    <div class="titlenews">
        <div class="newsleft">เรือง</div>
        <div class="newsright">วันที่</div>
        <div class="clear"></div>
    </div>

    <?php
    $strSQL = "SELECT * FROM " . $announce->getTbl() . " WHERE status = 'ใช้งาน' ";

    $strSQL .=" ORDER by id DESC LIMIT 0,4";
    $objQuery = mysql_query($strSQL);
    $i = 0;
    while ($row = $db->FetchArray($objQuery)) {

    if( $i++% 2 == 0){
    $new = 'news';
    }else{
    $new = 'news1';
    }
    ?>

    <div class="<?= $new ?>">
        <div class="newslefttxt">
            <img src="<?= ADDRESS ?>images/arow-positive.jpg" width="8" height="7" /> 
            <a href="<?= ADDRESS ?>detail-announce/<?= $row['id'] ?>.html"><?= $row['announce_title'] ?></a>
        </div>
        <div class="newsrighttxt"><?= $functions->ShowDateTh($row['created_at']) ?></div>
        <div class="clear"></div>
    </div>

    <?php } ?>
    <div class="btreadmore"><a href="<?= ADDRESS ?>announce.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image14', '', 'images/hover-btreadmore.jpg', 1)"><img src="images/btreadmore.jpg" name="Image14" width="117" height="32" border="0" id="Image14" /></a> </div>
</div>


<div class="activity">

    <div class="title2">
        <h1>กิจรรมของอบต.</h1>
    </div>



    <!-- pagination -->

    <?php
    $strSQL = "SELECT * FROM " . $activity->getTbl() . " WHERE status = 'ใช้งาน' ";

    $strSQL .=" order  by id DESC LIMIT 0 , 3";
    $objQuery = mysql_query($strSQL);
   
     while ($row = $db->FetchArray($objQuery)) {
    ?>


    <div class="news">
        <div class="news1img" >
            <?php if($row['cover_img'] != ''){ ?>
            <img src="<?php echo ADDRESS_COVER . $row['cover_img'] ?>" width="235" height="157">
            <?php }else{ ?>
            <img src="<?php echo NO_IMAGE_FONT ?>" width="235" height="157">
            <?php } ?>

        </div>
        <div class="news1txt">
            <strong><?php echo $row['activity_title'] ?></strong>
            <br>
            <div class="">
                <?php
                echo ($row['short_activity']);
                ?>  ...<b>[ <?php echo $functions->ShowDateTh($row['created_at']) ?> ]</b>

            </div>
            <a href="<?php echo ADDRESS . 'detail-activity/'.$row['id'] ?>.html"><strong>[อ่านรายละเอียด]</strong></a>
        </div>
        <div class=" clear"></div>
    </div>

<?php } ?>

    <div class="btreadmore"><a href="<?= ADDRESS ?>activity.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image14', '', 'images/hover-btreadmore.jpg', 1)"><img src="images/btreadmore.jpg" name="Image14" width="117" height="32" border="0" id="Image14" /></a> </div>
</div>
<div class="new">
    <div class="title3">
        <h1>ข่าวสารของอบต.</h1>
    </div>
    <div class="clear">&nbsp;</div>

    <div class="titlenews">
        <div class="newsleft">เรือง</div>
        <div class="newsright">วันที่</div>
        <div class="clear"></div>
    </div>

<?php
$strSQL = "SELECT * FROM " . $contents->getTbl() . " WHERE status = 'ใช้งาน' ";

$strSQL .=" ORDER by id DESC LIMIT 0,4";
$objQuery = mysql_query($strSQL);
$i = 0;
while ($row = $db->FetchArray($objQuery)) {

    if ($i++ % 2 == 0) {
        $new = 'news';
    } else {
        $new = 'news1';
    }
    ?>

        <div class="<?= $new ?>">
            <div class="newslefttxt">
                <img src="<?= ADDRESS ?>images/arow-positive.jpg" width="8" height="7" /> 
                <a href="<?= ADDRESS ?>detail-news/<?= $row['id'] ?>.html"><?= $row['contents_title'] ?></a>
            </div>
            <div class="newsrighttxt"><?= $functions->ShowDateTh($row['created_at']) ?></div>
            <div class="clear"></div>
        </div>

<?php } ?>
    <div class="btreadmore"><a href="<?= ADDRESS ?>news.html" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image14', '', 'images/hover-btreadmore.jpg', 1)"><img src="images/btreadmore.jpg" name="Image14" width="117" height="32" border="0" id="Image14" /></a> </div>
</div>

<style>

    .word-wrap-new {

        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        line-height: 16px;     /* fallback */
        max-height: 157px;      /* fallback */
        -webkit-line-clamp: 2; /* number of lines to show */
        -webkit-box-orient: vertical;

    }
    .uour-div {
        white-space: nowrap;
        width: 150px;
        overflow: hidden;
        text-overflow: ellipsis;
    }


</style>