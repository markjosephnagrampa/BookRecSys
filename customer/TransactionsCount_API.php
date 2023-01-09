<?php
	require("../DB_Connect.php");

    if(isset($_POST["TransactionsCount"])){

        // Get item count for pagination
        $sql = "select count(*) as count from transactions where user_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["user_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $myObj->count = $row["count"];
        }
        
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>