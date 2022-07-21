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

    if(isset($_POST["EditProfile"])){
        $myObj = new stdClass();

        $sql = "SELECT * from users where email_address='".$_POST["email_address"]."'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                if($row["user_ID"] != $_POST["user_ID"]){
                    $myObj->response = "email taken";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
            }
        }


        // Update user record
        $sql = "UPDATE users SET first_name='".$_POST["first_name"]."', last_name='".$_POST["last_name"]."'
        , email_address ='".$_POST["email_address"]."', password = '".hash('sha256',$_POST["password"])."' WHERE user_ID = ".$_POST["user_ID"];
        $last_id = -1;
        
        if ($conn->query($sql) === TRUE) {
            $last_id = $_POST["user_ID"];
            $sql2 = "SELECT * from users WHERE user_ID = ".$last_id;
            $result2 = $conn->query($sql2);
            if ($result2->num_rows == 1) {
                while($row = $result2->fetch_assoc()) {
                    $myObj->user = new stdClass();
                    $myObj->user->user_ID = $row["user_ID"];
                    $myObj->user->first_name = $row["first_name"];
                    $myObj->user->last_name = $row["last_name"];
                    $myObj->user->email_address = $row["email_address"];
                    $myObj->user->is_admin = $row["is_admin"];

                    $myObj->response = "edit profile success";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
            }
            else{
                $myObj->response = "db error";
                $myJSON = json_encode($myObj);
                echo $myJSON;	
                $conn->close();
                exit();
            }
        }
        else{
            $myObj->response = "db error";
            $myJSON = json_encode($myObj);
            echo $myJSON;	
            $conn->close();
            exit();
        }
    }
    
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>