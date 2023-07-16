<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include '../connection.php';

$id = (int) $_POST['id'];

// default response
$response = [];
$response['success'] = false;
$response['message'] = "Delete Data Failed";
$response['data'] = [];
if (isset($id) && $id != null) {
    // get data after insert
    $sql_get = "SELECT * FROM buku where id = $id";
    $result_get = $conn->query($sql_get);

    if ($result_get->num_rows > 0) {
        $sql_delete = "DELETE FROM buku WHERE id = $id";
        $result_delete = $conn->query($sql_delete);

        $response['success'] = true;
        $response['message'] = "Delete Data Success";
        $response['data'] = [];
    } else {
        $response['success'] = false;
        $response['message'] = "Data not Found";
        $response['data'] = [];
    }
} else {
    $response['success'] = false;
    $response['message'] = "Parameter Data not Found";
    $response['data'] = [];
}
echo json_encode($response);
