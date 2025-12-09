const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController');
const { isAuthenticated, isCustomerOwner } = require('../middleware/auth');

// Rute untuk menampilkan daftar customer
router.get('/', isAuthenticated, customerController.showCustomers);

// Rute untuk menampilkan form tambah customer
router.get('/add', isAuthenticated, customerController.showAddCustomerForm);

// Rute untuk memproses tambah customer
router.post('/add', isAuthenticated, customerController.addCustomer);

// Rute untuk menampilkan form edit customer
router.get('/edit/:id', isAuthenticated, isCustomerOwner, customerController.showEditCustomerForm);

// Rute untuk memproses update customer
router.put('/edit/:id', isAuthenticated, isCustomerOwner, customerController.updateCustomer);

// Rute untuk menghapus customer
router.delete('/delete/:id', isAuthenticated, isCustomerOwner, customerController.deleteCustomer);

module.exports = router;