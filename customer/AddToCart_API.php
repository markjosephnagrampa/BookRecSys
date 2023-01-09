<?php
	require("../DB_Connect.php");

    if(isset($_POST["AddToCart"])){
        $myObj = new stdClass();
        $myObj->response="add to cart failure";
        $sql0 = "select books.stock_qty from books where books.book_ID=?";
        $stmt = $conn->prepare($sql0);
        $stmt->bind_param("i", $_POST["book_ID"]);
        $stmt->execute();
        $result0 = $stmt->get_result();
        while($row0 = $result0->fetch_assoc()) {
            $netQty = $row0["stock_qty"] - $_POST["qty"];
            if($netQty >= 0){
                $sql2 = "select price from books where books.book_ID = ?";
                $stmt = $conn->prepare($sql2);
                $stmt->bind_param("i", $_POST["book_ID"]);
                $stmt->execute();
                $result2 = $stmt->get_result();
                while($row2 = $result2->fetch_assoc()) {
                    // change quantity of cart item if book is already in cart
                    $sql3 = "select count(*) as num from cart_items where book_ID = ? and user_ID = ?";
                    $stmt = $conn->prepare($sql3);
                    $stmt->bind_param("ii", $_POST["book_ID"], $_POST["user_ID"]);
                    $stmt->execute();
                    $result3 = $stmt->get_result();
                    while($row3 = $result3->fetch_assoc()) {
                        if($row3["num"] == 0){
                            $sql3 = "insert into cart_items (user_ID,book_ID,qty) values (?,?,?)";
                            $stmt = $conn->prepare($sql3);
                            $stmt->bind_param("iii", $_POST["user_ID"], $_POST["book_ID"], $_POST["qty"]);
                            $last_id = -1;
                            if ($stmt->execute() === TRUE) {
                                $last_id = $stmt->insert_id;
                                $sql4 = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values (?,?,'3',?,'0')";
                                $stmt = $conn->prepare($sql4);
                                $stmt->bind_param("iis", $_POST["user_ID"], $_POST["book_ID"], date("Y-m-d H:i:s"));
                                $last_id = -1;
                                if ($stmt->execute() === TRUE) {
                                    $last_id = $stmt->insert_id;
                                    // calculate popularity score
                                    $popScore = 0;
                                    $clickScore = 0;
                                    $r_clickScore = 0;
                                    $addToCartScore = 0;
                                    $purchaseScore = 0;
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`=? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
                                    $stmt = $conn->prepare($sql5);
                                    $stmt->bind_param("i", $_POST["book_ID"]);
                                    $stmt->execute();
                                    $result5 = $stmt->get_result();
                                    while($row5 = $result5->fetch_assoc()) {
                                        $clickScore = $row5["qty"] * 1;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`=? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
                                    $stmt = $conn->prepare($sql5);
                                    $stmt->bind_param("i", $_POST["book_ID"]);
                                    $stmt->execute();
                                    $result5 = $stmt->get_result();
                                    while($row5 = $result5->fetch_assoc()) {
                                        $r_clickScore = $row5["qty"] * 1;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`=? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
                                    $stmt = $conn->prepare($sql5);
                                    $stmt->bind_param("i", $_POST["book_ID"]);
                                    $stmt->execute();
                                    $result5 = $stmt->get_result();
                                    while($row5 = $result5->fetch_assoc()) {
                                        $addToCartScore = $row5["qty"] * 2;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`=? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
                                    $stmt = $conn->prepare($sql5);
                                    $stmt->bind_param("i", $_POST["book_ID"]);
                                    $stmt->execute();
                                    $result5 = $stmt->get_result();
                                    while($row5 = $result5->fetch_assoc()) {
                                        $purchaseScore = $row5["qty"] * 3;
                                    }
                                    $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
                                    $sql5 = "update books set popularity_score = ? where books.book_ID = ?";
                                    $stmt = $conn->prepare($sql5);
                                    $stmt->bind_param("ii", $popScore, $_POST["book_ID"]);
                                    if ($stmt->execute() === TRUE) {
                                        $myObj->response="add to cart success";
                                    }
                                }
                            }
                        }
                        else if($row3["num"] == 1){
                            $sql4 = "select cart_item_ID, qty from cart_items where book_ID = ? and user_ID = ?";
                            $stmt = $conn->prepare($sql4);
                            $stmt->bind_param("ii", $_POST["book_ID"], $_POST["user_ID"]);
                            $stmt->execute();
                            $result4 = $stmt->get_result();
                            while($row4 = $result4->fetch_assoc()) {
                                $newQty = $row4["qty"] + $_POST["qty"];
                                $sql5 = "update cart_items set qty = ? where cart_item_ID = ?";
                                $stmt = $conn->prepare($sql5);
                                $stmt->bind_param("ii", $newQty, $row4["cart_item_ID"]);
                                if ($stmt->execute() === TRUE) {
                                    $myObj->response="add to cart success";
                                }
                            }
                        }
                    }
                }
            }
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>