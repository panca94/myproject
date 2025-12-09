// 1. Mengimport module 'http' yang merupakan bawaan Node.js
const http = require('http');

// 2. Mendefinisikan hostname dan port
const hostname = '127.0.0.1'; // Ini adalah alamat localhost Anda
const port = 3000; // Port adalah "pintu" di mana server kita akan berjalan

// 3. Membuat server
// Fungsi createServer menerima sebuah fungsi yang akan dijalankan setiap kali ada permintaan (request)
const server = http.createServer((req, res) => {
  // Mengatur status HTTP menjadi 200 (OK)
  res.statusCode = 200;
  // Mengatur header untuk memberi tahu browser bahwa konten yang dikirim adalah teks biasa
  res.setHeader('Content-Type', 'text/plain');
  // Mengakhiri respons dan mengirimkan pesan "Hello, World!"
  res.end('Hello, World!\n');
});

// 4. Menjalankan server dan mendengarkan koneksi pada port dan hostname yang sudah ditentukan
server.listen(port, hostname, () => {
  // Menampilkan pesan di console/terminal saat server berhasil berjalan
  console.log(`Server running at http://${hostname}:${port}/`);
});