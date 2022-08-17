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

    if(isset($_POST["GetAuthors"])){
        $myObj = new stdClass();
        $myObj->authors = array();
        $sql = "select * from authors order by author_name asc";
        $result = $conn->query($sql);
        $i = 0;
        while($row = $result->fetch_assoc()) {
            $myObj->authors[$i] = new stdClass();
            $myObj->authors[$i]->author_name = $row["author_name"];
            $sql2 = "select count(*) as count from books join book_authors on books.book_ID = book_authors.book_ID join authors on book_authors.author_ID = authors.author_ID where authors.author_ID = '".$row["author_ID"]."'";
            $result2 = $conn->query($sql2);
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

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        $data = preg_replace('/\'/',"",$data);
        return $data;
    }
?>