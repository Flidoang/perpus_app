<?php
include '../connection.php';

// get json
// $json = file_get_contents('php://input');
// $data = json_decode($json, true);

// default data
$cover = $_FILES['cover']['name'];
$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$halaman = $_POST['halaman'];
$sinopsis = $_POST['sinopsis'];
$isi = $_POST['isi'];
$kategori = $_POST['kategori'];

$coverPath = 'uploads/'.$cover;
$tmp_name = $_FILES['cover']['tmp_name'];
move_uploaded_file($tmp_name, $coverPath);


// // get data from json

// if (isset($data['title'])) {
//     $title = $data['title'];
// }
// if (isset($data['price'])) {
//     $price = $data['price'];
// }
// if (isset($data['subtitle'])) {
//     $subtitle = $data['subtitle'];
// }

// default response
$response = [];
$response['success'] = false;
$response['message'] = "Insert Data Failed";
$response['data'] = [];

if ($judul != '' && $penulis != '') {
    // start query
    $sql = "INSERT INTO buku (cover,judul,penulis,halaman,sinopsis,isi,kategori)
    VALUES ('$cover','$judul','$penulis','$halaman','$sinopsis','$isi','$kategori')";

    $result = mysqli_query($conn, $sql);

    $response['data'] = $result;
    if ($result) {
        // get data after insert
        $last_id = $conn->insert_id;
        $sql_get = "SELECT * FROM buku where id = $last_id";
        $result_get = $conn->query($sql_get);

        $response['success'] = true;
        $response['message'] = "Insert Data Success";
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

$conn->close();

if ($response['success'] == true) {
    header("HTTP/1.1 200");
} else {
    header("HTTP/1.1 500");
}

header('Content-Type: application/json');
echo json_encode($response);
