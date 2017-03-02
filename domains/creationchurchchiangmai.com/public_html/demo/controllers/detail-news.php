
		<div class="title3">
        	<h1>ช่าวสารของอบต.</h1>
	  	</div>
        <div class="detail">
        <?=$contents->getDataDesc('contents','id = '.$_GET['id'])?>
        
         <?php 
		   if($contents->getDataDesc('activity_date','id = '.$_GET['id']) != ''){
			   echo '<b>ข่าววันที่ '.$functions->ShowDateTh($contents->getDataDesc('activity_date','id = '.$_GET['id'])).'</b>';
			   
			}
		 
		 ?>
        </div>
        
    