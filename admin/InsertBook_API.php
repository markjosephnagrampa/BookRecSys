<?php
	session_start();
	date_default_timezone_set('Etc/GMT-8'); // Set time zone to Philippine time
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "bookrecsys";

     // Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	  die("Connection failed: " . $conn->connect_error);
	}
	
    // Clean POST inputs
	foreach ($_POST as $a => $b) {
		$a = test_input($b);
	}

    if(isset($_POST["InsertBook"])){
        $myObj = new stdClass();

        // 1. Get Publisher ID if it exists or insert a new publisher if it doesn't.
        $publisher_ID = -1;
        $sql = "SELECT * from publishers where publisher_name = '".$_POST["publisher"]."'";
        $result = $conn->query($sql);
        if ($result->num_rows == 1) {
            while($row = $result->fetch_assoc()) {
                $publisher_ID = $row["publisher_ID"];
                break;
            }
        }
        else{
            $sql = "INSERT into publishers (publisher_name) VALUES ('".$_POST["publisher"]."')";
            $last_id = -1;
			if ($conn->query($sql) === TRUE) {
                $last_id = $conn->insert_id;
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
        $sql = "SELECT * from formats where format_name = '".$_POST["format"]."'";
        $result = $conn->query($sql);
        if ($result->num_rows == 1) {
            while($row = $result->fetch_assoc()) {
                $format_ID = $row["format_ID"];
                break;
            }
        }
        else{
            $sql = "INSERT into formats (format_name) VALUES ('".$_POST["format"]."')";
            $last_id = -1;
			if ($conn->query($sql) === TRUE) {
                $last_id = $conn->insert_id;
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
            $sql = "SELECT * from authors where author_name = '".$author."'";
            $result = $conn->query($sql);
            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    array_push($author_IDs, $row["author_ID"]);
                    break;
                }
            }
            else{
                $sql = "INSERT into authors (author_name) VALUES ('".$author."')";
                $last_id = -1;
                if ($conn->query($sql) === TRUE) {
                    $last_id = $conn->insert_id;
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
            $sql = "SELECT * from genres where genre_name = '".$genre."'";
            $result = $conn->query($sql);
            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    array_push($genre_IDs, $row["genre_ID"]);
                    break;
                }
            }
            else{
                $sql = "INSERT into genres (genre_name) VALUES ('".$genre."')";
                $last_id = -1;
                if ($conn->query($sql) === TRUE) {
                    $last_id = $conn->insert_id;
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
            $sql = "SELECT * from categories where category_name = '".$_POST["category"]."'";
            $result = $conn->query($sql);
            if ($result->num_rows == 1) {
                while($row = $result->fetch_assoc()) {
                    $category_ID = $row["category_ID"];
                    break;
                }
            }
            else{
                $sql = "INSERT into categories (category_name) VALUES ('".$_POST["category"]."')";
                $last_id = -1;
                if ($conn->query($sql) === TRUE) {
                    $last_id = $conn->insert_id;
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
        if($category_ID == -1){
            $category_ID = NULL;
        }

        // 5.1. Remove all single quotes in description field.

        $_POST["description"] = preg_replace('/\'/','',$_POST["description"]);

        $sql = "INSERT into books (category_ID,publisher_ID,format_ID,ISBN,title,price,publication_year,description,cover_image_loc,stock_qty,is_for_training,is_deleted)
                VALUES ('".$category_ID."','".$publisher_ID."','".$format_ID."','".$_POST["isbn"]."','".$_POST["title"]."','".$_POST["price"]."','".$_POST["publication_year"]."','".$_POST["description"]."',' ','".$_POST["stock_qty"]."','1','0')
        ";

        $last_id = -1;
        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
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
        } 
        else {
            $myObj->response="The selected file is not an image.";
            $myObj->error=1;

            $myJSON = json_encode($myObj);
            echo $myJSON;
            $conn->close();
            exit();
        }
        
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

        // 7. Edit book record to include image location.
        if(file_exists($destination)){
            $sql = "UPDATE books SET cover_image_loc = '".$destination."' WHERE book_ID = '".$last_id."'";
            if ($conn->query($sql) === TRUE) {
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
        foreach($author_IDs as $ID){
            $sql = "INSERT into book_authors (book_ID,author_ID) VALUES ('".$last_id."','".$ID."')";
            if ($conn->query($sql) === TRUE) {
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
        foreach($genre_IDs as $ID){
            $sql = "INSERT into book_genres (book_ID,genre_ID) VALUES ('".$last_id."','".$ID."')";
            if ($conn->query($sql) === TRUE) {
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
        $myObj->response="Book inserted successfully!";
        $myObj->error=0;
        
        $myJSON = json_encode($myObj);
        echo $myJSON;
        $conn->close();
        exit();

    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    
?>