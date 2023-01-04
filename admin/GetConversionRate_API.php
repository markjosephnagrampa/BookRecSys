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

    if(isset($_POST["GetConversionRate"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $clickCount = 0;
    $purchaseCount = 0;
    $sql = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and (event_type_ID = 1 or event_type_ID = 2)";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $clickCount++;
        $sql2 = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and event_type_ID = 4 and user_ID = '".$row["user_ID"]."' and book_ID = '".$row["book_ID"]."'";
        $result2 = $conn->query($sql2);
	    if ($result2->num_rows > 0) {
            $purchaseCount++;
        }
    }
    $myObj->conversion_rate = ($clickCount == 0) ? 0 : $purchaseCount / ($clickCount * 1.0);

    $date->modify('-1 month');

    $clickCount = 0;
    $purchaseCount = 0;
    $sql = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and (event_type_ID = 1 or event_type_ID = 2)";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $clickCount++;
        $sql2 = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = '".$date->format("m")."' and YEAR(datetime_occurred) = '".$date->format("Y")."' and event_type_ID = 4 and user_ID = '".$row["user_ID"]."' and book_ID = '".$row["book_ID"]."'";
        $result2 = $conn->query($sql2);
	    if ($result2->num_rows > 0) {
            $purchaseCount++;
        }
    }
    $myObj->prev_month_conversion_rate = ($clickCount == 0) ? 0 : $purchaseCount / ($clickCount * 1.0);
    $myObj->clickCount = $clickCount;
    $myObj->purchaseCount = $purchaseCount;

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