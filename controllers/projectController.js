const db = require('../models');

// Tampilkan daftar project
exports.showProjects = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    let whereClause = {};
    const { Op } = db.Sequelize;

    // Ambil query search dari URL
    const search = (req.query.search || '').trim();

    // Filter proyek berdasarkan role user yang login
    if (loggedInUser.role === 'sales') {
      whereClause.userId = loggedInUser.id;
    }

    // Ambil data query dari URL untuk pagination
    const page = parseInt(req.query.page) || 1;
    const limit = 10;
    const offset = (page - 1) * limit;
    // Jika ada search, gabungkan kondisi pencarian dengan whereClause
    let finalWhere = whereClause;
    if (search) {
      const searchWhere = {
        [Op.or]: [
          { projectName: { [Op.like]: `%${search}%` } },
          { status: { [Op.like]: `%${search}%` } },
          { update_status: { [Op.like]: `%${search}%` } },
          { challenge: { [Op.like]: `%${search}%` } },    
          db.Sequelize.where(db.Sequelize.col('customer.name'), { [Op.like]: `%${search}%` }),
          db.Sequelize.where(db.Sequelize.col('accountManager.username'), { [Op.like]: `%${search}%` })
        ]
      };

      // jika whereClause kosong, pakai searchWhere, kalau tidak gabungkan dengan AND
      finalWhere = Object.keys(whereClause).length ? { [Op.and]: [whereClause, searchWhere] } : searchWhere;
    }

    // Jalankan query ke database dengan pagination
    const data = await db.Project.findAndCountAll({
      where: finalWhere,
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
    // --- AKHIR LOGIKA ---

    // Hitung Top 5 sales berdasarkan total nilai project dengan status 'Won'
    // Hanya lakukan query ini untuk user dengan role admin atau manager
    let topSales = [];
    if (loggedInUser && (String(loggedInUser.role).toLowerCase() === 'admin' || String(loggedInUser.role).toLowerCase() === 'manager')) {
      // Gunakan agregasi di model Project lalu gabungkan ke User untuk menghindari masalah alias kolom
      const projectAgg = await db.Project.findAll({
        where: { status: 'Won' },
        attributes: [
          'userId',
          [db.Sequelize.fn('SUM', db.Sequelize.literal('`Project`.`amount`')), 'totalValue'],
          [db.Sequelize.fn('COUNT', db.Sequelize.literal('`Project`.`id`')), 'wonCount']
        ],
        group: ['userId'],
        order: [[db.Sequelize.literal('totalValue'), 'DESC']],
        limit: 5,
        include: [{ model: db.User, as: 'accountManager', attributes: ['id', 'username'] }]
      });

      topSales = projectAgg.map(p => ({
        id: p.userId,
        username: p.accountManager ? p.accountManager.username : 'Unknown',
        totalValue: p.get ? Number(p.get('totalValue')) : Number(p.dataValues.totalValue || 0),
        wonCount: p.get ? Number(p.get('wonCount')) : Number(p.dataValues.wonCount || 0)
      }));
    }

    // Kirim semua data ke view
    res.render('projects/list', {
      projects,
      currentPage: page,
      totalPages,
      totalValue, // <-- INI ADALAH YANG PENTING
      totalProjects,
      user: req.session.user,
      search,
      topSales
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

    if (loggedInUser && String(loggedInUser.role).toLowerCase() === 'sales') {
      users = await db.User.findAll({
        where: { id: loggedInUser.id },
        attributes: ['id', 'username']
      });
      customers = await db.Customer.findAll({ where: { salesId: loggedInUser.id }, attributes: ['id', 'name', 'salesId'] });
    } else {
      users = await db.User.findAll({ attributes: ['id', 'username'] });
      customers = await db.Customer.findAll({ attributes: ['id', 'name', 'salesId'] });
    }

    console.log('DEBUG showAddProjectForm - loggedInUser:', loggedInUser);
    console.log('DEBUG showAddProjectForm - customers.length:', customers.length);

    res.render('projects/add', { users, customers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.addProject = async (req, res) => {
  try {
    const loggedInUser = req.session.user;

    console.log('DEBUG addProject - loggedInUser:', loggedInUser);
    console.log('DEBUG addProject - req.body:', req.body);

    // Jika user adalah sales, pastikan customer yang dipilih memang milik sales tersebut
    if (loggedInUser && String(loggedInUser.role).toLowerCase() === 'sales') {
      const customerId = req.body.customerId || req.body.customer;
      const customer = await db.Customer.findByPk(customerId);
      console.log('DEBUG addProject - found customer:', customer && { id: customer.id, salesId: customer.salesId });
      if (!customer) {
        return res.status(400).send('Customer tidak ditemukan');
      }
      if (Number(customer.salesId) !== Number(loggedInUser.id)) {
        console.log(`DEBUG addProject - sales mismatch: customer.salesId=${customer.salesId} loggedInUser.id=${loggedInUser.id}`);
        return res.status(403).send('Anda tidak memiliki hak untuk menambahkan project ke customer ini');
      }
      // Pastikan juga userId pada project adalah yang login (jika form mencoba set userId berbeda)
      req.body.userId = loggedInUser.id;
    }

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
        { model: db.Customer, as: 'customer', attributes: ['id', 'name', 'salesId'] }
      ]
    });
    const users = await db.User.findAll({ attributes: ['id', 'username'] });
    // pastikan customers yang ditampilkan di edit juga sesuai hak akses sales
    const loggedInUser = req.session.user;
    let customers = [];
    if (loggedInUser && String(loggedInUser.role).toLowerCase() === 'sales') {
      customers = await db.Customer.findAll({ where: { salesId: loggedInUser.id }, attributes: ['id', 'name', 'salesId'] });
    } else {
      customers = await db.Customer.findAll({ attributes: ['id', 'name', 'salesId'] });
    }

    console.log('DEBUG showEditProjectForm - loggedInUser:', loggedInUser);
    console.log('DEBUG showEditProjectForm - customers.length:', customers.length);

    if (!project) {
      return res.status(404).send('Project not found');
    }
    // Jika user adalah sales, pastikan project yang akan diedit memiliki customer yang juga milik sales tersebut
    if (loggedInUser && loggedInUser.role === 'sales') {
      if (!project.customer || project.customer.salesId !== loggedInUser.id) {
        return res.status(403).send('Forbidden: Anda tidak dapat mengedit project ini');
      }
    }
    res.render('projects/edit', { project, users, customers, user: req.session.user });
  } catch (err) {
    res.status(500).send(err.message);
  }
};

exports.updateProject = async (req, res) => {
  try {
    const loggedInUser = req.session.user;
    // Jika sales sedang update, pastikan mereka tidak memindahkan project ke customer milik sales lain
    if (loggedInUser && loggedInUser.role === 'sales') {
      const customerId = req.body.customerId || req.body.customer;
      const customer = await db.Customer.findByPk(customerId);
      if (!customer) {
        return res.status(400).send('Customer tidak ditemukan');
      }
      if (customer.salesId !== loggedInUser.id) {
        return res.status(403).send('Anda tidak memiliki hak untuk memindahkan project ke customer ini');
      }
      // pastikan userId tetap ID yang login
      req.body.userId = loggedInUser.id;
    }

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