<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include '../connection.php';

// Default Response
$id = (int) $_POST['id'];

$response = [];
$response['success'] = false;
$response['message'] = 'Get Data Failed';
$response['data'] = [];


if (isset($id) && $id != null) {
    $detail = true;
    // Start Query
    $sql = "SELECT * from buku where id = $id";
    // Echo SQL
    $result = $conn->query($sql);

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $temp = $row;
        $temp['id'] = (int)$row['id'];
        array_push($data, $temp);
    }
    if (count($data) > 0) {
        $data = $data[0];
        $response['success'] = true;
        $response['message'] = 'Get Data Success';
        $response['data'] = $data;
    } else {
        $response['success'] = true;
        $response['message'] = 'Data Not Found';
        $response['data'] = [];
    }
} else {
    $response['success'] = false;
    $response['message'] = 'Parameter Data Not Found';
    $response['data'] = [];
}
echo json_encode($response);
