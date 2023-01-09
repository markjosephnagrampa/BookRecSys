<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetFormats"])){
        $sql = "SELECT * from formats";
        $result = $conn->query($sql);
        $myObj->formats = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->formats[$i] = new stdClass();
            $myObj->formats[$i]->format_name = $row["format_name"];
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>