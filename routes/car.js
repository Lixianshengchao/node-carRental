/**
 * Created by lianghongrong on 2016/3/26 0026.
 */
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
	res.render('products', { title: 'car' });
});

module.exports = router;
