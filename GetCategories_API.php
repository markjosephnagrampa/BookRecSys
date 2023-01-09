<?php
	require("DB_Connect.php");

    if(isset($_POST["GetCategories"])){
        $myObj = new stdClass();
        $myObj->categories = array();
        $sql = "select * from categories order by category_name asc";
        $result = $conn->query($sql);
        $i = 0;
        while($row = $result->fetch_assoc()) {
            $myObj->categories[$i] = new stdClass();
            $myObj->categories[$i]->category_name = $row["category_name"];
            $myObj->categories[$i]->category_ID = $row["category_ID"];
            $sql2 = "select count(*) as count from books where books.category_ID = ? and books.is_deleted = 0";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["category_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            
            while($row2 = $result2->fetch_assoc()) {
                $myObj->categories[$i]->category_count = $row2["count"];
            }
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>