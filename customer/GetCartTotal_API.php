<?php
	require("../DB_Connect.php");
    if(isset($_POST["GetCartTotal"])){
        $myObj = new stdClass();
        $total = 0.00;
        $sql = "select books.price, cart_items.qty from cart_items join books on cart_items.book_ID = books.book_ID where cart_items.user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["user_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();
        while($row = $result->fetch_assoc()) {
            $total += $row["price"] * $row["qty"];
        }
        $myObj->total = $total;
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>