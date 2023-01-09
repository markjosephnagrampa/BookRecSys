<?php
	require("DB_Connect.php");

    if(isset($_POST["GetGenres"])){
        $myObj = new stdClass();
        $myObj->genres = array();
        $sql = "select * from genres order by genre_name asc";
        $result = $conn->query($sql);
        $i = 0;
        while($row = $result->fetch_assoc()) {
            $myObj->genres[$i] = new stdClass();
            $myObj->genres[$i]->genre_name = $row["genre_name"];
            $myObj->genres[$i]->genre_ID = $row["genre_ID"];
            $sql2 = "select count(*) as count from books join book_genres on books.book_ID = book_genres.book_ID join genres on book_genres.genre_ID = genres.genre_ID where genres.genre_ID = ? and books.is_deleted = 0";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["genre_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $myObj->genres[$i]->genre_count = $row2["count"];
            }
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>