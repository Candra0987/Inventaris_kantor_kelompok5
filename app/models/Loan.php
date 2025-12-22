<?php
require_once __DIR__ . '/Model.php';
class Loan extends Model {
    public function create($employee_id,$item_id,$quantity){ $stmt=$this->pdo->prepare('INSERT INTO loans (employee_id,item_id,quantity) VALUES (?,?,?)'); $stmt->execute([$employee_id,$item_id,$quantity]); }
    public function byEmployee($employee_id){ $stmt=$this->pdo->prepare('SELECT loans.*, items.name as item_name FROM loans JOIN items ON loans.item_id = items.id WHERE employee_id = ?'); $stmt->execute([$employee_id]); return $stmt->fetchAll(PDO::FETCH_ASSOC); }
    public function all(){ $stmt=$this->pdo->prepare('SELECT loans.*, items.name as item_name, employees.name as employee_name, loans.requested_at FROM loans JOIN items ON loans.item_id=items.id JOIN employees ON loans.employee_id = employees.id ORDER BY requested_at DESC'); $stmt->execute(); return $stmt->fetchAll(PDO::FETCH_ASSOC); }
    public function find($id){ $stmt=$this->pdo->prepare('SELECT * FROM loans WHERE id=?'); $stmt->execute([$id]); return $stmt->fetch(PDO::FETCH_ASSOC); }
    public function updateStatus($id,$status){ $stmt=$this->pdo->prepare('UPDATE loans SET status=?, processed_at = NOW() WHERE id=?'); $stmt->execute([$status,$id]); }
    public function delete($id){ $stmt=$this->pdo->prepare('DELETE FROM loans WHERE id=?'); $stmt->execute([$id]); }
}
