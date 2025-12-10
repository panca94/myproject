const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.json')[env];

const db = {};
let sequelize;

sequelize = new Sequelize(
  config.database,
  config.username,
  config.password,
  config
);

fs.readdirSync(__dirname)
  .filter((file) => {
    return (
      file.indexOf('.') !== 0 && // skip hidden file
      file !== basename &&       // skip index.js itself
      file.slice(-3) === '.js' && // hanya file .js
      !file.includes('.test.')    // skip test file
    );
  })
  .forEach((file) => {
    const modelFn = require(path.join(__dirname, file));

    // kalau hasil require bukan function → skip
    if (typeof modelFn !== 'function') {
      console.log(`⚠️  Skip file bukan model: ${file}`);
      return;
    }

    const model = modelFn(sequelize, Sequelize.DataTypes);
    db[model.name] = model;
  });

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
