<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetBooksCount"])){

    // Get item count for pagination
    $searchText = (isset($_POST["searchText"])) ? $_POST["searchText"] : "";
    $sql = "select count(distinct books.cover_image_loc, books.title, publishers.publisher_name, books.price, books.stock_qty, books.book_ID) as count from books join publishers on books.publisher_ID = publishers.publisher_ID join formats on books.format_ID = formats.format_ID join book_authors on books.book_ID = book_authors.book_ID join `authors` on book_authors.author_ID = `authors`.author_ID join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID left join categories on books.category_ID = categories.category_ID where (LOWER(books.title) like CONCAT('%',?,'%') or LOWER(books.ISBN) like CONCAT('%',?,'%') or LOWER(books.price) like CONCAT('%',?,'%') or LOWER(books.publication_year) like CONCAT('%',?,'%') or LOWER(publishers.publisher_name) like CONCAT('%',?,'%') or LOWER(formats.format_name) like CONCAT('%',?,'%') or LOWER(`authors`.author_name) like CONCAT('%',?,'%') or LOWER(genres.genre_name) like CONCAT('%',?,'%') or LOWER(categories.category_name) like CONCAT('%',?,'%')) and books.is_deleted = '0'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssssss", $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText, $searchText);
    $stmt->execute();
    $result = $stmt->get_result();

    while($row = $result->fetch_assoc()) {
        $myObj->count = $row["count"];
    }

    $myJSON = json_encode($myObj);
    echo $myJSON;	
    $conn->close();
    exit();
    }
?>