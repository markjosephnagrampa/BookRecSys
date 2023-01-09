<?php
	require("../DB_Connect.php");

    if(isset($_POST["PurchaseBook"])){
        // edit stock qty, then create transaction, then create transaction items, then edit transaction total, then delete cart items, then record purchase event
        $myObj = new stdClass();
        $myObj->response = "Purchase failure.";

        $sql = "select qty,book_ID from cart_items where user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["user_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $sql2 = "select title, stock_qty from books where book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();

            while($row2 = $result2->fetch_assoc()) {
                if($row["qty"] > $row2["stock_qty"]){
                    $myObj->response = $row2["title"] . " has insufficient stocks.";
                    $myJSON = json_encode($myObj);
                    echo $myJSON;	
                    $conn->close();
                    exit();
                }
            }
        }

        $deleteCart = false;

        $sql = "insert into transactions (user_ID,shipping_address,datetime,total,change_for,status) values (?,?,?,'0',?,'Pending Shipment')";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("issd", $_POST["user_ID"], $_POST["shippingAddress"], date("Y-m-d H:i:s"), $_POST["changeFor"]);
        if ($stmt->execute() === TRUE) {
            $last_id = $stmt->insert_id;
            $sql2 = "select cart_items.book_ID,cart_items.qty,books.price from cart_items join books on cart_items.book_ID = books.book_ID where cart_items.user_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["user_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();

            while($row2 = $result2->fetch_assoc()) {
                $subtotal = $row2["price"] * $row2["qty"];
                $sql3 = "insert into transaction_items (transaction_ID,book_ID,qty,subtotal) values (?,?,?,?)";
                $stmt = $conn->prepare($sql3);
                $stmt->bind_param("iiid", $last_id, $row2["book_ID"], $row2["qty"], $subtotal);

                if ($stmt->execute() === TRUE) {
                    $sql4 = "update books set stock_qty = stock_qty - ? where book_ID = ?";
                    $stmt = $conn->prepare($sql4);
                    $stmt->bind_param("ii", $row2["qty"], $row2["book_ID"]);
                    if ($stmt->execute() === TRUE) {
                        
                    }
                    $sql4 = "update transactions set total = total + ? where transaction_ID = ?";
                    $stmt = $conn->prepare($sql4);
                    $stmt->bind_param("di", $subtotal, $last_id);
                    if ($stmt->execute() === TRUE) {
                        $sql5 = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values (?,?,'4',?,'0')";
                        $stmt = $conn->prepare($sql5);
                        $stmt->bind_param("iis", $_POST["user_ID"], $row2["book_ID"], date("Y-m-d H:i:s"));
                        if ($stmt->execute() === TRUE) {
                            // calculate popularity score
                            $popScore = 0;
                            $clickScore = 0;
                            $r_clickScore = 0;
                            $addToCartScore = 0;
                            $purchaseScore = 0;
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
                            $stmt = $conn->prepare($sql6);
                            $stmt->bind_param("i", $row2["book_ID"]);
                            $stmt->execute();
                            $result6 = $stmt->get_result();

                            while($row6 = $result6->fetch_assoc()) {
                                $clickScore = $row6["qty"] * 1;
                            }

                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
                            $stmt = $conn->prepare($sql6);
                            $stmt->bind_param("i", $row2["book_ID"]);
                            $stmt->execute();
                            $result6 = $stmt->get_result();

                            while($row6 = $result6->fetch_assoc()) {
                                $r_clickScore = $row6["qty"] * 1;
                            }
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
                            $stmt = $conn->prepare($sql6);
                            $stmt->bind_param("i", $row2["book_ID"]);
                            $stmt->execute();
                            $result6 = $stmt->get_result();

                            while($row6 = $result6->fetch_assoc()) {
                                $addToCartScore = $row6["qty"] * 2;
                            }
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
                            $stmt = $conn->prepare($sql6);
                            $stmt->bind_param("i", $row2["book_ID"]);
                            $stmt->execute();
                            $result6 = $stmt->get_result();

                            while($row6 = $result6->fetch_assoc()) {
                                $purchaseScore = $row6["qty"] * 3;
                            }

                            $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
                            $sql6 = "update books set popularity_score = ? where books.book_ID = ?";
                            $stmt = $conn->prepare($sql6);
                            $stmt->bind_param("ii", $popScore, $row2["book_ID"]);
                            
                            if ($stmt->execute() === TRUE) {
                                $deleteCart = true;
                            }
                        }
                    }
                }
            }
            if($deleteCart){
                $sql2 = "delete from cart_items where user_ID = ?";
                $stmt = $conn->prepare($sql2);
                $stmt->bind_param("i", $_POST["user_ID"]);
                if ($stmt->execute() === TRUE) {
                    $myObj->response = "purchase success";
                }
            }
        }
        
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>