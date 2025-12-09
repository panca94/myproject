const db = require('../models');

// Tampilkan daftar user
exports.showUsers = async (req, res) => {
  try {
    const users = await db.User.findAll({ order: [['id', 'ASC']] });
    res.render('users/list', { users, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Tampilkan form tambah user
exports.showAddUserForm = (req, res) => {
  res.render('users/add', { user: req.session.user });
};

// Proses tambah user
exports.addUser = async (req, res) => {
  try {
    await db.User.create(req.body);
    res.redirect('/users');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Tampilkan form edit user
exports.showEditUserForm = async (req, res) => {
  try {
    const user = await db.User.findByPk(req.params.id);
    if (!user) {
      return res.status(404).send('User not found');
    }
    res.render('users/edit', { user, userSession: req.session.user }); // bedakan nama variabel
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Proses update user
exports.updateUser = async (req, res) => {
  try {
    const { username, password, role } = req.body;
    const updateData = { username, role };

    // Hanya update password jika diisi
    if (password) {
      updateData.password = password; // Akan dienkripsi otomatis oleh hook
    }

    await db.User.update(updateData, {
      where: { id: req.params.id }
    });
    res.redirect('/users');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// Hapus user
exports.deleteUser = async (req, res) => {
  try {
    await db.User.destroy({
      where: { id: req.params.id }
    });
    res.redirect('/users');
  } catch (err) {
    res.status(500).send(err.message);
  }
};