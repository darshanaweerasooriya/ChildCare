const { request } = require("../app");
const postingservice = require('../services/posting.service');

exports.postposting = async (req, res, next) => {
    try {
        const {title, description} = req.body;
        const postsuccess = await postingservice.posting(title, description);

        res.json({status:true,success:"Posting Successfully" });

    } catch (err) {
        throw(err); // Pass the error to the error handling middleware
    }
}

exports.getpost = async (req,res,next)=>{
    try{
        const {title} = req.body;

        let postdetails = await postingservice.getpost(title);

        res.json({status:true,success:postdetails});

    }catch(error){
        next(error);
    }
}
