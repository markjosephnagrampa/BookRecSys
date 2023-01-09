<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetConversionRate"])){

    $dStr = "" . $_POST["year"] . "-" . $_POST["month"] . "-01";
    $date = new DateTime($dStr);

    $clickCount = 0;
    $purchaseCount = 0;
    $sql = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and (event_type_ID = 1 or event_type_ID = 2)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $clickCount++;
        $sql2 = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and event_type_ID = 4 and user_ID = ? and book_ID = ?";
        $stmt = $conn->prepare($sql2);
        $stmt->bind_param("ssii", $date->format("m"), $date->format("Y"), $row["user_ID"], $row["book_ID"]);
        $stmt->execute();
        $result2 = $stmt->get_result();

	    if ($result2->num_rows > 0) {
            $purchaseCount++;
        }
    }
    $myObj->conversion_rate = ($clickCount == 0) ? 0 : $purchaseCount / ($clickCount * 1.0);

    $date->modify('-1 month');

    $clickCount = 0;
    $purchaseCount = 0;
    
    $sql = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and (event_type_ID = 1 or event_type_ID = 2)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $date->format("m"), $date->format("Y"));
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $clickCount++;
        $sql2 = "select * from events where is_deleted = 0 and MONTH(datetime_occurred) = ? and YEAR(datetime_occurred) = ? and event_type_ID = 4 and user_ID = ? and book_ID = ?";
        $stmt = $conn->prepare($sql2);
        $stmt->bind_param("ssii", $date->format("m"), $date->format("Y"), $row["user_ID"], $row["book_ID"]);
        $stmt->execute();
        $result2 = $stmt->get_result();

	    if ($result2->num_rows > 0) {
            $purchaseCount++;
        }
    }
    $myObj->prev_month_conversion_rate = ($clickCount == 0) ? 0 : $purchaseCount / ($clickCount * 1.0);
    $myObj->clickCount = $clickCount;
    $myObj->purchaseCount = $purchaseCount;

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>