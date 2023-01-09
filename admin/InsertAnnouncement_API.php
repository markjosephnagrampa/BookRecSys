<?php
	require("../DB_Connect.php");

    if(isset($_POST["InsertAnnouncement"])){

    // format javascript timestamp to sql datetime
    $_POST["message_expiry"] = str_replace("T"," ",$_POST["message_expiry"]);
    $_POST["message_expiry"] .= ":00";

    $sql = "insert into announcements (user_ID,message,message_expiry) VALUES (?,?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iss", $_POST["user_ID"], $_POST["message"], $_POST["message_expiry"]);

    if ($stmt->execute() === TRUE) {
        $myObj->error=0;
    }
    else{
        $myObj->error=1;
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>