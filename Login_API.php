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

    if(isset($_POST["Login"])){				
		$myObj = new stdClass();

        $sql = "SELECT * from users where email_address = '".$_POST["email"]."' and password = '".hash('sha256',$_POST["password"])."'
				";

        $result = $conn->query($sql);

        if ($result->num_rows == 1) {
            while($row = $result->fetch_assoc()) {
                // If account was deactivated, prevent login
                if($row["is_active"] == false){
                    $myObj->response = "inactive account";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
                else if($row["is_deleted"] == true){
                    $myObj->response = "deleted account";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
                else{
                    $myObj->user = new stdClass();
                    if($row["is_admin"] == true){
                        $myObj->user->user_ID = $row["user_ID"];
                        $myObj->user->first_name = $row["first_name"];
                        $myObj->user->last_name = $row["last_name"];
                        $myObj->user->email_address = $row["email_address"];
                        $myObj->user->is_admin = $row["is_admin"];
                    }
                    else{
                        $myObj->user->user_ID = $row["user_ID"];
                        $myObj->user->first_name = $row["first_name"];
                        $myObj->user->last_name = $row["last_name"];
                        $myObj->user->email_address = $row["email_address"];
                        $myObj->user->city = $row["city"];
                        $myObj->user->state = $row["state"];
                        $myObj->user->country = $row["country"];
                        $myObj->user->is_admin = $row["is_admin"];
                    }
                    $myObj->response = "login success";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
            }
        }
        else{
            $myObj->response = "invalid credentials";
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
        $data = preg_replace('/\'/',"",$data);
        return $data;
      }
?>