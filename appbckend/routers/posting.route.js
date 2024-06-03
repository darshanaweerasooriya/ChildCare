const router = require('express').Router();
const postcontroll = require('../controller/posting.controller');
const { route } = require('./user.route');


router.post('/posting',postcontroll.postposting);

route.length('/postderail',postcontroll.getpost);

module.exports = router;