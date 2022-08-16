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

    if(isset($_POST["GetBooks"])){
        $offset = 10 * (intval($_POST["Page"]) - 1);
        $searchText = (isset($_POST["searchText"])) ? $_POST["searchText"] : "";
        $sql = "select distinct books.cover_image_loc, books.title, publishers.publisher_name, books.price, books.stock_qty, books.book_ID from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID join book_authors on books.book_ID = book_authors.book_ID join `authors` on book_authors.author_ID = `authors`.author_ID join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID left join categories on books.category_ID = categories.category_ID where (LOWER(books.title) like '%".$searchText."%' or LOWER(books.ISBN) like '%".$searchText."%' or LOWER(books.price) like '%".$searchText."%' or LOWER(books.publication_year) like '%".$searchText."%' or LOWER(publishers.publisher_name) like '%".$searchText."%' or LOWER(formats.format_name) like '%".$searchText."%' or LOWER(`authors`.author_name) like '%".$searchText."%' or LOWER(genres.genre_name) like '%".$searchText."%' or LOWER(categories.category_name) like '%".$searchText."%') and books.is_deleted = '0' order by books.title asc limit 10 offset " . $offset;
        $result = $conn->query($sql);
        $myObj->books = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            $myObj->books[$i]->publisher_name = $row["publisher_name"];
            $myObj->books[$i]->price = $row["price"];
            $myObj->books[$i]->stock_qty = $row["stock_qty"];
            $myObj->books[$i]->book_ID = $row["book_ID"];
            $i++;
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