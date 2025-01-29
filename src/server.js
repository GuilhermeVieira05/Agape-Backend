require('dotenv').config();
const app = require('./app')
const PORT = process.env.PORT || 3000;

app.listen(5004, () =>{
    console.log(`Server running on http://localhost:${5002}`)
})