<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetOrderCount"])){
        
        $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
        $date = new DateTime($dStr);

        $sql = "select count(*) as order_count from transactions where MONTH(datetime) = ? and YEAR(datetime) = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $myObj->order_count = $row["order_count"];
        }

        $date->modify('-1 month');

        $sql = "select count(*) as prev_month_order_count from transactions where MONTH(datetime) = ? and YEAR(datetime) = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $myObj->prev_month_order_count = $row["prev_month_order_count"];
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>