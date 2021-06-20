import express, { Request, Response } from "express"
import mysql from "mysql"
import cors from "cors"

const app = express()
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
    const query: string = "select * from userDB where userID = ? and password = ?";
    dbc.query(query, [req.query.id, req.query.password] ,(err, rows) =>{
        if(err) return console.log(err);
        res.send(rows);
    })
});