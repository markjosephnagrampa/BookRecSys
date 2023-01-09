<?php
	require("../DB_Connect.php");

    if(isset($_POST["MarkShipped"])){

        $myObj = new stdClass();
        $myObj->response = "edit failure";
        $sql = "update transactions set status = 'Shipped' where transaction_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["transaction_ID"]);

        if ($stmt->execute() === TRUE) {
            $myObj->response = "edit success";
        }
        
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>