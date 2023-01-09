<?php
	require("../DB_Connect.php");

    if(isset($_POST["EditBook"])){
        $myObj = new stdClass();

        // 1. Get Publisher ID if it exists or insert a new publisher if it doesn't.
        $publisher_ID = -1;
        $sql = "SELECT * from publishers where publisher_name = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $_POST["publisher"]);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            while($row = $result->fetch_assoc()) {
                $publisher_ID = $row["publisher_ID"];
                break;
            }
        }
        else{
            $sql = "INSERT into publishers (publisher_name) VALUES (?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $_POST["publisher"]);
            $last_id = -1;

			if ($stmt->execute() === TRUE) {
                $last_id = $stmt->insert_id;
                $publisher_ID = $last_id;
            }
            else{
                $myObj->response="Error inserting publisher record. Please try again.";
                $myObj->error=1;
                
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
        }
        // 2. Get Format ID if it exists or insert a new format if it doesn't.
        $format_ID = -1;
        $sql = "SELECT * from formats where format_name = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $_POST["format"]);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 1) {
            while($row = $result->fetch_assoc()) {
                $format_ID = $row["format_ID"];
                break;
            }
        }
        else{
            $sql = "INSERT into formats (format_name) VALUES (?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $_POST["format"]);
            $last_id = -1;
			if ($stmt->execute() === TRUE) {
                $last_id = $stmt->insert_id;
                $format_ID = $last_id;
            }
            else{
                $myObj->response="Error inserting format record. Please try again.";
                $myObj->error=1;
                
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
        }

        // 3. Get Author IDs if they exist or insert new authors if they don't.
        $author_IDs = array();
        foreach($_POST["author"] as $author){
            $sql = "SELECT * from authors where author_name = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $author);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    array_push($author_IDs, $row["author_ID"]);
                    break;
                }
            }
            else{
                $sql = "INSERT into authors (author_name) VALUES (?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $author);
                $last_id = -1;
                if ($stmt->execute() === TRUE) {
                    $last_id = $stmt->insert_id;
                    array_push($author_IDs, $last_id);
                }
                else{
                    $myObj->response="Error inserting author record. Please try again.";
                    $myObj->error=1;
                    
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                    $conn->close();
                    exit();
                }
            }
        }
        // 3. Get Genre IDs if they exist or insert new genres if they don't.
        $genre_IDs = array();
        foreach($_POST["genre"] as $genre){
            $sql = "SELECT * from genres where genre_name = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $genre);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    array_push($genre_IDs, $row["genre_ID"]);
                    break;
                }
            }
            else{
                $sql = "INSERT into genres (genre_name) VALUES (?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $genre);
                $last_id = -1;
                if ($stmt->execute() === TRUE) {
                    $last_id = $stmt->insert_id;
                    array_push($genre_IDs, $last_id);
                }
                else{
                    $myObj->response="Error inserting genre record. Please try again.";
                    $myObj->error=1;
                    
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                    $conn->close();
                    exit();
                }
            }
        }
        // 4. If category is filled out, get either its corresponding ID or newly inserted ID.
        $category_ID = -1;
        if($_POST["category"] != ""){
            $sql = "SELECT * from categories where category_name = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $_POST["category"]);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    $category_ID = $row["category_ID"];
                    break;
                }
            }
            else{
                $sql = "INSERT into categories (category_name) VALUES (?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("s", $_POST["category"]);
                $last_id = -1;
                if ($stmt->execute() === TRUE) {
                    $last_id = $stmt->insert_id;
                    $category_ID = $last_id;
                }
                else{
                    $myObj->response="Error inserting category. Please try again.";
                    $myObj->error=1;
                    
                    $myJSON = json_encode($myObj);
                    echo $myJSON;
                    $conn->close();
                    exit();
                }
            }
        }
        // 5. Insert book record.

        // 5.1. Truncate description if it's too long.
        if(strlen($_POST["description"]) > 1000){
            $_POST["description"] = substr($_POST["description"],0,997)."...";
        }

        $sql = "";
        $stmt = new stdClass();
        
        if($category_ID == -1){
            $sql = "update books set publisher_ID = ?, format_ID = ?, ISBN = ?, title = ?, price = ?, publication_year = ?, description = ?, stock_qty = ? where book_ID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iissdisii", $publisher_ID, $format_ID, $_POST["isbn"], $_POST["title"], $_POST["price"], $_POST["publication_year"], $_POST["description"], $_POST["stock_qty"], $_POST["book_ID"]);
        }
        else{
            $sql = "update books set category_ID = ?, publisher_ID = ?, format_ID = ?, ISBN = ?, title = ?, price = ?, publication_year = ?, description = ?, stock_qty = ? where book_ID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iiissdisii", $category_ID, $publisher_ID, $format_ID, $_POST["isbn"], $_POST["title"], $_POST["price"], $_POST["publication_year"], $_POST["description"], $_POST["stock_qty"], $_POST["book_ID"]);
        }

        $last_id = -1;
        if ($stmt->execute() === TRUE) {
            $last_id = $_POST["book_ID"];
        }
        else{
            $myObj->response="Error inserting book record. Please try again.";
            $myObj->error=1;
            
            $myJSON = json_encode($myObj);
            echo $myJSON;
            $conn->close();
            exit();
        }
        // 6. Copy cover image to server.
        $target_dir = "../img/books/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
        $fileName = $target_dir . $last_id;
        $destination = $target_dir . $last_id .".". $imageFileType;

        // Check if image file is a actual image or fake image
        $check = getimagesize($_FILES["image"]["tmp_name"]);
        
        if($check !== false) {
            $uploadOk = 1;

            // Check if file exists
            $img_extensions = array("tiff","pjp","jfif","gif","svg","bmp","png","jpeg","svgz","jpg","webp","ico","xbm","dib","tif","pjpeg","avif");
            
            foreach ($img_extensions as $extension) {
                if(file_exists($fileName.".".$extension)){
                    if (!unlink($fileName.".".$extension)) {
                    }
                    else {
                    }
                }
            }					

            // Check file size
            if ($_FILES["image"]["size"] > 10000000) {
                $myObj->response="The file you selected is too large.";
                $myObj->error=1;
                    
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }

            // Allow certain file formats
            $isValidExtension = false;
            foreach ($img_extensions as $extension) {
                if($imageFileType == $extension){
                    $isValidExtension = true;
                    break;
                }
            }
            
            if(!$isValidExtension){
                $myObj->response="Invalid file extension!";
                $myObj->error=1;

                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
            // if everything is ok, try to upload file
            else {
                if (move_uploaded_file($_FILES["image"]["tmp_name"], $destination)) {
                    
                } else {

                }
            }
        } 
        else {

        }

        // 7. Edit book record to include image location.
        if(file_exists($destination)){
            $sql = "UPDATE books SET cover_image_loc = CONCAT(?,'.',?) WHERE book_ID = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssi", $last_id, $imageFileType, $last_id);
            if ($stmt->execute() === TRUE) {
            }
            else{
                $myObj->response="Error setting image location of book record. Please try again.";
                $myObj->error=1;
                
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
        }

        // 8. Insert book_author records.

        // 8.1. Delete existing book_author records.

        $sql = "delete from book_authors where book_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["book_ID"]);

        if ($stmt->execute() === TRUE) {

        }
        else{

        }

        foreach($author_IDs as $ID){

            $sql = "INSERT into book_authors (book_ID,author_ID) VALUES (?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $last_id, $ID);
            
            if ($stmt->execute() === TRUE) {
            }
            else{
                $myObj->response="Error linking book-author records. Please try again.";
                $myObj->error=1;
                
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
        }

        // 9. Insert book_genre records.

        // 9.1. Delete existing book_genre records.

        $sql = "delete from book_genres where book_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["book_ID"]);

        if ($stmt->execute() === TRUE) {
            
        }
        else{

        }

        foreach($genre_IDs as $ID){
            $sql = "INSERT into book_genres (book_ID,genre_ID) VALUES (?,?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $last_id, $ID);

            if ($stmt->execute() === TRUE) {
            }
            else{
                $myObj->response="Error linking book-genre records. Please try again.";
                $myObj->error=1;
                
                $myJSON = json_encode($myObj);
                echo $myJSON;
                $conn->close();
                exit();
            }
        }

        // 10. Return success JSON response
        $myObj->response="Book edited successfully!";
        $myObj->error=0;
        
        $myJSON = json_encode($myObj);
        echo $myJSON;
        $conn->close();
        exit();

    }
    
?>