<?php
	require("../DB_Connect.php");

    if(isset($_POST["GetAuthors"])){
        $myObj = new stdClass();
        $myObj->authors = array();
        $sql = "select * from authors order by author_name asc";
        $result = $conn->query($sql);
        $i = 0;
        while($row = $result->fetch_assoc()) {
            $myObj->authors[$i] = new stdClass();
            $myObj->authors[$i]->author_name = $row["author_name"];
            $myObj->authors[$i]->author_ID = $row["author_ID"];
            $sql2 = "select count(*) as count from books join book_authors on books.book_ID = book_authors.book_ID join authors on book_authors.author_ID = authors.author_ID where authors.author_ID = ? and books.is_deleted = 0";
            $stmt = $conn->prepare($sql2);
            $stmt->bind_param("i", $row["author_ID"]);
            $stmt->execute();
            $result2 = $stmt->get_result();
            while($row2 = $result2->fetch_assoc()) {
                $myObj->authors[$i]->author_count = $row2["count"];
            }
            $i++;
        }
        $myJSON = json_encode($myObj);
        echo $myJSON;	
        $conn->close();
        exit();
    }
?>