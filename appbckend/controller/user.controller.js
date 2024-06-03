const { request } = require("../app");
const userService = require("../services/user.services");

exports.register = async(req,res,next)=>{
    try{
        const {Username,password,Email,phonenumb} = req.body;

        const successReq = await userService.registerUser(Username,password,Email,phonenumb);

        res.json({status:true,success:"User Registration Successfully"});

    }catch(error){
        throw error
    }
}

exports.login = async(req,res,next)=>{
    try{
        const {Username,password} = req.body;
       

        const user = await userService.checkuser(Username);
       

        if(!user){
            throw new Error('User does not exist');
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch == false){
            throw new Error("Invalid Password");
        }
        let tokenData = {_id:user._id,Username:user.Username};

        const token = await userService.generateToken(tokenData,"secretKey",'1')

        res.status(200).json({status:true,token:token})

        
    }catch(error){
        throw error
    }


}

exports.getuser = async (req,res,next)=>{
    try{
        const {Username} = req.body;

        let userdetail = await userService.getusetdata(Username);

        res.json({status:true,success:userdetail});
    }catch (error){
        next(error);
    }
}
