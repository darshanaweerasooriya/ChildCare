const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb+srv://darshanaweerasooriya:meekiri213@cluster0.jmq2pfn.mongodb.net/USerdetails?retryWrites=true&w=majority&appName=Cluster0').on('open',()=>{
    console.log("MongoDb connected Successfully");
}).on('error',()=>{
    console.log("Data base connection error");
});


module.exports = connection;