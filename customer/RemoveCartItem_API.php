<?php
	require("../DB_Connect.php");

    if(isset($_POST["RemoveCartItem"])){
        $myObj = new stdClass();
        $myObj->response = "delete failure";
        $sql = "delete from cart_items where cart_item_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["cart_item_ID"]);
        if ($stmt->execute() === TRUE) {
            $myObj->response = "delete success";
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>