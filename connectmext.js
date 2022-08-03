var mysql = require('mysql');


var conn = mysql.createConnection({
host:"mext.mysql.database.azure.com", 
user:"username", 
password:"password", 
database:"database", 
port:3306});


conn.connect(function(err) {
    if (err) {
        return console.error('error: ' + err.message);
    }

    console.log('Connect to the MySQL server. ');
});
