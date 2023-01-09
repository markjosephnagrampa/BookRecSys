<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetTotalRevenue"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $myObj->total_revenue = 0.0;
    $sql = "select total as total_revenue from transactions where MONTH(datetime) = ? and YEAR(datetime) = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->total_revenue += $row["total_revenue"];
    }

    $date->modify('-1 month');

    $myObj->prev_month_total_revenue = 0.0;
    $sql = "select total as prev_month_total_revenue from transactions where MONTH(datetime) = ? and YEAR(datetime) = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_total_revenue += $row["prev_month_total_revenue"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>