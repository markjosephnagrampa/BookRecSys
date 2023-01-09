<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetBookDetails"])){
        $sql = "select books.book_ID, books.cover_image_loc, books.title, books.description, books.ISBN, publishers.publisher_name, books.publication_year, formats.format_name, books.stock_qty, books.price from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID where books.book_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["book_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

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
            $sql2 = "select `authors`.author_name from `authors` join book_authors on `authors`.author_ID = book_authors.author_ID join books on book_authors.book_ID = books.book_ID where books.book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $myObj->book->author .= $row2["author_name"] . ", ";
            }
            $myObj->book->author = substr($myObj->book->author,0,strlen($myObj->book->author) - 2);

            //genre list
            $myObj->book->genre = "";
            $sql2 = "select genres.genre_name from genres join book_genres on genres.genre_ID = book_genres.genre_ID join books on book_genres.book_ID = books.book_ID where books.book_ID = ?";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $_POST["book_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
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
?>