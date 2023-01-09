<?php
	require("../DB_Connect.php");

    if(isset($_POST["DecreaseCartItem"])){
        $myObj = new stdClass();
        $myObj->response = "update failure";
        $sql = "update cart_items set qty = qty - 1 where cart_item_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["cart_item_ID"]);
        if ($stmt->execute() === TRUE) {
            $myObj->response = "update success";
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>