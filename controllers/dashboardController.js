const db = require('../models');

exports.showDashboard = async (req, res) => {
  try {
    const totalCustomers = await db.Customer.count();
    const totalProjects = await db.Project.count();
    res.render('dashboard', {
      totalCustomers,
      totalProjects,
      user: req.session.user
    });
  } catch (err) {
    res.status(500).send(err.message);
  }
};