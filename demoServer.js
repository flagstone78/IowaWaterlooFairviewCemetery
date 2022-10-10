var http = require('http');
var fs = require('fs');
http.createServer(function (req, res) {
    console.log(req.url)
    switch(req.url){
        case "/":
            fs.readFile('framing.html', function(err, data) {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            });
        break;

        case "/broadMap3.svg":
            fs.readFile('broadMap3.svg', function(err, data) {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            });
        break;
        
        case "/IowaWaterlooFairviewCemetery.png":
            fs.readFile('IowaWaterlooFairviewCemetery.png', function(err, data) {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            });
        break;

        case "/elipse.svg":
            fs.readFile('elipse.svg', function(err, data) {
                res.writeHead(200, {'Content-Type': 'text/html'});
                res.write(data);
                return res.end();
            });
        break;

        default:
            console.log("error")
    } 
}).listen(8080);