const express = require('express');
const router =express.Router();
const predictionController = require('../controller/predict.controller');

route.post('/savePrediction',predictionController.savePrediction);

module.exports = router;