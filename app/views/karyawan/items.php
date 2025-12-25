<?php require __DIR__.'/../layout/header.php'; ?>

<style>
/* ====== DAFTAR BARANG KARYAWAN ====== */
.page-header {
  max-width: 900px;
  margin: 40px auto 20px;
  padding: 10px 0;
  text-align: center;
}

.page-header h3 {
  font-size: 1.6rem;
  color: var(--primary);
  font-weight: 700;
}

/* ====== TABLE STYLE ====== */
.table-wrapper {
  max-width: 900px;
  margin: 0 auto 40px;
  background-color: var(--white);
  border-radius: 12px;
  overflow-x: auto;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

table {
  width: 100%;
  border-collapse: collapse;
  font-family: inherit;
}

thead {
  background-color: var(--primary);
  color: #fff;
}

th, td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid var(--border);
  font-size: 0.95rem;
}



/* ====== BUTTON PINJAM ====== */
.btn-sm {
  padding: 6px 12px;
  border-radius: 8px;
  font-size: 0.85rem;
  font-weight: 600;
  color: #fff;
  text-decoration: none;
  display: inline-block;
  transition: background-color 0.2s ease, transform 0.1s ease;
}

.btn-success {
  background-color: var(--primary);
  border: none;
}

.btn-success:hover {
  background-color: var(--primary-dark);
  transform: translateY(-1px);
}

/* ====== RESPONSIVE ====== */
@media (max-width: 576px) {
  th, td {
    padding: 8px 10px;
    font-size: 0.9rem;
  }

  .table-wrapper {
    margin: 0 10px 30px;
  }
}
</style>

<div class="page-header">
  <h3>Daftar Barang</h3>
</div>

<div class="table-wrapper">
  <table>
    <thead>
      <tr>
        <th>Nama</th>
        <th>Kategori</th>
        <th>Qty</th>
        <th>Aksi</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($items as $it): ?>
        <tr>
          <td><?= htmlspecialchars($it['name']) ?></td>
          <td><?= htmlspecialchars($it['category_name']) ?></td>
          <td><?= $it['quantity'] ?></td>
          <td>
            <a class="btn-sm btn-success" href="?url=karyawan/loanForm&id=<?= $it['id'] ?>">Pinjam</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__.'/../layout/footer.php'; ?>
