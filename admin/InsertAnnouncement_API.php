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

    if(isset($_POST["InsertAnnouncement"])){

    // format javascript timestamp to sql datetime
    $_POST["message_expiry"] = str_replace("T"," ",$_POST["message_expiry"]);
    $_POST["message_expiry"] .= ":00";

    // Get item count for pagination
    $sql = "insert into announcements (user_ID,message,message_expiry) VALUES ('".$_POST["user_ID"]."','".$_POST["message"]."','".$_POST["message_expiry"]."')";

    if ($conn->query($sql) === TRUE) {
        $myObj->error=0;
    }
    else{
        $myObj->error=1;
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