<?php
	$servername = "localhost";
	$username = "root";
	$password = "root";


	$conn = new mysqli($servername, $username, $password);
	if ($conn->connect_error) {
	 	die("Connection failed: " . $conn->connect_error);
	}
    	$sqlu = "USE dealcoholic";
    	$conn->query($sqlu);
	$delcustomer = $_GET["user"];
	$sqldel = "delete from customer where userid = '$delcustomer'";
    	$conn->query($sqldel);
	$conn->close();
	header("Location: index.php");
		
?>
