<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetPublishers"])){
        $sql = "SELECT * from publishers";
        $result = $conn->query($sql);
        $myObj->publishers = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->publishers[$i] = new stdClass();
            $myObj->publishers[$i]->publisher_name = $row["publisher_name"];
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>