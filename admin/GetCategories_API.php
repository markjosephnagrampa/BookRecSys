<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetCategories"])){
        $sql = "SELECT * from categories";
        $result = $conn->query($sql);
        $myObj->categories = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->categories[$i] = new stdClass();
            $myObj->categories[$i]->category_name = $row["category_name"];
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
    
?>