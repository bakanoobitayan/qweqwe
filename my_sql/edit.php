<?php
	include 'conn.php';
	
	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	$connect->query("UPDATE user_tbl SET username='".$username."', password='".$password."' WHERE id=". $id);
	if($connect){
		echo "NA EDIT NA!";
	}
?>	