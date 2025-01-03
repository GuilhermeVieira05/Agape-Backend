const { DataTypes } = require('sequelize')
const sequelize = require('../config/db')

const Obra = sequelize.define('Obra', {
    id:{
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nome:{
        type: DataTypes.STRING,
        allowNull: false
    },
    cep: {
        type: DataTypes.STRING,
        allowNull: false
    },
    rua:{
        type: DataTypes.STRING
    },
    bairro:{
        type: DataTypes.STRING
    },
    numero:{
        type: DataTypes.STRING
    },
    complemento:{
        type: DataTypes.STRING
    },
})

module.exports = Obra