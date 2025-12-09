const db = require('../models');

// Tampilkan daftar project
exports.showProjects = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    let whereClause = {};

    // Filter proyek berdasarkan role user yang login
    if (loggedInUser.role === 'sales') {
      whereClause.userId = loggedInUser.id;
    }

    // Ambil data query dari URL untuk pagination
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const offset = (page - 1) * limit;
    
    // Jalankan query ke database dengan pagination
    const data = await db.Project.findAndCountAll({
      where: whereClause,
      include: [
        { model: db.User, as: 'accountManager', attributes: ['username'] },
        { model: db.Customer, as: 'customer', attributes: ['name'] }
      ],
      order: [['id', 'ASC']],
      limit: limit,
      offset: offset
    });

    const projects = data.rows;
    const totalProjects = data.count;
    const totalPages = Math.ceil(totalProjects / limit);

    // --- LOGIKA UNTUK MENGHITUNG TOTAL NILAI PROYEK ---
    const totalValue = projects.reduce((total, project) => {
      const amount = parseFloat(project.amount) || 0;
      return total + amount;
    }, 0);
    // --- AKHIR LOGIKA ---

    // Kirim semua data ke view
    res.render('projects/list', { 
      projects, 
      currentPage: page, 
      totalPages, 
      totalValue, // <-- INI ADALAH YANG PENTING
      totalProjects,
      user: req.session.user 
    });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

// ... (tambahkan kembali fungsi lainnya: showAddProjectForm, addProject, showEditProjectForm, updateProject, deleteProject)
// Saya akan memberikan semua fungsi lainnya agar tidak ada yang kurang
exports.showAddProjectForm = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    let users = [];
    let customers = [];

    if (loggedInUser.role === 'sales') {
      users = await db.User.findAll({
        where: { id: loggedInUser.id },
        attributes: ['id', 'username']
      });
    } else {
      users = await db.User.findAll({ attributes: ['id', 'username'] });
    }
    
    customers = await db.Customer.findAll({ attributes: ['id', 'name'] });

    res.render('projects/add', { users, customers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.addProject = async (req, res) => {
  try {
    await db.Project.create(req.body);
    res.redirect('/projects');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.showEditProjectForm = async (req, res) => {
  try {
    const project = await db.Project.findByPk(req.params.id, {
      include: [
        { model: db.User, as: 'accountManager', attributes: ['id', 'username'] },
        { model: db.Customer, as: 'customer', attributes: ['id', 'name'] }
      ]
    });
    const users = await db.User.findAll({ attributes: ['id', 'username'] });
    const customers = await db.Customer.findAll({ attributes: ['id', 'name'] });

    if (!project) {
      return res.status(404).send('Project not found');
    }
    res.render('projects/edit', { project, users, customers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.updateProject = async (req, res) => {
  try {
    await db.Project.update(req.body, {
      where: { id: req.params.id }
    });
    res.redirect('/projects');
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.deleteProject = async (req, res) => {
  try {
    await db.Project.destroy({
      where: { id: req.params.id }
    });
    res.redirect('/projects');
  } catch (err) {
    res.status(500).send(err.message);
  }
};