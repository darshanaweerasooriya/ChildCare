const mongoose = require('mongoose');
const bcrypt = require("bcrypt");

const db = require('../config/db');

const {Scheme} = mongoose;

const UserSchema = new mongoose.Schema({
    Username : {
        type: String,
        lowercase:true,
        required: true,
        
    },
    password: {
        type: String,
        required: true,
    },
    Email: {
        type: String,
        lowercase:true,
        required: true,
      

    },
    phonenumb: {
        type: Number,
        required: true,
    }
});
UserSchema.pre('save',async function(){
    try{
        var user = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);

        user.password = hashpass;
    }catch (error){
        throw error;
    }
});

UserSchema.methods.comparePassword = async function(userPassword){
    try{
        const isMatch = await bcrypt.compare(userPassword, this.password);
        return isMatch;

    }catch(error){
        throw error;
    }
}



const UserModel = db.model('user',UserSchema);
module.exports =UserModel;