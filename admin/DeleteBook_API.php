<?php
	require("../DB_Connect.php");

    if(isset($_POST["DeleteBook"])){
        $myObj = new stdClass();

        $sql = "update books set is_deleted = '1' where book_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["book_ID"]);

        if($stmt->execute() === TRUE){

            // Delete events pertaining the book
            $sql2 = "update events set is_deleted = '1' where book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);

            if($stmt->execute() === TRUE){
                $myObj->response = "Book deleted successfully.";
                $myObj->error = 0;
            }
            else{
                $myObj->response = "Error deleting book. Please try again.";
                $myObj->error = 1;    
            }
        }
        else{
            $myObj->response = "Error deleting book. Please try again.";
            $myObj->error = 1;
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>