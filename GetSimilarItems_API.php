<?php

/**
 * PHP item based filtering
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * @package   PHP item based filtering
 */

session_start();
date_default_timezone_set('Etc/GMT-8'); // Set time zone to Philippine time
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "bookrecsys";

require_once 'recommend.php';
require_once 'content_based.php';

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

if(isset($_POST["GetSimilarItems"])){
	
	$sql = "select books.title from books where books.is_deleted = '0' and books.book_ID = '".$_POST["book_ID"]."'";
	$result = $conn->query($sql);
	while($row = $result->fetch_assoc()) {
		$_POST["title"] = $row["title"];
	}

	$objects = array();
	$user = array();
	$sql = "select books.title from books where books.is_deleted = '0'";
	$result = $conn->query($sql);
	while($row = $result->fetch_assoc()) {
		if(strcmp($row["title"],$_POST["title"]) == 0){
		}
		else{
			$objects[$row["title"]] = array();
		}
		$sql2 = "select genres.genre_name from genres join book_genres on genres.genre_ID = book_genres.genre_ID join books on books.book_ID = book_genres.book_ID where books.title = '".$row["title"]."'";
		$result2 = $conn->query($sql2);
		while($row2 = $result2->fetch_assoc()) {
			if(strcmp($row["title"],$_POST["title"]) == 0){
				array_push($user,$row2["genre_name"]);
			}
			else{
				array_push($objects[$row["title"]],$row2["genre_name"]);
			}
		}
	}
	$engine = new ContentBasedRecommend($user, $objects);
	$top5 = array_slice($engine->getRecommendation(),0,5,true);
	//var_dump($engine->getRecommendation());
	//var_dump($top5);
	//var_dump($user);
	//var_dump($objects);
	
	$myObj->books = array();
	$i=0;
	foreach($top5 as $x => $val) {
		$sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.`author_name`, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.title = '".$x."'";
		$result = $conn->query($sql);
		while($row = $result->fetch_assoc()) {
			$myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            $myObj->books[$i]->author_name = $row["author_name"];
            $myObj->books[$i]->price = $row["price"];
            $myObj->books[$i]->book_ID = $row["book_ID"];
		}
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