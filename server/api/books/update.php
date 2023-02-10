<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/books.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$books = new Books($conn);

$data = json_decode(file_get_contents("php://input"));

$books->id = $data->id;

$response = [];

if ($request == 'PUT') {
    if (
        !empty($data->id) &&
        !empty($data->name) &&
        !empty($data->writer) &&
        !empty($data->publisher) &&
        !empty($data->stock) &&
        !empty($data->note)
    ) {
        $books->id = $data->id;
        $books->name = $data->name;
        $books->writer = $data->writer;
        $books->publisher = $data->publisher;
        $books->stock = $data->stock;
        $books->note = $data->note;

        $data = array(
            'id' => $books->id,
            'name' => $books->name,
            'address' => $books->writer,
            'publisher' => $books->publisher,
            'stock' => $books->stock,
            'note' => $books->note,
        );

        if ($books->update()) {
            $response = array(
                'status' =>  array(
                    'messsage' => 'Success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'messsage' => 'Update Failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' =>  array(
                'messsage' => 'Update Failed - Wrong Parameter', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' =>  array(
            'messsage' => 'Method Not Allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);