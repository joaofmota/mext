let mysql  = require('mysql');
let config = require('./config.js');
let connection = mysql.createConnection(config);

var conn = mysql.createConnection({
host:"mext.mysql.database.azure.com", 
user:"username", 
password:"password", 
database:"database", 
port:3306});

// insert statment
let sql = `INSERT INTO Table(Coluna1,Coluna2)
           VALUES('Exemplo',true)`;

// execute the insert statment
connection.query(sql);

connection.end();
