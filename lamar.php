<?php
include 'koneksi.php';
$id = (int) $_GET['id'];

$cek = mysqli_query($conn, "SELECT * FROM lowongan WHERE id = $id");
$lowongan = mysqli_fetch_assoc($cek);
if (!$lowongan || $lowongan['status'] !== 'buka') {
  die("Lowongan ini sudah penuh atau tidak ditemukan.");
}

$pesan = "";
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $nama  = $_POST['nama'];
  $email = $_POST['email'];
  $cv    = $_POST['link_cv'];

  $stmt = mysqli_prepare($conn,
    "INSERT INTO lamaran (id_lowongan, nama, email, link_cv) VALUES (?, ?, ?, ?)");
  mysqli_stmt_bind_param($stmt, "isss", $id, $nama, $email, $cv);
  mysqli_stmt_execute($stmt);
  $pesan = "Lamaran terkirim!";
}
?>

<?php
$syarat = array_filter(array_map('trim', explode("\n", $lowongan['persyaratan'] ?? '')));
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lamar — <?= htmlspecialchars($lowongan['judul']) ?></title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@500;600;700&family=IBM+Plex+Sans:wght@400;500;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
  <script>
    try {
      var t = localStorage.getItem('urenergy-theme');
      if (!t && window.matchMedia('(prefers-color-scheme: dark)').matches) t = 'dark';
      document.documentElement.setAttribute('data-theme', t || 'light');
    } catch (e) {}
  </script>
</head>
<body>
  <nav class="nav">
    <div class="wrap">
      <a class="brand" href="index.html" aria-label="UrEnergy beranda">
        <svg viewBox="0 0 24 24" fill="none"><path d="M12 2 5 13h5.2L10 22l8-13h-5.4L12 2Z" fill="#E8871E"/></svg>
        UrEnergy
      </a>
    </div>
  </nav>

  <main class="lamar-page">
    <div class="wrap">
      <a class="lamar-back" href="keberlanjutan.php#lowongan">← Semua lowongan</a>

      <div class="lamar-layout">

        <div class="lamar-card lamar-detail">
          <p class="kicker"><?= htmlspecialchars($lowongan['divisi']) ?></p>
          <h2><?= htmlspecialchars($lowongan['judul']) ?></h2>
          <p class="lamar-sub"><?= htmlspecialchars($lowongan['lokasi']) ?></p>

          <h3>Deskripsi Pekerjaan</h3>
          <p class="lamar-text"><?= htmlspecialchars($lowongan['deskripsi']) ?></p>

          <h3>Persyaratan</h3>
          <?php if ($syarat) { ?>
            <ul class="syarat">
              <?php foreach ($syarat as $s) { ?>
                <li><?= htmlspecialchars($s) ?></li>
              <?php } ?>
            </ul>
          <?php } else { ?>
            <p class="lamar-text">Belum ada persyaratan khusus.</p>
          <?php } ?>
        </div>

        <div class="lamar-card lamar-form">
          <h3>Form Lamaran</h3>

          <?php if ($pesan) { ?>
            <div class="lamar-ok"><?= $pesan ?></div>
          <?php } ?>

          <form method="post">
            <input class="form-control mb-3" type="text" name="nama" placeholder="Nama lengkap" required>
            <input class="form-control mb-3" type="email" name="email" placeholder="Email" required>
            <input class="form-control mb-3" type="text" name="link_cv" placeholder="Link CV (Google Drive)">
            <div class="lamar-actions">
              <button class="btn btn-primary" type="submit">Kirim Lamaran</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </main>
</body>
</html>