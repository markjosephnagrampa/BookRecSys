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

    if(isset($_POST["RecordClick"])){
        $myObj = new stdClass();
        $sql = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values ('".$_POST["user_ID"]."','".$_POST["book_ID"]."','1','".date("Y-m-d H:i:s")."','0')";
        $last_id = -1;
        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
            
            // calculate popularity score
            $popScore = 0;
            $clickScore = 0;
            $r_clickScore = 0;
            $addToCartScore = 0;
            $purchaseScore = 0;
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $clickScore = $row2["qty"] * 1;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $r_clickScore = $row2["qty"] * 1;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $addToCartScore = $row2["qty"] * 2;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $purchaseScore = $row2["qty"] * 3;
            }
            $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
            $sql2 = "update books set popularity_score = '".$popScore."' where books.book_ID = '".$_POST["book_ID"]."'";
            if ($conn->query($sql2) === TRUE) {
                $myObj->response="click event recorded";
            }
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