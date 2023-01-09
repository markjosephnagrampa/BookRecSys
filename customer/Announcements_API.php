<?php
	require("../DB_Connect.php");

  if(isset($_POST["GetAnnouncements"])){				
  $myObj = new stdClass();
      $myObj->announcements = array();

      $sql = "SELECT * from announcements where message_expiry > '".date("Y-m-d H:i:s")."'";

      $result = $conn->query($sql);

      $i = 0;
      while($row = $result->fetch_assoc()) {
          $myObj->announcements[$i] = new stdClass();
          foreach ($row as $key => $value) {
              $myObj->announcements[$i]->$key = $value;
          }
          $i++;
      }

      $myJSON = json_encode($myObj);
      echo $myJSON;	
      $conn->close();
      exit();
  }
?>