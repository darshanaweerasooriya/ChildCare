// const Prediction = require('../model/predicted.model')

// exports.savePrediction = async (req, res)=>{
//     try{
//         const { disease } = req.body;
//         const Prediction = new Prediction({ disease });
//         await Prediction.save();
//         res.status(201).json({ success: true, prediction });
//     }catch(error){
//         console.error(error);
//         res.status(500).json({ success: false, message: 'Failed to save prediction' });
//     }
// }