const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController');
const { isAuthenticated } = require('../middleware/auth');

router.get('/', isAuthenticated, customerController.showCustomers);
router.get('/add', isAuthenticated, customerController.addForm);
router.post('/add', isAuthenticated, customerController.addCustomer);

router.get('/edit/:id', isAuthenticated, customerController.editForm);
router.put('/edit/:id', isAuthenticated, customerController.updateCustomer);

router.delete('/delete/:id', isAuthenticated, customerController.deleteCustomer);

module.exports = router;
