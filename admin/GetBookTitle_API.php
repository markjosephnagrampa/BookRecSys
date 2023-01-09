<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetBookTitle"])){
        $myObj = new stdClass();

        $sql = "select title from books where book_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["book_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $myObj->title = $row["title"];
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>