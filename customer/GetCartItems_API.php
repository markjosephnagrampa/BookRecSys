<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetCartItems"])){
        $sql = "select books.cover_image_loc, books.title, cart_items.qty, books.price, cart_items.cart_item_ID from cart_items join books on cart_items.book_ID = books.book_ID where cart_items.user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["user_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();
        $myObj->books = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            $myObj->books[$i]->qty = $row["qty"];
            $myObj->books[$i]->price = $row["price"] * $row["qty"];
            $myObj->books[$i]->cart_item_ID = $row["cart_item_ID"];
            $i++;
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>