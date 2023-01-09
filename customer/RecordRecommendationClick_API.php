<?php
	require("../DB_Connect.php");

    if(isset($_POST["RecordRecommendationClick"])){
        $myObj = new stdClass();
        $sql = "";
        if(strcmp($_POST["isRecommended"], "false") == 0){
            $sql = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values (?,?,'1',?,'0')";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iis", $_POST["user_ID"], $_POST["book_ID"],date("Y-m-d H:i:s"));
        }
        else{
            $sql = "insert into events (user_ID,book_ID,event_type_ID,datetime_occurred,is_deleted) values (?,?,'2',?,'0')";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iis", $_POST["user_ID"], $_POST["book_ID"],date("Y-m-d H:i:s"));
        }
        $last_id = -1;
        if ($stmt->execute() === TRUE) {
            $last_id = $stmt->insert_id;
            
            // calculate popularity score
            $popScore = 0;
            $clickScore = 0;
            $r_clickScore = 0;
            $addToCartScore = 0;
            $purchaseScore = 0;
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='1'";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $clickScore = $row2["qty"] * 1;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='2'";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $r_clickScore = $row2["qty"] * 1;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='3'";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $addToCartScore = $row2["qty"] * 2;
            }
            $sql2 = "select count(distinct(`events`.`user_ID`)) as qty from `events` where `events`.`book_ID`= ? and `events`.`is_deleted`='0' and `events`.`event_type_ID`='4'";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $purchaseScore = $row2["qty"] * 3;
            }
            $popScore = $clickScore + $r_clickScore + $addToCartScore + $purchaseScore;
            $sql2 = "update books set popularity_score = ? where books.book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("ii",$popScore, $_POST["book_ID"]);
            if ($stmt->execute() === TRUE) {
                $myObj->response="click event recorded";
            }
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>