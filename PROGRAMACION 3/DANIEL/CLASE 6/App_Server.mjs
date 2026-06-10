import {createServer} from "node:http";
import {readFileSync} from "node:fs";

const port = 3000;

const alumnos = JSON.parse(readFileSync('alumnos.json', 'utf8'));

const server = createServer ((req, res)=>
{ 
    const {method, url} = req;
    const [pathname, querystring] = url.split("?");
    
    res.statusCode = 200;
    res.setHeader('content-type', 'text/html');

    const html = "<h3>Method: </h3>" + JSON.stringify(req.method) + "<br>" + "<h3>URL: </h3>" + JSON.stringify(req.url) + "<br>" + "<h3>Headers: </h3>" + JSON.stringify(req.headers) + "<br>" + "<h3>Pathname: </h3>" + pathname + "<br>";

    // res.end(html);

    res.writeHead(200, {'Content-Type': 'application/json'});

    res.end(JSON.stringify(alumnos));
    
});

server.listen(port, ()=> console.log('Run puerto: ' + port));