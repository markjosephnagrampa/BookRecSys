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

    if(isset($_POST["SearchBook"])){
        $offset = 16 * (intval($_POST["Page"]) - 1);

        $sql = "";

        if(isset($_POST["searchText"])){
            $searchText = $_POST["searchText"];
            $sql = "select distinct books.cover_image_loc, books.title, books.price, books.book_ID, books.stock_qty from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID join book_authors on books.book_ID = book_authors.book_ID join `authors` on book_authors.author_ID = `authors`.author_ID join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID left join categories on books.category_ID = categories.category_ID where (LOWER(books.title) like '%".$searchText."%' or LOWER(books.ISBN) like '%".$searchText."%' or LOWER(books.price) like '%".$searchText."%' or LOWER(books.publication_year) like '%".$searchText."%' or LOWER(publishers.publisher_name) like '%".$searchText."%' or LOWER(formats.format_name) like '%".$searchText."%' or LOWER(`authors`.author_name) like '%".$searchText."%' or LOWER(genres.genre_name) like '%".$searchText."%' or LOWER(categories.category_name) like '%".$searchText."%') and books.is_deleted = '0' order by books.title asc limit 16 offset " . $offset;
        }
        else if(isset($_POST["category_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.`author_name`, books.price, books.stock_qty from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) left join categories on books.category_ID = categories.category_ID where categories.category_ID = '".$_POST["category_ID"]."' and books.is_deleted = '0' order by books.title asc limit 16 offset " . $offset;
        }
        else if(isset($_POST["author_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price, books.stock_qty from books join book_authors on books.book_ID = book_authors.book_ID join `authors` on `authors`.`author_ID` = book_authors.author_ID where `authors`.author_ID = '".$_POST["author_ID"]."' and books.is_deleted = '0' order by books.title asc limit 16 offset " .$offset;
        }
        else if(isset($_POST["genre_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price, books.stock_qty from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID where genres.genre_ID = '".$_POST["genre_ID"]."' and books.is_deleted = '0' order by books.title asc limit 16 offset " . $offset;
        }
        else if(isset($_POST["publisher_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price, books.stock_qty from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.publisher_ID = '".$_POST["publisher_ID"]."' and books.is_deleted = '0' order by books.title asc limit 16 offset " . $offset;
        }
        $result = $conn->query($sql);
        $myObj->books = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            if(!isset($_POST["searchText"])){
                $myObj->books[$i]->author_name = $row["author_name"];
            }
            else{
                $sql2 = "select `authors`.author_name from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = ".$row["book_ID"].")";
                $result2 = $conn->query($sql2);
                while($row2 = $result2->fetch_assoc()) {
                    $myObj->books[$i]->author_name = $row2["author_name"];
                }
            }
            $myObj->books[$i]->price = $row["price"];
            $myObj->books[$i]->book_ID = $row["book_ID"];
            $myObj->books[$i]->stock_qty = $row["stock_qty"];
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