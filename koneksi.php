<?php
$conn = mysqli_connect("localhost", "root", "", "urenergy");
if (!$conn) {
  die("Koneksi gagal: " . mysqli_connect_error());
}