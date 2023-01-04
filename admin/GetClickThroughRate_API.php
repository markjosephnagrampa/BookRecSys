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

    if(isset($_POST["GetClickThroughRate"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $myObj->r_clicks = 0;
    $myObj->impressions = 0;
    $sql = "select count(*) as r_clicks from events where MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and event_type_ID = 2 and is_deleted = 0";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->r_clicks = $row["r_clicks"];
    }

    $sql = "select count as impressions from impressions where MONTH(date) = '".$date->format("m")."' and YEAR(date) = '".$date->format("Y")."'";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->impressions += $row["impressions"];
    }

    $date->modify('-1 month');

    $myObj->prev_month_r_clicks = 0;
    $myObj->prev_month_impressions = 0;
    $sql = "select count(*) as prev_month_r_clicks from events where MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and event_type_ID = 2 and is_deleted = 0";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_r_clicks = $row["prev_month_r_clicks"];
    }

    $sql = "select count as prev_month_impressions from impressions where MONTH(date) = '".$date->format("m")."' and YEAR(date) = '".$date->format("Y")."'";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_impressions += $row["prev_month_impressions"];
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