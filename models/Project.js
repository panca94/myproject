module.exports = (sequelize, DataTypes) => {
  const Project = sequelize.define('Project', {
    projectName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    projectDate: {
      type: DataTypes.DATEONLY,
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
    
    customerId: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  });

  Project.associate = (models) => {
    Project.belongsTo(models.User, { foreignKey: 'userId', as: 'accountManager' });
    Project.belongsTo(models.Customer, { foreignKey: 'customerId', as: 'customer' });
    Project.hasMany(models.ProjectComment, { foreignKey: 'projectId', as: 'comments' });
  };

  return Project;
};
