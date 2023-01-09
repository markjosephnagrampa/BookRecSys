<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetFirstUserYear"])){

    $sql = "select YEAR(date_inserted) as year from users order by date_inserted asc limit 1";
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->year = $row["year"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>