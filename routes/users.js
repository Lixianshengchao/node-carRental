var express = require('express');
var router = express.Router();
//导入自定义mysql库
var mysql = require('../lib/mysql');
/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//设置登录页面路由
router.get('/login',function(req,res,next){
	res.render("login",{title:'hrope.cn - login'});
});
//url在post方式下打开

/*  异步实现登录验证方法1：
router.post("/login",function(req,res,next){
	//获取表单提交过来的数据
	var userName = req.body.username;
	var password = req.body.password;
	mysql.connect();
	var sql = "select * from z_user where uemail="+mysql.escapeString(userName);
	mysql.query(sql,function(para1,para2,para3){
		var data = para2;
		if (data && data.length == 1 && data[0]['password'] == password){
			res.render('login', { title: 'hrope',success:true});
		}else{
			res.render('login', { title: 'hrope',errors:[{error:"登录失败，账号或密码错误"}]});
		}
		//console.log(data);
		//res.send(JSON.stringify(data));
		mysql.close();
	})
});
*/

/** 事件机制通过监听实现登录验证的方法2：*/
//引入事件模块
var events = require("events");
//引入Q库，需要安装npm install Q --save
var Q = require("Q");
//创建事件发射器
var eventEmiiter = new events.EventEmitter();
router.post('/login',function(req,res,next){
	var username = req.body.username;
	var password = req.body.password;

	//监听loginok事件（登录成功）
	eventEmiiter.on("loginok",function(user){
		//登录成功后，发送cookie到客户端
		res.cookie('loginuid',user.uid);
		res.cookie('loginname',user.uname);
		res.render('login', { title: 'hrope',success:true});
	});

	//监听loginfailed事件（登录失败）
	eventEmiiter.on('loginfailed',function(){
		res.render('login', { title: 'hrope',errors:[{error:"登录失败，账号或密码错误"}]});
	});

	checkUser(username,password);
});
//获取用户名即密码
function getUserByUserNamePass(userName,password){
	var defered = Q.defer();
	mysql.getConnection().query("select * from z_user where uemail="+mysql.escapeString(userName)+"and password="+mysql.escapeString(password),defered.makeNodeResolver());
	return defered.promise;
}
//验证user登录
function checkUser(userName,password){
	mysql.connect();
	//all()可以取得多个查询的结果
	Q.all([getUserByUserNamePass(userName,password)]).then(function(results){
		console.log(results);
		eventEmiiter.emit("loginfailed");
		mysql.close();

	})
}

//设置注册页面路由
router.get("/register",function(req,res,next){
	res.render("register",{title:"hrope.cn - register"});
});
router.post("/register",function(req,res,next){

});


//获取数据库信息测试
//router.get('/list',function(req,res,next){
//  var html = "";
//  mysql.connect();
//  mysql.query("select * from user",function(para1,para2,para3){
//	  debugger;
//	  console.log("OK");
//	  data = para2;
//	  var uid = 0;
//	  for ( x in data){
//		  console.log("uid" +data[x]['uid']+" name"+data[x]['name']);
//		  uid = data[x]['uid'];
//	  }
//	  if (uid){
//		  console.log("new uid" + uid);
//		  mysql.query("SELECT * FROM z_car WHERE uid="+mysql.escapeString(uid),function(para1,para2,para3){
//			  console.log(para2);
//			  //回调结束后才关闭mysql链接
//			  mysql.close();
//		  });
//	  }
//	  res.send(JSON.stringify(data));
//  });
//});
module.exports = router;

