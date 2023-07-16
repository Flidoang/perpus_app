<?php
header('Content-Type: Application/json; charset=UTF-8');
header('Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept');

include '../connection.php';

$cover = $_FILES['cover']['judul'];
$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$halaman = $_POST['halaman'];
$sinopsis = $_POST['sinopsis'];
$isi = $_POST['isi'];
$kategori = $_POST['kategori'];

$coverPath = '../uploads/'.$cover;
$tmp_name = $_FILES['cover']['tmp_name'];
move_uploaded_file($tmp_name, $imagePath);

// default response
$response = [];
$response['success'] = false;
$response['message'] = "Update Data Failed";
$response['data'] = [];
if (isset($id) && $id != null) {
    if ($title != '') {
        // start query
        $sql = "UPDATE buku SET cover='$cover',judul='$judul',penulis='$penulis',halaman='$halaman',sinopsis='$sinopsis',isi='$isi',kategori='$kategori'
        WHERE id = $id";

        $result = $conn->query($sql);

        if ($result) {
            // get data after insert
            $sql_get = "SELECT * FROM buku where id = $id";
            $result_get = $conn->query($sql_get);

            $data_get = [];
            while ($row = $result_get->fetch_assoc()) {
                $temp = $row;
                $temp['id'] = $row['id'];
                array_push($data_get, $temp);
            }
            $data_get = $data_get[0];
            $response['success'] = true;
            $response['message'] = "Update Data Success";
            $response['data'] = $data_get;
        } else {
            $response['success'] = false;
            $response['message'] = "Internal Server Error " . mysqli_error($conn);
            $response['data'] = [];
        }
    } else {
        $response['success'] = false;
        $response['message'] = "Tidak ada Data yang Dikirim";
        $response['data'] = [];
    }
} else {
    $response['success'] = false;
    $response['message'] = "Parameter Data not Found";
    $response['data'] = [];
}

echo json_encode($response);
