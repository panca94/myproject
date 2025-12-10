const { Customer, User } = require('../models');
const { Op } = require('sequelize');

exports.list = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const offset = (page - 1) * limit;

    const search = req.query.search || "";

    const where = search
      ? {
          [Op.or]: [
            { name: { [Op.like]: `%${search}%` } },
            { email: { [Op.like]: `%${search}%` } },
            { phone: { [Op.like]: `%${search}%` } },
            { address: { [Op.like]: `%${search}%` } },
            { note: { [Op.like]: `%${search}%` } },
            { '$sales.username$': { [Op.like]: `%${search}%` } },
          ],
        }
      : {};

    const { rows: customers, count } = await Customer.findAndCountAll({
      where,
      limit,
      offset,
      order: [['id', 'DESC']],
      include: [{ model: User, as: 'sales' }],
    });

    const totalPages = Math.ceil(count / limit);

    res.render('customers/list', {
      customers,
      currentPage: page,
      totalPages,
      search,
    });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.addForm = async (req, res) => {
  const users = await User.findAll();
  res.render('customers/add', { users });
};

exports.add = async (req, res) => {
  await Customer.create(req.body);
  res.redirect('/customers');
};

exports.editForm = async (req, res) => {
  const customer = await Customer.findByPk(req.params.id);
  const users = await User.findAll();
  res.render('customers/edit', { customer, users });
};

exports.update = async (req, res) => {
  await Customer.update(req.body, { where: { id: req.params.id } });
  res.redirect('/customers');
};

exports.delete = async (req, res) => {
  await Customer.destroy({ where: { id: req.params.id } });
  res.redirect('/customers');
};
