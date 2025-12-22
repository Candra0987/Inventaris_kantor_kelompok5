<?php
require_once __DIR__ . '/Model.php';
class Item extends Model {
    public function all(){ return $this->pdo->query('SELECT items.*, categories.name as category_name FROM items JOIN categories ON items.category_id = categories.id')->fetchAll(PDO::FETCH_ASSOC); }
    public function find($id){ $stmt=$this->pdo->prepare('SELECT * FROM items WHERE id=?'); $stmt->execute([$id]); return $stmt->fetch(PDO::FETCH_ASSOC); }
    public function create($data){ $stmt=$this->pdo->prepare('INSERT INTO items (category_id,name,quantity,description) VALUES (?,?,?,?)'); $stmt->execute([$data['category_id'],$data['name'],$data['quantity'],$data['description']]); }
    public function update($id,$data){ $stmt=$this->pdo->prepare('UPDATE items SET category_id=?,name=?,quantity=?,description=? WHERE id=?'); $stmt->execute([$data['category_id'],$data['name'],$data['quantity'],$data['description'],$id]); }
    public function delete($id){ $stmt=$this->pdo->prepare('DELETE FROM items WHERE id=?'); $stmt->execute([$id]); }
    public function decreaseQuantity($id,$qty){ $stmt=$this->pdo->prepare('UPDATE items SET quantity = quantity - ? WHERE id = ?'); $stmt->execute([$qty,$id]); }
    public function increaseQuantity($id,$qty){ $stmt=$this->pdo->prepare('UPDATE items SET quantity = quantity + ? WHERE id = ?'); $stmt->execute([$qty,$id]); }
}
