<?php
class Books
{
    public $id;
    public $name;
    public $writer;
    public $publisher;
    public $stock;
    public $note;

    private $conn;
    private $table = "books";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               id=:id, name=:name, writer=:writer, publisher=:publisher, stock=:stock, note=:note";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('writer', $this->writer);
        $stmt->bindParam('publisher', $this->publisher);
        $stmt->bindParam('stock', $this->stock);
        $stmt->bindParam('note', $this->note);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.id = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        $stmt->execute();

        $books = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $books['id'];
        $this->name = $books['name'];
        $this->writer = $books['writer'];
        $this->publisher = $books['publisher'];
        $this->stock = $books['stock'];
        $this->note = $books['note'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
                name = :name,
                writer = :writer,
                publisher = :publisher,
                stock = :stock,
                note = :note
            WHERE
                id = :id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('writer', $this->writer);
        $stmt->bindParam('publisher', $this->publisher);
        $stmt->bindParam('stock', $this->stock);
        $stmt->bindParam('note', $this->note);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}