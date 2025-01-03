const { DataTypes } = require('sequelize')
const sequelize = require('../config/db')

const Servicos = sequelize.define('Servicos', {
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_obra:{
        type: DataTypes.INTEGER,
        foreignKey: true
    },
    nome:{
        type: DataTypes.STRING,
        allowNull: false
    }
})

module.exports = Servicos