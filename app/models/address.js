const Sequelize = require('sequelize');
const sequelize = require('../utilities/database');

const Address = sequelize.define('Address', {
    ID: {
        type: Sequelize.STRING(100),
        allowNull: false,
        primaryKey: true,
    },
    Name: {
        type: Sequelize.STRING(255),
        allowNull: false,
    },
}, {
    tableName: 'Addresses', // Specify the table name to match the existing table
    timestamps: false, // Disable timestamps if not using createdAt and updatedAt
});

module.exports = Address