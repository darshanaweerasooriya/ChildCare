const UserModel = require('../model/user.model')
const  jwt = require("jsonwebtoken");


class userService{
    static async registerUser(Username,password,Email,phonenumb){
        try{
            const createUser = new  UserModel({Username,password,Email,phonenumb});
            return await createUser.save();

        }catch(err){
            throw err;
        }

    }
    static async checkuser(Username){
        try{
            return await UserModel.findOne({Username})

        }catch (error){
            throw error
        }
    }

static async generateToken(tokenData,secretKey,jwt_expire){
    return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire});

}

static async getusetdata(Username){
    const userdata = await UserModel.find({Username})

    return userdata;
}

}

module.exports = userService;