const app = require('./app');
const db = require('./config/db')
const UserModel = require('./model/user.model')
const postin = require('./model/posting.model')
const predict = require('./model/predicted.model')

const port = 3000;

app.get('/',(req,res)=>{
    res.send("Hello World!!!!!1")
})



app.listen(port,()=>{
    console.log('Server Listening on port http://localhost:${port}');
})