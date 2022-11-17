<?php
include '../connection.php'; //make sure connection is establish with sql

//POST = send data to sql database
//GET = retrieve/read data from mysql db


$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "SELECT * FROM  users_table WHERE user_email = '$userEmail', user_password = '$userPassword' ";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) //allow user login
{
    $userRecord = array();
    while($rowFound = $resultOfQuery->fetch_assoc()) //fetch row and its associate array
    {
        $userRecord = $rowFound;
    }
    echo json_encode(
        array(
            "success" => true,
            "userData" => $userRecord[0]));
}
else //tak allow user login, name or pass incorrect
{
    echo json_encode(array("success" => false));
}

