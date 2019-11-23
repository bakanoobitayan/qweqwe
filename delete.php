<?php
	include 'conn.php';

	$id=$_POST['id'];

	$connect->query("DELETE FROM user_tbl WHERE id=".$id);

	if($connect){
		echo "na delete na!";
	}
	else{
		echo "wa na delete!";
	}
	$connect->close();
?>