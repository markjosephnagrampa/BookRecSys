<?php
	require("../DB_Connect.php");

    if(isset($_POST["TransactionsCount"])){
        
        $sql = "";
        $stmt = new stdClass();

        if(isset($_POST["date"])){
            $sql = "select count(*) as count from transactions where DATE(datetime) = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $_POST["date"]);  
        }
        else{
            $sql = "select count(*) as count from transactions";
            $stmt = $conn->prepare($sql);
        }
        
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