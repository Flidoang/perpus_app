<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include '../connection.php';


$sql = 'SELECT * from buku';
$result = $conn->query($sql);
$response = [];
$response['success'] = false;
$response['message'] = 'Get Data Failed';
$response['data'] = [];
if ($result) {
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $temp = $row;
        $temp['id'] = (int)$row['id'];
        array_push($data, $temp);
    }
    $response['success'] = true;
    $response['message'] = 'Get Data Success';
    $response['data'] = $data;
} else {
    $response['success'] = false;
    $response['message'] = 'Internal Server Error ' . mysqli_error($conn);
    $response['data'] = [];
}
// $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($data);
