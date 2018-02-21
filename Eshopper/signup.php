<?php
	$servername = "localhost";
	$username = "root";
	$password = "root";


	$conn = new mysqli($servername, $username, $password);
	if ($conn->connect_error) {
	 	die("Connection failed: " . $conn->connect_error);
	}
	$sql = "CREATE DATABASE IF NOT EXISTS dealcoholic";
	if ($conn->query($sql) === TRUE) {
    		$sqlu = "USE dealcoholic";
    		$conn->query($sqlu);
	} else {
		echo "Error creating database: " . $conn->error;
	}
	$user = $_POST["userid"];
	$first = $_POST["first"];
	$last = $_POST["last"];
	$addr = $_POST["addr"];
	
	$city = $_POST["city"];
	$state = $_POST["state"];
	$zip = $_POST["zip"];
	$spass = $_POST["spass"];
	$email = $_POST["email"];
	$pnum = $_POST["pnum"];
	$sqln = "INSERT INTO zipname (zip, city, state) VALUES ('$zip', '$city', '$state')";
	
	if ($conn->query($sqln) === TRUE) {
	
		 $sqli = "INSERT INTO customer (userid, password, firstname, lastname, address, zip, email, phonenumber)
	VALUES ('$user', '$spass', '$first', '$last', '$addr', '$zip', '$email', '$pnum')";
		if ($conn->query($sqli) === TRUE) {
    			header("Location:afterlogin.php?user=".$_POST["userid"]);
    		}
    		else {
    		echo "Error: " . $sql . "<br>" . $conn->error;
		} 
	} else {
    		echo "Error: " . $sql . "<br>" . $conn->error;
	}
	$conn->close();
	
		
?>
