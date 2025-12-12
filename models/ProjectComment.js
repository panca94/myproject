module.exports = (sequelize, DataTypes) => {
  const ProjectComment = sequelize.define('ProjectComment', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    comment: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    projectId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Projects',
        key: 'id'
      }
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id'
      }
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  }, {
    timestamps: true,
    tableName: 'ProjectComments'
  });

  ProjectComment.associate = (models) => {
    ProjectComment.belongsTo(models.Project, { foreignKey: 'projectId', as: 'project' });
    ProjectComment.belongsTo(models.User, { foreignKey: 'userId', as: 'author' });
  };

  return ProjectComment;
};
