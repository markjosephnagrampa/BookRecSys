<?php
	require("../DB_Connect.php");
    if(isset($_POST["GetTransactions"])){
        $myObj = new stdClass();
        $offset = 10 * (intval($_POST["Page"]) - 1);
        $myObj->transactions = array();
        $i=0;
        $sql = "select * from transactions where user_ID = ? order by datetime desc limit 10 offset ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ii", $_POST["user_ID"], $offset);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $myObj->transactions[$i] = new stdClass();
            $sql2 = "select qty from transaction_items where transaction_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["transaction_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            $no_of_items = 0;
            while($row2 = $result2->fetch_assoc()) {
                $no_of_items += $row2["qty"];
            }
            $dt = new DateTime($row["datetime"]);
            $date = $dt->format('Y-m-d');
            $myObj->transactions[$i]->date = $date;
            $myObj->transactions[$i]->no_of_items = $no_of_items;
            $myObj->transactions[$i]->total = $row["total"];
            $myObj->transactions[$i]->status = $row["status"];
            $myObj->transactions[$i]->transaction_ID = $row["transaction_ID"];
            $i++;
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>