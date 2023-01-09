<?php
	require("DB_Connect.php");

    if(isset($_POST["Register"])){
        $myObj = new stdClass();

        $sql = "SELECT * from users where email_address = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $_POST["email"]);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $myObj->response = "email taken";
            $myJSON = json_encode($myObj);
            echo $myJSON;	
            $conn->close();
            exit();
        }

        else {
            $last_id = -1;
            $sql = "INSERT INTO users (first_name,last_name,email_address,password,is_active,is_deleted,is_admin,date_inserted)
								VALUES (?,?,?,?,'1','0','0',?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssss", $_POST["first_name"], $_POST["last_name"], $_POST["email_address"], hash('sha256',$_POST["password"]), date("Y-m-d"));
			
			if ($stmt->execute() === TRUE) {
				$last_id = $stmt->insert_id;
                $sql2 = "SELECT * from users where user_ID = ?";
                $stmt = $conn->prepare($sql2);
                $stmt->bind_param("i", $last_id);
                $stmt->execute();
                $result2 = $stmt->get_result();

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
?>