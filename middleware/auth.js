const db = require('../models');

/**
 * Middleware untuk memastikan user sudah login.
 * Jika belum, redirect ke halaman login.
 */
function isAuthenticated(req, res, next) {
  if (req.session.user) {
    return next();
  }
  res.redirect('/login');
}

/**
 * Middleware untuk memastikan user adalah admin.
 * Harus digunakan SETELAH middleware isAuthenticated.
 */
function isAdmin(req, res, next) {
  if (req.session.user && req.session.user.role === 'admin') {
    return next();
  }
  res.status(403).send('Forbidden: You do not have permission to access this page.');
}

/**
 * Middleware untuk memastikan user hanya bisa mengakses data proyek miliknya sendiri.
 * Admin dan Manager bisa mengakses semua data.
 * Harus digunakan SETELAH middleware isAuthenticated.
 */
function isOwner(req, res, next) {
  const loggedInUser = req.session.user;

  // Admin dan Manager bisa mengakses semua data
  if (loggedInUser.role === 'admin' || loggedInUser.role === 'manager') {
    return next();
  }

  // Sales hanya bisa mengakses data miliknya sendiri
  db.Project.findByPk(req.params.id)
    .then(project => {
      if (!project) {
        return res.status(404).send('Project not found');
      }
      // Jika userId proyek tidak sama dengan id user yang login, tolak akses
      if (project.userId !== loggedInUser.id) {
        return res.status(403).send('Forbidden: You are not the owner of this project.');
      }
      // Jika sama, lanjutkan ke request berikutnya
      req.project = project; // Simpan data proyek untuk digunakan di controller jika perlu
      next();
    })
    .catch(err => {
      res.status(500).send(err.message);
    });
}

/**
 * Middleware untuk memastikan user hanya bisa mengakses data customer miliknya sendiri.
 * Admin dan Manager bisa mengakses semua data.
 * Harus digunakan SETELAH middleware isAuthenticated.
 */
function isCustomerOwner(req, res, next) {
  const loggedInUser = req.session.user;

  // Admin dan Manager bisa mengakses semua data
  if (loggedInUser.role === 'admin' || loggedInUser.role === 'manager') {
    return next();
  }

  // Sales hanya bisa mengakses data miliknya sendiri
  db.Customer.findByPk(req.params.id)
    .then(customer => {
      if (!customer) {
        return res.status(404).send('Customer not found');
      }
      // Jika userId customer tidak sama dengan id user yang login, tolak akses
      if (customer.userId !== loggedInUser.id) {
        return res.status(403).send('Forbidden: You are not the owner of this customer.');
      }
      // Jika sama, lanjutkan ke request berikutnya
      req.customer = customer; // Simpan data customer untuk digunakan di controller jika perlu
      next();
    })
    .catch(err => {
      res.status(500).send(err.message);
    });
}

// Ekspor semua fungsi middleware agar bisa digunakan di file lain (seperti routes)
module.exports = {
  isAuthenticated,
  isAdmin,
  isOwner,
  isCustomerOwner,
  // Admin atau Manager checker
  isAdminOrManager: function (req, res, next) {
    if (req.session.user && (req.session.user.role === 'admin' || req.session.user.role === 'manager')) {
      return next();
    }
    res.status(403).send('Forbidden: You do not have permission to access this page.');
  }
};