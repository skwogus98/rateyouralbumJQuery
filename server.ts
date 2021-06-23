import express, { Request, Response } from "express"
import mysql from "mysql"
import cors from "cors"
import bodyParser from "body-parser"

const app = express()
app.use(cors())
app.use(express.static('public'))

const dbc = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'mysql1234',
	database: 'musicDB'
})

app.use(bodyParser.json())

app.listen('3000', () => {
	console.log('Server Started')
})

app.get('/userData', (req: Request, res: Response) => {
    const query: string = "select * from userDB where userID = ? and password = ?";
    dbc.query(query, [req.query.id, req.query.password] ,(err, rows) =>{
        if(err) return console.log(err);
        res.send(rows);
    })
});

app.get("/rateList", (req: Request, res: Response) => {
  const query: string = "select * from rateListDB, artistDB, albumDB where userDB_id = ? and rateListDB.album_id = albumDB.id and albumDB.artistDB_id = artistDB.id ORDER BY rank"
  dbc.query(query,[req.query.id], (err, rows) =>{
    if(err) return console.log(err);
    res.send(rows);
  })
})