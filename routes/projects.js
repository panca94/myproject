const express = require('express');
const router = express.Router();
const projectController = require('../controllers/projectController');
const { isAuthenticated, isOwner } = require('../middleware/auth');

// Rute untuk menampilkan daftar proyek
router.get('/', isAuthenticated, projectController.showProjects);

// Rute untuk menampilkan form tambah proyek
router.get('/add', isAuthenticated, projectController.showAddProjectForm);

// Rute untuk memproses tambah proyek
router.post('/add', isAuthenticated, projectController.addProject);

// Rute untuk menampilkan form edit proyek
router.get('/edit/:id', isAuthenticated, isOwner, projectController.showEditProjectForm);

// Rute untuk memproses update proyek
router.put('/edit/:id', isAuthenticated, isOwner, projectController.updateProject);

// Rute untuk menghapus proyek
router.delete('/delete/:id', isAuthenticated, isOwner, projectController.deleteProject);

module.exports = router;