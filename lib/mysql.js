/**
 * Created by lianghongrong on 2016/3/28 0028.
 */
var mysql = require("mysql");
var conn = null;

exports.connect = function(){
	//连接数据库
    conn = mysql.createConnection({
       host: '127.0.0.1',
        user:'adminXElmB9i',
        password:'hkHnBTJlgWH1',
        database:'zuche',
        port:3306
    });

    conn.connect(function(error){
        if (error){
            console.log("error connect"+error.stack);
        }else {
            console.log('tid:'+conn.threadId);
        }
    })
};
exports.query = function(sql,fun){
	conn.query(sql,fun);
};
exports.close = function(){
    conn.end();
};
//防止sql注入
exports.escapeString = function(str){
    return conn.escape(str);
};
exports.getConnection = function(){
    return conn;
};