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

    if(isset($_POST["SearchBooksCount"])){

    // Get item count for pagination
    $sql = "";
    if(isset($_POST["searchText"])){
        $searchText = $_POST["searchText"];
        $sql = "select count(distinct books.book_ID) as count from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID join book_authors on books.book_ID = book_authors.book_ID join `authors` on book_authors.author_ID = `authors`.author_ID join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID left join categories on books.category_ID = categories.category_ID where (LOWER(books.title) like '%".$searchText."%' or LOWER(books.ISBN) like '%".$searchText."%' or LOWER(books.price) like '%".$searchText."%' or LOWER(books.publication_year) like '%".$searchText."%' or LOWER(publishers.publisher_name) like '%".$searchText."%' or LOWER(formats.format_name) like '%".$searchText."%' or LOWER(`authors`.author_name) like '%".$searchText."%' or LOWER(genres.genre_name) like '%".$searchText."%' or LOWER(categories.category_name) like '%".$searchText."%') and books.is_deleted = '0'";
    }
    else if(isset($_POST["category_ID"])){
        $sql = "select count(distinct books.book_ID) as count from books left join categories on books.category_ID = categories.category_ID where categories.category_ID = '".$_POST["category_ID"]."' and books.is_deleted = '0'";
    }
    else if(isset($_POST["author_ID"])){
        $sql = "select count(distinct books.book_ID) as count from books join book_authors on books.book_ID = book_authors.book_ID join `authors` on `authors`.`author_ID` = book_authors.author_ID where `authors`.author_ID = '".$_POST["author_ID"]."' and books.is_deleted = '0'";
    }
    else if(isset($_POST["genre_ID"])){
        $sql = "select count(distinct books.book_ID) as count from books join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID where genres.genre_ID = '".$_POST["genre_ID"]."' and books.is_deleted = '0'";
    }
    else if(isset($_POST["publisher_ID"])){
        $sql = "select count(distinct books.book_ID) as count from books where books.publisher_ID = '".$_POST["publisher_ID"]."' and books.is_deleted = '0'";
    }
    
    $result = $conn->query($sql);
    while($row = $result->fetch_assoc()) {
        $myObj->count = $row["count"];
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