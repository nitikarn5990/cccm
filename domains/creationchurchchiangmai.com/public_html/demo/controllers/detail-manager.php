
     
		<div class="title1">
        <?php
		  $manager_categories_id =   $manager->getDataDesc('manager_categories_id','id = '.$_GET['id']);
		   $name_categories = $manager_categories->getDataDesc('manager_categories','id='.$manager_categories_id);
		  ?>
        	<h1>โครงสร้าง<?=$name_categories?></h1>
	  	</div>
        <div class="detail" style="padding-top:10px;">
        
        <?=$manager->getDataDesc('manager','id = '.$_GET['id'])?>
      
        </div>
        
    
