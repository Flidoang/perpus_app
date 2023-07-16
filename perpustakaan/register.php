<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include 'connection.php';

$nama =  $_POST['nama'];
$usn = $_POST['username'];
$pass =  sha1($_POST['password']);
$no_hp =  $_POST['no_hp'];

$success = false;
$message = 'Internal Server Error';
$sql = "SELECT * FROM user WHERE username='$usn'";
$result = mysqli_query($conn, $sql);
if (!$result->num_rows > 0) {
    $sql_register = "INSERT INTO user(nama,username,password,no_hp,role) values('$nama','$usn','$pass','$no_hp','user')";
    $result_register = mysqli_query($conn, $sql_register);
    if ($result_register) {
        // $success = true;
        // $message = 'Register Berhasil';
        echo json_encode("success"); 
    }
} else {
    // $success = false;
    // $message = 'Username sudah terpakai';
    echo json_encode("error"); 
}

// echo json_encode([
//     'success' => $success,
//     'message' => $message,

// ]);
