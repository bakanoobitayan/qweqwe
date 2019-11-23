<?php
include 'conn.php';

$username = $_POST["username"];
$password = $_POST["password"];
$level = $_POST["level"];
	
$connect ->query("INSERT into user_tbl (username,password,level) VALUES('$username','$password','$level')");
//$result = $queryResult->execute();
if($connect){
	echo "NALABAY!";
}
else{
	echo "WAY PULOS!";
}
$connect->close();

?>