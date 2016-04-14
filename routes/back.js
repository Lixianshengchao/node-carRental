/**
 * Created by lianghongrong on 2016/3/29 0029.
 */
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('back', { title: 'back' });
});

//后台主要内容
router.get('/main', function (req,res,next) {
	res.render('backstage/index',{title:'租车后台系统'});
});
module.exports = router;
