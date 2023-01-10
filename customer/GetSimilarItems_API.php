<?php
	require("../DB_Connect.php");
	require_once '../recommend.php';
	require_once '../content_based.php';

	if(isset($_POST["GetSimilarItems"])){

        $myObj = new stdClass();
        $objects = array();
		$user = array();

        $sql = "select books.book_ID from books where books.is_deleted = 0";
        $result = $conn->query($sql);
		while($row = $result->fetch_assoc()) {
            if($row["book_ID"] == $_POST["book_ID"]){

            }
            else{
                $key = " " . $row["book_ID"];
                $objects[$key] = array();
            }
            $sql2 = "select genres.genre_name from genres join book_genres on genres.genre_ID = book_genres.genre_ID join books on books.book_ID = book_genres.book_ID where books.book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
			while($row2 = $result2->fetch_assoc()) {
                if($row["book_ID"] == $_POST["book_ID"]){
					array_push($user,$row2["genre_name"]);
				}
				else{
                    $key = " " . $row["book_ID"];
					array_push($objects[$key],$row2["genre_name"]);
				}
            }
        }

        $engine = new ContentBasedRecommend($user, $objects);
		$top5 = array_slice($engine->getRecommendation(),0,5,true);
		//var_dump($top5);
		//var_dump($user);
		//var_dump($objects);

        $myObj->books = array();
		$i=0;
		foreach($top5 as $x => $val) {
            $key = substr($x,1);
			$sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.`author_name`, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.book_ID = ?";
			$stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $key);
            $stmt->execute();
            $result = $stmt->get_result();
			
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
?>