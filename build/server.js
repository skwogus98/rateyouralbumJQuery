"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const mysql_1 = __importDefault(require("mysql"));
const cors_1 = __importDefault(require("cors"));
const body_parser_1 = __importDefault(require("body-parser"));
const app = express_1.default();
app.use(body_parser_1.default.json());
app.use(cors_1.default());
const dbc = mysql_1.default.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'mysql1234',
    database: 'musicDB'
});
app.listen('3000', () => {
    console.log('Server Started');
});
app.get('/', (req, res) => {
    res.send('Success!');
});
app.post('/userData', (req, res) => {
    const query = `select * from userDB where userID = ${req.body.id} and password = ${req.body.password}`;
    dbc.query(query, (err, rows) => {
        if (err)
            return console.log(err);
        res.send(rows);
    });
});
