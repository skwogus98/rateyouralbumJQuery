import express, { Request, Response } from "express"
import mysql from "mysql"
import cors from "cors"
import bodyParser from "body-parser"

const app = express()
app.use(bodyParser.json())
app.use(cors())

const dbc = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'mysql1234',
	database: 'musicDB'
})

app.listen('3000', () => {
	console.log('Server Started')
})

app.get('/', (req: Request, res: Response) => {
  res.send('Success!');
});

app.post('/userData', (req: Request, res: Response) => {
    const query: string = `select * from userDB where userID = ${req.body.id} and password = ${req.body.password}`;
    dbc.query(query, (err, rows) =>{
        if(err) return console.log(err);
        res.send(rows);
    })
});