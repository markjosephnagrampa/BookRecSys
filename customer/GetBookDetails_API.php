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
        $sql = "select books.book_ID, books.cover_image_loc, books.title, books.description, books.ISBN, publishers.publisher_name, books.publication_year, formats.format_name, books.stock_qty, books.price from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID where books.book_ID = '".$_POST["book_ID"]."'";

        $result = $conn->query($sql);
        $myObj->book = new stdClass();
        while($row = $result->fetch_assoc()) {
            $myObj->book->book_ID = $row["book_ID"];
            $myObj->book->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->book->title = $row["title"];
            $myObj->book->description = $row["description"];
            $myObj->book->ISBN = $row["ISBN"];
            $myObj->book->publisher_name = $row["publisher_name"];
            $myObj->book->publication_year = $row["publication_year"];
            $myObj->book->format_name = $row["format_name"];
            $myObj->book->in_stock = $row["stock_qty"] > 0 ? "In stock" : "Out of stock";
            $myObj->book->stock_count_text = $row["stock_qty"] > 0 ? "Only " .$row["stock_qty"]. " left" : "None left";
            $myObj->book->stock_count = $row["stock_qty"];
            $myObj->book->price = $row["price"];

            // author list
            $myObj->book->author = "";
            $sql2 = "select `authors`.author_name from `authors` join book_authors on `authors`.author_ID = book_authors.author_ID join books on book_authors.book_ID = books.book_ID where books.book_ID = '".$_POST["book_ID"]."'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $myObj->book->author .= $row2["author_name"] . ", ";
            }
            $myObj->book->author = substr($myObj->book->author,0,strlen($myObj->book->author) - 2);

            //genre list
            $myObj->book->genre = "";
            $sql2 = "select genres.genre_name from genres join book_genres on genres.genre_ID = book_genres.genre_ID join books on book_genres.book_ID = books.book_ID where books.book_ID = '".$_POST["book_ID"]."'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $myObj->book->genre .= $row2["genre_name"] . ", ";
            }
            $myObj->book->genre = substr($myObj->book->genre,0,strlen($myObj->book->genre) - 2);
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