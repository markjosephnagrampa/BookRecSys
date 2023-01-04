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

    if(isset($_POST["GetTotalRevenue"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $myObj->total_revenue = 0.0;
    $sql = "select total as total_revenue from transactions where MONTH(datetime) = '".$date->format("m")."' and YEAR(datetime) = '".$date->format("Y")."'";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->total_revenue += $row["total_revenue"];
    }

    $date->modify('-1 month');

    $myObj->prev_month_total_revenue = 0.0;
    $sql = "select total as prev_month_total_revenue from transactions where MONTH(datetime) = '".$date->format("m")."' and YEAR(datetime) = '".$date->format("Y")."'";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_total_revenue += $row["prev_month_total_revenue"];
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