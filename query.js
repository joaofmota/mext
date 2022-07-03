let mysql = require('mysql');
let connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'NomeDB'
});

// connect to the MySQL server
connection.connect(function(err) {
  if (err) {
    return console.error('error: ' + err.message);
  }

  let createTable = `create table if not exists Table(
                          id int primary key auto_increment,
                          Coluna1 varchar(255)not null,
                          Coluna2 tinyint(1) not null default 0
                      )`;

  connection.query(createTable, function(err, results, fields) {
    if (err) {
      console.log(err.message);
    }
  });

  connection.end(function(err) {
    if (err) {
      return console.log(err.message);
    }
  });
});
