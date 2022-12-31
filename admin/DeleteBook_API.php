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

    if(isset($_POST["DeleteBook"])){
        $myObj = new stdClass();

        $sql = "update books set is_deleted = '1' where book_ID = '".$_POST["book_ID"]."'";
        $result = $conn->query($sql);

        if($result === TRUE){

            // Delete events pertaining the book
            $sql2 = "update events set is_deleted = '1' where book_ID = '".$_POST["book_ID"]."'";
            $result2 = $conn->query($sql2);
            if($result2 === TRUE){
                $myObj->response = "Book deleted successfully.";
                $myObj->error = 0;
            }
            else{
                $myObj->response = "Error deleting book. Please try again.";
                $myObj->error = 1;    
            }
        }
        else{
            $myObj->response = "Error deleting book. Please try again.";
            $myObj->error = 1;
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