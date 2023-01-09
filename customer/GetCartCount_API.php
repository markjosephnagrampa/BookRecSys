<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetCartCount"])){
        $myObj = new stdClass();
        $count = 0;
        $sql = "select qty from cart_items where user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["user_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()) {
            $count += $row["qty"];
        }
        $myObj->cartCount = $count;
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>