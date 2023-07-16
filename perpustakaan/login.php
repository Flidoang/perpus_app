<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include 'connection.php';

$username = $_POST['username'];
$password =  sha1($_POST['password']);
$success = false;
$message = 'User tidak ditemukan';
// $row = [];
$sql = "SELECT * FROM user WHERE username='$username' AND password='$password'";
$get = "SELECT id FROM user WHERE username='$username'";
$get_result = mysqli_query($conn, $get);
$result = mysqli_query($conn, $sql);
if ($result->num_rows > 0) {
    $row = mysqli_fetch_assoc($result);
    $_SESSION['username'] = $row['username'];
    $success = true;
    echo json_encode("success"); 
    // $message = 'Login Berhasil';
    // $row = $row;
} 
// echo json_encode([
//     'success' => $success,
//     'message' => $message,
//     'data' => $row,
// ]);
