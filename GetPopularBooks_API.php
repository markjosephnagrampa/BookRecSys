<?php
	require("DB_Connect.php");

    if(isset($_POST["GetPopularBooks"])){
        $offset = 16 * (intval($_POST["Page"]) - 1);

        $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.`author_name`, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.is_deleted = '0' order by books.popularity_score desc limit 16 offset ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $offset);
        $stmt->execute();
        $result = $stmt->get_result();

        $myObj->books = array();
        $i=0;
        while($row = $result->fetch_assoc()) {
            $myObj->books[$i] = new stdClass();
            $myObj->books[$i]->cover_image_loc = "http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]."?=".filemtime("http://localhost/BookRecSys/img/books/".$row["cover_image_loc"]);
            $myObj->books[$i]->title = $row["title"];
            $myObj->books[$i]->author_name = $row["author_name"];
            $myObj->books[$i]->price = $row["price"];
            $myObj->books[$i]->book_ID = $row["book_ID"];
            $i++;
        }

        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>