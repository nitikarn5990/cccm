
    <div class="title2">
        <h1>กิจรรมของอบต.</h1>
    </div>

    
    
<!-- pagination -->

<?php
$strSQL = "SELECT * FROM " . $activity->getTbl() . " WHERE status = 'ใช้งาน' ";

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

$strSQL .=" order  by id DESC LIMIT $Page_Start , $Per_Page";
$objQuery = mysql_query($strSQL);

 while ($row = $db->FetchArray($objQuery)) {
    ?>


        <div class="news">
        <div class="news1img" >
        <?php
        if($row['cover_img'] != ''){ ?>
			 <img src="<?php echo ADDRESS_COVER . $row['cover_img']?>" width="235" height="157">
		<?php }else{ ?>
       	<img src="<?php echo NO_IMAGE_FONT ?>" width="235" height="157">
       <?php }?>
        
        </div>
        <div class="news1txt">
        <strong><?php echo $row['activity_title']?></strong>
        <br>
        <div class="">
             <?php 
			 echo ($row['short_activity']);
   				
			 ?>  ...<b>[ <?php echo $functions->ShowDateTh($row['activity_date'])?> ]</b>
             
          </div>
            <a href="<?php echo ADDRESS . 'detail-activity/'.$row['id']?>.html"><strong>[อ่านรายละเอียด]</strong></a>
        </div>
        <div class=" clear"></div>
    </div>

<?php  }?>


<div style="font-weight:bold;">
    <br>
    Total <?php echo $Num_Rows; ?> Record 

<?php
$pages = new Paginator;
$pages->items_total = $Num_Rows;
$pages->mid_range = 10;
$pages->current_page = $Page;
$pages->default_ipp = $Per_Page;
$pages->url_next = ADDRESS_CONTROL . "activity&Page=";

$pages->paginate();

echo $pages->display_pages()
?>	
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