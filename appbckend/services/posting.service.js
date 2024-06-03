const postingModel = require('../model/posting.model')
class postingservice{
    static async posting(title,description){
        try{
            const createpost = new postingModel({title,description});
            return await createpost.save();
        }catch(err){
            throw err;
        }
    }
    static async getpost(title){
        const postdata = await postingModel.find({title})

        return postdata;
    }
}
module.exports = postingservice;