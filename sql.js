let mysql = require('mysql');
const axios = require('axios');



var conn = mysql.createConnection({
    host:"mext.mysql.database.azure.com", 
    user:"joao", 
    password:"Upskill2022", 
    database:"mext", 
    port:3306});

   

const config = {
    method: 'get',
    url: 'https://www.strava.com/api/v3/athlete',
    headers: { 'Authorization': 'Bearer a137ba38e0a50c2cb2e8e986632418650b931050' }
}

let res = axios(config).then(resp => {
    console.log(resp.data);
    console.log(resp.data.firstname);
    console.log(resp.data.lastname);
    console.log(resp.data.sex);
    var firstname = resp.data.firstname;
    var lastname = resp.data.lastname;
    var sex = resp.data.sex;
    var sql = `insert into user (user_firstname, user_lastname, user_sex) values ( "${firstname}", "${lastname}", "${sex}")`;
    console.log(sql);

    conn.query(sql);
});


conn.connect(function(err) {
    if (err) {
        return console.error('error: ' + err.message);
    }

    console.log('Connect to the MySQL server. ');
});

