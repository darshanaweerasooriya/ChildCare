const mongoose = require('mongoose');
const db = require('../config/db');

const {Schema} = mongoose;

const postingSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    }
});

const postingModel = mongoose.model('Post', postingSchema);

module.exports = postingModel;
