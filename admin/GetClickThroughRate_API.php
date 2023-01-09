<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetClickThroughRate"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $myObj->r_clicks = 0;
    $myObj->impressions = 0;
    $sql = "select count(*) as r_clicks from events where MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and event_type_ID = 2 and is_deleted = 0";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->r_clicks = $row["r_clicks"];
    }

    $sql = "select count as impressions from impressions where MONTH(date) = ? and YEAR(date) = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->impressions += $row["impressions"];
    }

    $date->modify('-1 month');

    $myObj->prev_month_r_clicks = 0;
    $myObj->prev_month_impressions = 0;
    
    $sql = "select count(*) as prev_month_r_clicks from events where MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and event_type_ID = 2 and is_deleted = 0";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_r_clicks = $row["prev_month_r_clicks"];
    }

    $sql = "select count as prev_month_impressions from impressions where MONTH(date) = ? and YEAR(date) = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_impressions += $row["prev_month_impressions"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>