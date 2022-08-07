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
	
    // Clean POST inputs and remove all single quotes
	foreach ($_POST as $a => $b) {
		$_POST[$a] = test_input($b);
	}

    if(isset($_POST["GetBookDetails"])){
        $myObj = new stdClass();
        
        // Get Category
        $sql = "select * from books where books.book_ID = '".$_POST["book_ID"]."'";

        $result = $conn->query($sql);
        $myObj->book = new stdClass();
        while($row = $result->fetch_assoc()) {
            $myObj->book->title = $row["title"];
            $myObj->book->ISBN = $row["ISBN"];
            $myObj->book->price = $row["price"];
            $myObj->book->publication_year = $row["publication_year"];
            $myObj->book->description = $row["description"];
            $myObj->book->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"];
            $myObj->book->stock_qty = $row["stock_qty"];
        }
        $sql = "select * from books join categories on books.category_ID = categories.category_ID where books.book_ID = '".$_POST["book_ID"]."'";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->book->category = $row["category_name"];
        }
        $sql = "select * from books join formats on books.format_ID = formats.format_ID where books.book_ID = '".$_POST["book_ID"]."'";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->book->format = $row["format_name"];
        }
        $sql = "select * from books join publishers on books.publisher_ID = publishers.publisher_ID where books.book_ID = '".$_POST["book_ID"]."'";
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->book->publisher = $row["publisher_name"];
        }
        $sql = "select * from books join book_authors on books.book_ID = book_authors.book_ID join authors on book_authors.author_ID = authors.author_ID where books.book_ID = '".$_POST["book_ID"]."'";
        $myObj->authors = array();
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            array_push($myObj->authors, $row["author_name"]);
        }
        $sql = "select * from books join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID where books.book_ID = '".$_POST["book_ID"]."'";
        $myObj->genres = array();
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            array_push($myObj->genres, $row["genre_name"]);
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
    }
?>