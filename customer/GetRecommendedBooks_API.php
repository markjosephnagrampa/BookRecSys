<?php
	session_start();
	date_default_timezone_set('Etc/GMT-8'); // Set time zone to Philippine time
	$servername = "localhost";
	$username = "root";
	$password = "password";
	$dbname = "bookrecsys";

    require_once("../cf_recommend.php");
    require_once("../cf_sample_list.php");

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

    if(isset($_POST["GetRecommendedBooks"])){
        $sql = "select user_ID from users where is_admin = '0'";
        $result = $conn->query($sql);
        $myObj = new stdClass();
        $myObj->books = array();
        $books = array();
        while($row = $result->fetch_assoc()) {
            $books[$row["user_ID"]] = array();
            $sql2 = "select distinct(events.book_ID), books.title from events join event_types on events.event_type_ID = event_types.event_type_ID join books on events.book_ID = books.book_ID where event_types.name = 'Click' and events.user_ID = '".$row["user_ID"]."' and events.is_deleted = '0'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $books[$row["user_ID"]][$row2["title"]] = 1;
            }
            $sql2 = "select distinct(events.book_ID), books.title from events join event_types on events.event_type_ID = event_types.event_type_ID join books on events.book_ID = books.book_ID where event_types.name = 'RecommendationClick' and events.user_ID = '".$row["user_ID"]."' and events.is_deleted = '0'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $books[$row["user_ID"]][$row2["title"]] = 1;
            }
            $sql2 = "select distinct(events.book_ID), books.title from events join event_types on events.event_type_ID = event_types.event_type_ID join books on events.book_ID = books.book_ID where event_types.name = 'AddToCart' and events.user_ID = '".$row["user_ID"]."' and events.is_deleted = '0'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $books[$row["user_ID"]][$row2["title"]] = 2;
            }
            $sql2 = "select distinct(events.book_ID), books.title from events join event_types on events.event_type_ID = event_types.event_type_ID join books on events.book_ID = books.book_ID where event_types.name = 'Purchase' and events.user_ID = '".$row["user_ID"]."' and events.is_deleted = '0'";
            $result2 = $conn->query($sql2);
            while($row2 = $result2->fetch_assoc()) {
                $books[$row["user_ID"]][$row2["title"]] = 3;
            }
        }

        $re = new Recommend();
        $recommendations = $re->getRecommendations($books, $_POST["user_ID"]);

        // Query suggested books non-deleted books
        $i=0;
        $restQuery = "";
        foreach($recommendations as $item => $rating){
            $sql = "select books.book_ID,books.cover_image_loc, books.title, authors.author_name, books.price, books.stock_qty from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.title = '".$item."' and books.is_deleted = '0'";
            $result = $conn->query($sql);
            while($row = $result->fetch_assoc()) {
                $myObj->books[$i] = new stdClass();
                $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
                $myObj->books[$i]->title = $row["title"];
                $myObj->books[$i]->author_name = $row["author_name"];
                $myObj->books[$i]->price = $row["price"];
                $myObj->books[$i]->book_ID = $row["book_ID"];
                $myObj->books[$i]->stock_qty = $row["stock_qty"];
                $myObj->books[$i]->isRecommended = true;
                $restQuery.= " and books.book_ID != '".$row["book_ID"]."'";
                $i++;
            }
        }

        
        // Query non-suggested non-deleted books
        $sql = "select books.book_ID,books.cover_image_loc, books.title, authors.author_name, books.price, books.stock_qty from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.is_deleted = '0' ".$restQuery;
        $result = $conn->query($sql);
        while($row = $result->fetch_assoc()) {
            $myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            $myObj->books[$i]->author_name = $row["author_name"];
            $myObj->books[$i]->price = $row["price"];
            $myObj->books[$i]->book_ID = $row["book_ID"];
            $myObj->books[$i]->stock_qty = $row["stock_qty"];
            $myObj->books[$i]->isRecommended = false;
            $i++;
        }
        
        // Paginate
        $offset = 16 * (intval($_POST["Page"]) - 1);
        $myObj->books = array_slice($myObj->books,$offset,16);

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