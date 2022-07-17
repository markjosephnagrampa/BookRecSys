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
	
    // Clean POST inputs
	foreach ($_POST as $a => $b) {
		$a = test_input($b);
	}

    if(isset($_POST["GetAnnouncements"])){				
		$myObj = new stdClass();
        $myObj->announcements = array();
    }

    $sql = "SELECT * from announcements where message_expiry > '".date("Y-m-d H:i:s")."'
				";

    $result = $conn->query($sql);

    $i = 0;
    while($row = $result->fetch_assoc()) {
        $myObj->announcements[$i] = new stdClass();
        foreach ($row as $key => $value) {
            $myObj->announcements[$i]->$key = $value;
        }
        $i++;
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
      }
?>