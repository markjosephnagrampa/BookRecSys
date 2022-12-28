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

    if(isset($_POST["AddToCart"])){
        $myObj = new stdClass();
        $myObj->response="add to cart failure";
        $sql0 = "select books.stock_qty from books where books.book_ID='".$_POST["book_ID"]."'";
        $result0 = $conn->query($sql0);
        while($row0 = $result0->fetch_assoc()) {
            $netQty = $row0["stock_qty"] - $_POST["qty"];
            if($netQty >= 0){
                $sql2 = "select price from books where books.book_ID = '".$_POST["book_ID"]."'";
                $result2 = $conn->query($sql2);
                while($row2 = $result2->fetch_assoc()) {
                    // change quantity of cart item if book is already in cart
                    $sql3 = "select count(*) as num from cart_items where book_ID = '".$_POST["book_ID"]."' and user_ID = '".$_POST["user_ID"]."'";
                    $result3 = $conn->query($sql3);
                    while($row3 = $result3->fetch_assoc()) {
                        if($row3["num"] == 0){
                            $sql3 = "insert into cart_items (user_ID,book_ID,qty) values ('".$_POST["user_ID"]."','".$_POST["book_ID"]."','".$_POST["qty"]."')";
                            $last_id = -1;
                            if ($conn->query($sql3) === TRUE) {
                                $last_id = $conn->insert_id;
                                $sql4 = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values ('".$_POST["user_ID"]."','".$_POST["book_ID"]."','3','".date("Y-m-d H:i:s")."','0')";
                                $last_id = -1;
                                if ($conn->query($sql4) === TRUE) {
                                    $last_id = $conn->insert_id;
                                    // calculate popularity score
                                    $popScore = 0;
                                    $clickScore = 0;
                                    $r_clickScore = 0;
                                    $addToCartScore = 0;
                                    $purchaseScore = 0;
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
                                    $result5 = $conn->query($sql5);
                                    while($row5 = $result5->fetch_assoc()) {
                                        $clickScore = $row5["qty"] * 1;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
                                    $result5 = $conn->query($sql5);
                                    while($row5 = $result5->fetch_assoc()) {
                                        $r_clickScore = $row5["qty"] * 1;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
                                    $result5 = $conn->query($sql5);
                                    while($row5 = $result5->fetch_assoc()) {
                                        $addToCartScore = $row5["qty"] * 2;
                                    }
                                    $sql5 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`='".$_POST["book_ID"]."' and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
                                    $result5 = $conn->query($sql5);
                                    while($row5 = $result5->fetch_assoc()) {
                                        $purchaseScore = $row5["qty"] * 3;
                                    }
                                    $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
                                    $sql5 = "update books set popularity_score = '".$popScore."' where books.book_ID = '".$_POST["book_ID"]."'";
                                    if ($conn->query($sql5) === TRUE) {
                                        $myObj->response="add to cart success";
                                    }
                                }
                            }
                        }
                        else if($row3["num"] == 1){
                            $sql4 = "select cart_item_ID, qty from cart_items where book_ID = '".$_POST["book_ID"]."' and user_ID = '".$_POST["user_ID"]."'";
                            $result4 = $conn->query($sql4);
                            while($row4 = $result4->fetch_assoc()) {
                                $newQty = $row4["qty"] + $_POST["qty"];
                                $sql5 = "update cart_items set qty = '".$newQty."' where cart_item_ID = '".$row4["cart_item_ID"]."'";
                                if ($conn->query($sql5) === TRUE) {
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

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
    }
?>