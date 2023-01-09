<?php
	require("../DB_Connect.php");

    if(isset($_POST["ItemList"])){

        //make TCPDF object
        $pdf = new TCPDF('P','mm','A4');

        //remove default header and footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);

        //add page
        $pdf->AddPage();

        $pdf->SetFont('Helvetica','',10);
        $pdf->Ln();
        $pdf->Ln(2);

        $html = "
            <h1>Proof of Purchase</h1>
        ";

        $sql = "select users.first_name, users.last_name from transactions join users on transactions.user_ID = users.user_ID where transactions.transaction_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["transaction_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $html.= "
                <h3>Purchasee: ".$row["first_name"]." ".$row["last_name"]."</h3>
                <table>
                    <tr>
                        <th>Book Title</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
            ";
        }
        
        // Query Transaction Items
        $sql = "select books.title, transaction_items.qty, transaction_items.subtotal from transaction_items join books on transaction_items.book_ID = books.book_ID where transaction_items.transaction_ID = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $_POST["transaction_ID"]);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc()) {
            $html.= "
                <tr>
                    <td>".$row["title"]."</td>
                    <td>".$row["qty"]."</td>
                    <td>".$row["subtotal"]."</td>
                </tr>
            ";
        }

        $html.= "
            </table>
            <h3>TOTAL: Php ".$_POST["total"]."</h3>
            <style>
                table {
                    border-collapse:collapse;
                }
                th,td {
                    border:1px solid #888;
                }
                table tr th {
                    background-color:#888;
                    color:#fff;
                    font-weight:bold;
                }
            </style>
        ";

        //WriteHTMLCell
        $pdf->WriteHTMLCell(192,0,9,'',$html,0);	

        //output
        $pdf->Output();

        $conn->close();
        //exit();
    }
?>