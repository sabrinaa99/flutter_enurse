<?php

include '../connection.php';

    $userEmail = $_POST['user_email'];

    $sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail'";

        $resultofQuery = $connectNow->query($sqlQuery);

        if ($resultofQuery->num_rows > 0)
        {
            //if num_row length == 1, means dah ada email tu dalam db
            echo json_encode(array("emailFound" => true));
        }
        else
        {
            //num_rows length == 0, means email user boleg signup masuk db
            echo json_encode(array("emailFound" => false));
        }
