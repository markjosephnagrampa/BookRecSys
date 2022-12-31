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

    if(isset($_POST["GetTransactions"])){
        $myObj = new stdClass();
        $offset = 10 * (intval($_POST["Page"]) - 1);
        $myObj->transactions = array();
        $i=0;
        $sql = "select * from transactions where user_ID = '".$_POST["user_ID"]."' order by datetime desc limit 10 offset " .$offset;
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->transactions[$i] = new stdClass();
            $sql2 = "select qty from transaction_items where transaction_ID = '".$row["transaction_ID"]."'";
            $result2 = $conn->query($sql2);
            $no_of_items = 0;
            while($row2 = $result2->fetch_assoc()) {
                $no_of_items += $row2["qty"];
            }
            $dt = new DateTime($row["datetime"]);
            $date = $dt->format('Y-m-d');
            $myObj->transactions[$i]->date = $date;
            $myObj->transactions[$i]->no_of_items = $no_of_items;
            $myObj->transactions[$i]->total = $row["total"];
            $myObj->transactions[$i]->status = $row["status"];
            $myObj->transactions[$i]->transaction_ID = $row["transaction_ID"];
            $i++;
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