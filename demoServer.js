

var mysql = require('mysql');
var express = require('express')
var bodyParser = require('body-parser');
var authenticate=require("./authent.json")

var app=express()
var PORT=8081;
app.use(express.json()) 
app.use(bodyParser.urlencoded({ extended: true })); 

app.use(express.static('./filesForBrowser'))

// Initializing the router from express
var router = express.Router();


// Creating a POST request
app.post('/search', function(req, res) {
    
    let connection = mysql.createConnection(authenticate);
    let first = req.body.firstName;
    let last = req.body.lastName;
    let sql = `SELECT 
    persons.firstName, persons.lastName, coalesce(persons.dob, persons.birthYear) as bDate,coalesce(persons.dod,persons.deathYear) as dDate,locations.svgID 
    FROM persons inner join locations  on persons.locationId = locations.locationID WHERE `
    let value=[]
    if(first === '' ^ last === ''){
        if(first === ''){
            sql +=  `lastName like concat('%',?,'%')`;
            value = [last];
        }else{
            sql += `firstName like concat('%',?,'%')`;
            value = [first];
        }
    }else{
        if(first!==''){
            sql += `firstName like concat('%',?,'%') or lastName like concat('%',?,'%')`;
            value =[first,last]
        }
        else{
            sql=false
        }
    }
    if(sql!=false){
        connection.query(sql, value, (error, results, fields) => {
            if (error) {
                console.log(error.message);
                res.send('error in search terms')
            }
            console.log(results);
            res.send(results);
        });
        connection.end(); 
    }else{
        res.send("no search terms")
    }
  });

// App listening on the below port
app.listen(PORT, function(err){
   if (err) console.log(err);
   console.log("Server listening on PORT", PORT);
});
