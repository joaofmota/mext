const axios = require('axios');

const config = {
    method: 'get',
    url: 'https://www.strava.com/api/v3/athlete',
    headers: { 'Authorization': 'Bearer a137ba38e0a50c2cb2e8e986632418650b931050' }
}

let res = axios(config).then(resp => {
    console.log(resp.data);
    console.log(resp.data.id);
    console.log(resp.data.firstname);
    var firstname = resp.data.firstname;
    var id = resp.data.id;
    var sql = `insert into ttt (id, firstname) values ( ${id}, "${firstname}")`;
    console.log(sql);
});
