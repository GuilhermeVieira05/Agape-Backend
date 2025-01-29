const express = require('express')
const sequelize = require('./config/db')
const routes = require('./routes/routes')
const app = express()
require('dotenv').config();

app.use(express.json())
app.use('/api', routes)

sequelize.authenticate()
    .then(() => {
        console.log('Conexão com o banco de dados foi bem-sucedida!');
    })
    .catch((error) => {
        console.error('Não foi possível conectar ao banco de dados:', error);
    });

sequelize.sync()
    .then(() => {
        console.log('Banco de dados sincronizado!');
    })
    .catch((error) => {
        console.error('Erro ao sincronizar banco de dados:', error);
    });

app.listen(5004, () => {
    console.log('Servidor rodando na porta 5000'  );
});

module.exports = app

