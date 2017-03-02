
<?php
$strSQL = "SELECT * FROM " . $manager->getTbl() . " WHERE status = 'ใช้งาน'";

$objQuery = $db->Query($strSQL);
$Num_Rows = $db->NumRows($objQuery);
$objQuery = mysql_query($strSQL);

while ($row = $db->FetchArray($objQuery)) {
    ?>

    <div class="title1">
        <h1><?= $manager_categories->getDataDesc('manager_categories', 'id=' . $row['manager_categories_id']) ?> </h1>
    </div>
    <div class="detail" style="padding-top:10px;">

        <?=$row['manager'] ?>    
    </div>


<?php } ?>
																												
