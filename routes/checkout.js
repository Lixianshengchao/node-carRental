/**
 * Created by lianghongrong on 2016/3/30 0030.
 */
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('checkout', { title: 'checkout' });
});
module.exports = router;
