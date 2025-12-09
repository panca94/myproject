const db = require('../models');

// Tampilkan daftar customer dengan pagination
exports.showCustomers = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    let whereClause = {};

    if (loggedInUser.role === 'sales') {
      whereClause.userId = loggedInUser.id;
    }

    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const offset = (page - 1) * limit;
    
    const data = await db.Customer.findAndCountAll({
      where: whereClause,
      include: [{ model: db.User, as: 'sales', attributes: ['username'] }],
      order: [['id', 'ASC']],
      limit: limit,
      offset: offset
    });

    const customers = data.rows;
    const totalCustomers = data.count;
    const totalPages = Math.ceil(totalCustomers / limit);

    // Kirim variabel currentPage ke view
    res.render('customers/list', { 
      customers, 
      currentPage: page, 
      totalPages, 
      totalCustomers,
      user: req.session.user 
    });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Tampilkan form tambah customer
exports.showAddCustomerForm = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    let salesUsers = [];

    if (loggedInUser.role === 'admin' || loggedInUser.role === 'manager') {
      salesUsers = await db.User.findAll({
        where: { role: 'sales' },
        attributes: ['id', 'username']
      });
    }
    
    res.render('customers/add', { salesUsers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Proses tambah customer
exports.addCustomer = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    const customerData = { ...req.body };

    if (loggedInUser.role === 'sales') {
      customerData.userId = loggedInUser.id;
    }
    
    await db.Customer.create(customerData);
    res.redirect('/customers');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Tampilkan form edit customer
exports.showEditCustomerForm = async (req, res) => {
  try {
    const customer = await db.Customer.findByPk(req.params.id, {
      include: [{ model: db.User, as: 'sales', attributes: ['id', 'username'] }]
    });
    if (!customer) {
      return res.status(404).send('Customer not found');
    }

    const loggedInUser = req.session.user;
    let salesUsers = [];

    if (loggedInUser.role === 'admin' || loggedInUser.role === 'manager') {
      salesUsers = await db.User.findAll({
        where: { role: 'sales' },
        attributes: ['id', 'username']
      });
    }

    res.render('customers/edit', { customer, salesUsers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Proses update customer
exports.updateCustomer = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    const customerData = { ...req.body };

    if (loggedInUser.role === 'sales') {
      delete customerData.userId;
    }

    await db.Customer.update(customerData, {
      where: { id: req.params.id }
    });
    res.redirect('/customers');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Hapus customer
exports.deleteCustomer = async (req, res) => {
  try {
    await db.Customer.destroy({
      where: { id: req.params.id }
    });
    res.redirect('/customers');
  } catch (err) {
    res.status(500).send(err.message);
  }
};