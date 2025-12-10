const { Customer, User } = require('../models');

exports.showCustomers = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = 20;
    const offset = (page - 1) * limit;

    const { count, rows: customers } = await Customer.findAndCountAll({
      offset,
      limit,
      include: [{ model: User, as: 'sales' }],
      order: [['id', 'ASC']]
    });

    res.render('customers/list', {
      customers,
      currentPage: page,
      totalPages: Math.ceil(count / limit)
    });

  } catch (err) {
    console.error(err);
    res.status(500).send("Error loading customers");
  }
};

exports.addForm = async (req, res) => {
  const users = await User.findAll();
  res.render('customers/add', { users });
};

exports.addCustomer = async (req, res) => {
  await Customer.create(req.body);
  res.redirect('/customers');
};

exports.editForm = async (req, res) => {
  const customer = await Customer.findByPk(req.params.id);
  const users = await User.findAll();
  res.render('customers/edit', { customer, users });
};

exports.updateCustomer = async (req, res) => {
  await Customer.update(req.body, { where: { id: req.params.id } });
  res.redirect('/customers');
};

exports.deleteCustomer = async (req, res) => {
  await Customer.destroy({ where: { id: req.params.id } });
  res.redirect('/customers');
};
