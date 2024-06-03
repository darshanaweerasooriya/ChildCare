const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.route');
const postingrouting = require('./routers/posting.route');
// const predictionroute = require('./routers/predict.rout')

const app = express();

app.use(body_parser.json());

app.use('/',userRouter);

app.use('/',postingrouting);

// app.use('/',predictionroute);

module.exports = app;