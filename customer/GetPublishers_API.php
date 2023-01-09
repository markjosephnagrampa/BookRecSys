<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetPublishers"])){
        $myObj = new stdClass();
        $myObj->publishers = array();
        $sql = "select * from publishers order by publisher_name asc";
        $result = $conn->query($sql);
        $i = 0;
        while($row = $result->fetch_assoc()) {
            $myObj->publishers[$i] = new stdClass();
            $myObj->publishers[$i]->publisher_name = $row["publisher_name"];
            $myObj->publishers[$i]->publisher_ID = $row["publisher_ID"];
            $sql2 = "select count(*) as count from books where books.publisher_ID = ? and books.is_deleted = 0";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["publisher_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $myObj->publishers[$i]->publisher_count = $row2["count"];
            }
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>