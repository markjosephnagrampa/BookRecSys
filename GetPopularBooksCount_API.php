<?php
	require("DB_Connect.php");

    if(isset($_POST["GetPopularBooksCount"])){
        // Get item count for pagination
        $sql = "select count(*) as count from books where books.is_deleted = '0'";
        
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->count = $row["count"];
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>