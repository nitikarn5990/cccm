
<div class="title3">
    <h1>ประกาศของอบต.</h1>
</div>
<div class="clear">&nbsp;</div>

<div class="titlenews">
    <div class="newsleft">เรือง</div>
    <div class="newsright">วันที่</div>
    <div class="clear"></div>
</div>




<!-- pagination -->

<?php
$strSQL = "SELECT * FROM " . $announce->getTbl() . " WHERE status = 'ใช้งาน' ";

$objQuery = $db->Query($strSQL);
$Num_Rows = $db->NumRows($objQuery);

$Per_Page = 10;   // Per Page

$Page = $_GET["Page"];
if (!$_GET["Page"]) {
    $Page = 1;
}

$Prev_Page = $Page - 1;
$Next_Page = $Page + 1;

$Page_Start = (($Per_Page * $Page) - $Per_Page);
if ($Num_Rows <= $Per_Page) {
    $Num_Pages = 1;
} else if (($Num_Rows % $Per_Page) == 0) {
    $Num_Pages = ($Num_Rows / $Per_Page);
} else {
    $Num_Pages = ($Num_Rows / $Per_Page) + 1;
    $Num_Pages = (int) $Num_Pages;
}

$strSQL .= " order  by id DESC LIMIT $Page_Start , $Per_Page";
$objQuery = mysql_query($strSQL);

while ($row = $db->FetchArray($objQuery)) {
    ?>
 
    <div class="news">
        <div class="newslefttxt">
            <img src="<?= ADDRESS ?>images/arow-positive.jpg" width="8" height="7" /> 
            <a href="<?= ADDRESS ?>detail-announce/<?= $row['id'] ?>.html"><?= $row['announce_title'] ?></a>
        </div>
        <div class="newsrighttxt"><?= $functions->ShowDateTh($row['created_at']) ?></div>
        <div class="clear"></div>
    </div>

<?php } ?>


<div style="font-weight:bold;">
    <br>
    Total <?php echo $Num_Rows; ?> Record 

    <?php
    $pages = new Paginator;
    $pages->items_total = $Num_Rows;
    $pages->mid_range = 10;
    $pages->current_page = $Page;
    $pages->default_ipp = $Per_Page;
    $pages->url_next = ADDRESS_CONTROL . "announce&Page=";

    $pages->paginate();

    echo $pages->display_pages()
    ?>	
</div>	
<!-- End pagination -->
