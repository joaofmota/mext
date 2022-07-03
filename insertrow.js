let mysql  = require('mysql');
let config = require('./config.js');
let connection = mysql.createConnection(config);

// insert statment
let sql = `INSERT INTO Table(Coluna1,Coluna2)
           VALUES('Exemplo',true)`;

// execute the insert statment
connection.query(sql);

connection.end();
