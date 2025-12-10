module.exports = (sequelize, DataTypes) => {
  const Customer = sequelize.define(
    "Customer",
    {
      name: DataTypes.STRING,
      address: DataTypes.STRING,
      email: DataTypes.STRING,
      phone: DataTypes.STRING,
      note: DataTypes.TEXT,
      salesId: {
        type: DataTypes.INTEGER,
        references: {
          model: 'Users',
          key: 'id'
        }
      }
    },
    {}
  );

  Customer.associate = (models) => {
    Customer.belongsTo(models.User, { foreignKey: 'salesId', as: 'sales' });
  };

  return Customer;
};
