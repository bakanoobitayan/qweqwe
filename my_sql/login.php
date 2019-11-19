<?php
include 'conn.php';

$username = $_POST["username"];
$password = $_POST["password"];
//echo $username;
//var_dump($_POST);
$queryResult = $connect ->query("SELECT * FROM user_tbl WHERE username='".$username."' and password='".$password."'");

$result = array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>