<?php
	session_start();
	date_default_timezone_set('Etc/GMT-8'); // Set time zone to Philippine time
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "bookrecsys";

    // Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}

    // Clean POST inputs and remove all single quotes
	foreach ($_POST as $a => $b) {
		$_POST[$a] = test_input($b);
	}

    if(isset($_POST["PurchaseBook"])){
        // edit stock qty, then create transaction, then create transaction items, then edit transaction total, then delete cart items, then record purchase event
        $myObj = new stdClass();
        $myObj->response = "Purchase failure.";

        $sql = "select qty,book_ID from cart_items where user_ID = '".$_POST["user_ID"]."'";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $sql2 = "select title, stock_qty from books where book_ID = '".$row["book_ID"]."'";
            $result2 = $conn->query($sql2);
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

        $sql = "insert into transactions (user_ID,shipping_address,datetime,total,change_for,status) values ('".$_POST["user_ID"]."','".$_POST["shippingAddress"]."','".date("Y-m-d H:i:s")."','0','".$_POST["changeFor"]."','Pending Shipment')";
        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
            $sql2 = "select cart_items.book_ID,cart_items.qty,books.price from cart_items join books on cart_items.book_ID = books.book_ID where cart_items.user_ID = '".$_POST["user_ID"]."'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $subtotal = $row2["price"] * $row2["qty"];
                $sql3 = "insert into transaction_items (transaction_ID,book_ID,qty,subtotal) values ('".$last_id."','".$row2["book_ID"]."','".$row2["qty"]."','".$subtotal."')";
                if ($conn->query($sql3) === TRUE) {
                    $sql4 = "update books set stock_qty = stock_qty - ".$row2["qty"]." where book_ID = '".$row2["book_ID"]."'";
                    if ($conn->query($sql4) === TRUE) {
                        
                    }
                    $sql4 = "update transactions set total = total + ".$subtotal." where transaction_ID = '".$last_id."'";
                    if ($conn->query($sql4) === TRUE) {
                        $sql5 = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values ('".$_POST["user_ID"]."','".$row2["book_ID"]."','4','".date("Y-m-d H:i:s")."','0')";
                        if ($conn->query($sql5) === TRUE) {
                            // calculate popularity score
                            $popScore = 0;
                            $clickScore = 0;
                            $r_clickScore = 0;
                            $addToCartScore = 0;
                            $purchaseScore = 0;
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$row2["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
                            $result6 = $conn->query($sql6);
                            while($row6 = $result6->fetch_assoc()) {
                                $clickScore = $row6["qty"] * 1;
                            }
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$row2["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
                            $result6 = $conn->query($sql6);
                            while($row6 = $result6->fetch_assoc()) {
                                $r_clickScore = $row6["qty"] * 1;
                            }
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$row2["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
                            $result6 = $conn->query($sql6);
                            while($row6 = $result6->fetch_assoc()) {
                                $addToCartScore = $row6["qty"] * 2;
                            }
                            $sql6 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$row2["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
                            $result6 = $conn->query($sql6);
                            while($row6 = $result6->fetch_assoc()) {
                                $purchaseScore = $row6["qty"] * 3;
                            }
                            $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
                            $sql6 = "update books set popularity_score = '".$popScore."' where books.book_ID = '".$row2["book_ID"]."'";
                            if ($conn->query($sql6) === TRUE) {
                                $deleteCart = true;
                            }
                        }
                    }
                }
            }
            if($deleteCart){
                $sql2 = "delete from cart_items where user_ID = '".$_POST["user_ID"]."'";
                if ($conn->query($sql2) === TRUE) {
                    $myObj->response = "purchase success";
                }
            }
        }
        
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
    }
?>