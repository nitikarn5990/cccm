<?php

if ($_POST ["submit_bt"] == 'Send') {

	

	$arrData = array ();

	

	$arrData = $functions->replaceQuote ( $_POST );

	

	$contact_message->SetValues ( $arrData );

	

	if ($contact_message->GetPrimary () == '') {

		

		$contact_message->SetValue ( 'created_at', DATE_TIME );

		

		$contact_message->SetValue ( 'updated_at', DATE_TIME );

	} else {

		

		$contact_message->SetValue ( 'updated_at', DATE_TIME );

	}

	$contact_message->SetValue ( 'status', 'no read' );

	

	// $contact_message->Save();

	

	if ($contact_message->Save ()) {

echo "<script> alert('ส่งข้อความสำเร็จ'); </script>";

	} else {

		

		echo "<script> alert('ส่งข้อความไม่สำเร็จ ลองใหม่อีกครั้ง!!'); </script>";

	}

}



?>

<div class="title1">
  <h1><?php echo $contact->getDataDescFirstID('contact_title')?></h1>
</div>
<div class="content"> <?php echo $contact->getDataDescFirstID('contact_detail')?> </div>
<div class="google_map">
<?php echo $contact_map->getDataDescFirstID('google_map')?>
</div>

<form action="<?php echo ADDRESS?>contact.html" method="post">

  <p> ชื่อ - นามสกุล<br />
    <span>
    <input type="text" name="txt_name"

				class="input" required="required" />
    </span> </p>
  <p> Email.<br />
    <span>
    <input type="email" name="txt_email" class="input"

				required="required" />
    </span> </p>
  <p> เบอร์โทร<br />
    <span>
    <input type="text" name="txt_tel"

				class="input" required="required" />
    </span> </p>
  <p> หัวข้อ<br />
    <span>
    <input type="text" name="txt_subject"

				class="input" required="required" />
    </span> </p>
  <p> ข้อความ<br />
    <span>
    <textarea name="txt_message" class="area"

					required="required" rows="7" cols="50"></textarea>
    </span> </p>
  <p>
    <input id="submit_bt" name="submit_bt" type="submit" value="Send"

				style="width: 80px; height: 30px;" />
    <input name="reset"

				type="reset" value="Reset" style="width: 80px; height: 30px;" />
  </p>
</form>
<style>
iframe{ max-width:100%; }
</style>
