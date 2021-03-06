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
		$_POST[$a] = test_input($b);
	}

    if(isset($_POST["GetCategories"])){
        $sql = "SELECT * from categories";
        $result = $conn->query($sql);
        $myObj->categories = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->categories[$i] = new stdClass();
            $myObj->categories[$i]->category_name = $row["category_name"];
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
        return $data;
    }
    
?>