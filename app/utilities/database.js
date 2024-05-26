const Sequelize = require('sequelize');
const sequelize = new Sequelize({
    username: process.env.DB_USER,     
    password: process.env.DB_PW,     
    database: process.env.DB_NAME,   
    host: 'localhost',     
    dialect: 'mssql',
});

module.exports = sequelize;
