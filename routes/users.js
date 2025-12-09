const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const { isAuthenticated, isAdmin } = require('../middleware/auth');

// Middleware untuk semua rute di file ini
// router.use(isAuthenticated); // Bisa juga ditaruh di sini

// Rute untuk menampilkan daftar user (hanya admin)
router.get('/', isAuthenticated, isAdmin, userController.showUsers);

// Rute untuk menampilkan form tambah user (hanya admin)
router.get('/add', isAuthenticated, isAdmin, userController.showAddUserForm);

// Rute untuk memproses tambah user (hanya admin)
router.post('/add', isAuthenticated, isAdmin, userController.addUser);

// Rute untuk menampilkan form edit user (hanya admin)
router.get('/edit/:id', isAuthenticated, isAdmin, userController.showEditUserForm);

// Rute untuk memproses update user (hanya admin)
router.post('/edit/:id', isAuthenticated, isAdmin, userController.updateUser);

// Rute untuk menghapus user (hanya admin)
router.delete('/delete/:id', isAuthenticated, isAdmin, userController.deleteUser);

// PASTIKAN BARIS INI ADA DI AKHIR FILE
module.exports = router;