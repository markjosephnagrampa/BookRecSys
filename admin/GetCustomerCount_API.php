<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetCustomerCount"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $sql = "select count(*) as customer_count from users where is_admin = 0 and MONTH(date_inserted) = ? and YEAR(date_inserted) = ? and is_deleted = 0";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->customer_count = $row["customer_count"];
    }

    $date->modify('-1 month');

    $sql = "select count(*) as prev_month_customer_count from users where is_admin = 0 and MONTH(date_inserted) = ? and YEAR(date_inserted) = ? and is_deleted = 0";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->prev_month_customer_count = $row["prev_month_customer_count"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>