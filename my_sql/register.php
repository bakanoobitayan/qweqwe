<?php
include 'conn.php';

$id = $_POST['id'];
$username = $_POST["username"];
$password = $_POST["password"];
$level = $_POST["level"];
	
$connect ->query("INSERT into user_tbl (id,username,password,level) VALUES('$id','$username','$password','$level')");
//$result = $queryResult->execute();
if($connect){
	echo "NALABAY!";
}
else{
	echo "WAY PULOS!";
}
$connect->close();

?>