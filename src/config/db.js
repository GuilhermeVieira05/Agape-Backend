require('dotenv').config()
const { Sequelize } = require('sequelize')

const sequelize = new Sequelize({
    username: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    dialect: 'postgres',
    logging: false
})

module.exports = sequelize