const sequelize = require('../config/database');
const User = require('./User');
const Customer = require('./Customer');
const Project = require('./Project');

// --- Definisikan semua relasi di sini ---

// Relasi User dan Project
User.hasMany(Project, { foreignKey: 'userId', as: 'projects' });
Project.belongsTo(User, { foreignKey: 'userId', as: 'accountManager' });

// Relasi Customer dan Project
Customer.hasMany(Project, { foreignKey: 'customerId', as: 'projects' });
Project.belongsTo(Customer, { foreignKey: 'customerId', as: 'customer' });

// Relasi User dan Customer
User.hasMany(Customer, { foreignKey: 'userId', as: 'customers' });
Customer.belongsTo(User, { foreignKey: 'userId', as: 'sales' });

// ------------------------------------

const db = {
  sequelize,
  User,    // Pastikan ini 'U' kapital
  Customer, // Pastikan ini 'C' kapital
  Project   // Pastikan ini 'P' kapital
};

module.exports = db;