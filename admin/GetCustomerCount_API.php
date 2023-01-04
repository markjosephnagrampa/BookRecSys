<?php
	session_start();
	date_default_timezone_set('Etc/GMT-8'); // Set time zone to Philippine time
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "bookrecsys";

    // Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}
	
    // Clean POST inputs and remove all single quotes
	foreach ($_POST as $a => $b) {
		$_POST[$a] = test_input($b);
	}

    if(isset($_POST["GetCustomerCount"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $sql = "select count(*) as customer_count from users where is_admin = 0 and MONTH(date_inserted) = '".$date->format("m")."' and YEAR(date_inserted) = '".$date->format("Y")."' and is_deleted = 0";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->customer_count = $row["customer_count"];
    }

    $date->modify('-1 month');

    $sql = "select count(*) as prev_month_customer_count from users where is_admin = 0 and MONTH(date_inserted) = '".$date->format("m")."' and YEAR(date_inserted) = '".$date->format("Y")."' and is_deleted = 0";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_customer_count = $row["prev_month_customer_count"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
    }
?>