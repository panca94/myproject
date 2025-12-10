const bcrypt = require('bcryptjs');

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    username: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
    role: {
      type: DataTypes.ENUM('admin', 'sales', 'manager'),
      defaultValue: 'sales'
    }
  });

  // Hooks
  User.beforeCreate(async (user) => {
    user.password = await bcrypt.hash(user.password, 10);
  });

  User.beforeUpdate(async (user) => {
    if (user.changed('password')) {
      user.password = await bcrypt.hash(user.password, 10);
    }
  });

  // Relasi
  User.associate = (models) => {
    User.hasMany(models.Project, { foreignKey: 'userId', as: 'projects' });
    User.hasMany(models.Customer, { foreignKey: 'userId', as: 'customers' });
  };

  return User;
};
