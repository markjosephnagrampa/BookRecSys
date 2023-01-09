<?php
	require("../DB_Connect.php");

    if(isset($_POST["EditProfile"])){
        $myObj = new stdClass();

        $sql = "SELECT * from users where email_address = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $_POST["email_address"]);
        $stmt->execute();
        $result = $stmt->get_result();
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
        $last_id = -1;
        $sql = "UPDATE users SET first_name = ?, last_name = ?, email_address = ?, password = ? WHERE user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssi", $_POST["first_name"], $_POST["last_name"], $_POST["email_address"], hash('sha256',$_POST["password"]), $_POST["user_ID"]);
        
        if ($stmt->execute() === TRUE) {
            $last_id = $_POST["user_ID"];
            $sql2 = "SELECT * from users WHERE user_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["user_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
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
?>