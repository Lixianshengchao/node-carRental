/**
 * Created by lianghongrong on 2016/3/30 0030.
 */

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('information', { title: 'information' });
});
router.get("/infor_single", function (req,res,next) {
	res.render('infor_single',{title:"infor_single"})
});
module.exports = router;
