<?php
	require("DB_Connect.php");

    if(isset($_POST["SearchBook"])){
        $offset = 16 * (intval($_POST["Page"]) - 1);

        $sql = "";
        $stmt = new stdClass();

        if(isset($_POST["searchText"])){
            $searchText = $_POST["searchText"];
            $sql = "select distinct books.cover_image_loc, books.title, books.price, books.book_ID from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID join book_authors on books.book_ID = book_authors.book_ID join `authors` on book_authors.author_ID = `authors`.author_ID join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID left join categories on books.category_ID = categories.category_ID where (LOWER(books.title) like CONCAT('%',?,'%') or LOWER(books.ISBN) like CONCAT('%',?,'%') or LOWER(books.price) like CONCAT('%',?,'%') or LOWER(books.publication_year) like CONCAT('%',?,'%') or LOWER(publishers.publisher_name) like CONCAT('%',?,'%') or LOWER(formats.format_name) like CONCAT('%',?,'%') or LOWER(`authors`.author_name) like CONCAT('%',?,'%') or LOWER(genres.genre_name) like CONCAT('%',?,'%') or LOWER(categories.category_name) like CONCAT('%',?,'%')) and books.is_deleted = '0' order by books.title asc limit 16 offset ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssssssssi", $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $offset);
        }
        else if(isset($_POST["category_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.`author_name`, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) left join categories on books.category_ID = categories.category_ID where categories.category_ID = ? and books.is_deleted = '0' order by books.title asc limit 16 offset ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $_POST["category_ID"], $offset);
        
        }
        else if(isset($_POST["author_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price from books join book_authors on books.book_ID = book_authors.book_ID join `authors` on `authors`.`author_ID` = book_authors.author_ID where `authors`.author_ID = ? and books.is_deleted = '0' order by books.title asc limit 16 offset ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $_POST["author_ID"], $offset);
        }
        else if(isset($_POST["genre_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID where genres.genre_ID = ? and books.is_deleted = '0' order by books.title asc limit 16 offset ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $_POST["genre_ID"], $offset);
        }
        else if(isset($_POST["publisher_ID"])){
            $sql = "select books.book_ID, books.cover_image_loc, books.title, `authors`.author_name, books.price from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = books.book_ID) where books.publisher_ID = ? and books.is_deleted = '0' order by books.title asc limit 16 offset ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ii", $_POST["publisher_ID"], $offset);
        }
        $stmt->execute();
        $result = $stmt->get_result();
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
                $sql2 = "select `authors`.author_name from books left join `authors` on `authors`.author_ID = (select MIN(book_authors.author_ID) from book_authors where book_authors.book_ID = ?)";
                $stmt = $conn->prepare($sql2);
                $stmt->bind_param("i", $row["book_ID"]);
                $stmt->execute();
                $result2 = $stmt->get_result();
                while($row2 = $result2->fetch_assoc()) {
                    $myObj->books[$i]->author_name = $row2["author_name"];
                }
            }
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