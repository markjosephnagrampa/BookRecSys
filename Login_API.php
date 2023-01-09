<?php
	require("DB_Connect.php");

    if(isset($_POST["Login"])){				
		$myObj = new stdClass();
        $sql = "SELECT * from users where email_address = ? and password = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $_POST["email"], hash('sha256',$_POST["password"]));
        $stmt->execute();
        $result = $stmt->get_result();

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
?>