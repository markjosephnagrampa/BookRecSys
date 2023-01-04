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

    if(isset($_POST["Register"])){
        $myObj = new stdClass();

        $sql = "SELECT * from users where email_address = '".$_POST["email_address"]."'
				";
        
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $myObj->response = "email taken";
            $myJSON = json_encode($myObj);
            echo $myJSON;	
            $conn->close();
            exit();
        }

        else {
            $sql = "INSERT INTO users (first_name,last_name,email_address,password,is_active,is_deleted,is_admin,date_inserted)
								VALUES ('".$_POST["first_name"]."','".$_POST["last_name"]."','".$_POST["email_address"]."','"
                                .hash('sha256',$_POST["password"])."','1','0','0','".date("Y-m-d")."')";
						
			$last_id = -1;
			if ($conn->query($sql) === TRUE) {
				$last_id = $conn->insert_id;
                $sql2 = "SELECT * from users where user_ID = '".$last_id."'
				";
                $result2 = $conn->query($sql2);
                if ($result2->num_rows == 1) {
                    $myObj->response = "register success";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
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
    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
      }
?>