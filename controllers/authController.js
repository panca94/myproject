const db = require('../models');
const bcrypt = require('bcryptjs');

exports.showLogin = (req, res) => {
  res.render('auth/login', { error: null });
};

exports.login = async (req, res) => {
  const { username, password } = req.body;

  try {
    // Cari user berdasarkan username (bukan email!)
    const user = await db.User.findOne({ where: { username } });

    if (!user) {
      return res.render('auth/login', { error: 'Username tidak ditemukan' });
    }

    // Cek password
    const match = await bcrypt.compare(password, user.password);

    if (!match) {
      return res.render('auth/login', { error: 'Password salah' });
    }

    // Simpan session
    req.session.user = {
      id: user.id,
      username: user.username,
      role: user.role
    };

    return res.redirect('/dashboard');

  } catch (err) {
    console.error(err);
    return res.render('auth/login', { error: 'Terjadi kesalahan server' });
  }
};

exports.logout = (req, res) => {
  req.session.destroy(() => {
    res.redirect('/login');
  });
};
