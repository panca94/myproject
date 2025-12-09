const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Project = sequelize.define('Project', {
  projectName: {
    type: DataTypes.STRING,
    allowNull: false
  },
  // Tambahkan kolom tanggal baru
  projectDate: {
    type: DataTypes.DATEONLY, // Hanya tanggal, tanpa waktu
    allowNull: true
  },
  amount: {
    type: DataTypes.BIGINT,
    defaultValue: 0
  },
  status: {
    type: DataTypes.ENUM('Budgeting', 'Won', 'On Progress', 'Lost', 'Re-Tender'),
    allowNull: true,
    defaultValue: 'On Progress'
  },
  update_status: {
    type: DataTypes.ENUM('Proposal Submit', 'Eng Calculate', 'Won'), // Sudah benar
    allowNull: true
  },
  challenge: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  customerId: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  userId: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
});

module.exports = Project;