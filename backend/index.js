import express from "express";
import dotenv from "dotenv";
import db from "./config/Database.js"; //mengambil data file database.js dari folder config
import UserRoute from "./routes/UserRoute.js"; // mengambil data file userroutes.js dari folder routes
import session from "express-session";
import SequelizeStore from "connect-session-sequelize"; 
import AuthRoute from "./routes/AuthRoute.js"; //mengambil data dari folder routes
import BelajarRoute from "./routes/BelajarRoute.js"; //mengambil data dari file belajarroute.js dari folder routes

dotenv.config();

const app = express();

const sessionStore = SequelizeStore(session.Store);
const store = new sessionStore({
    db: db
});

app.use(session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
        secure: 'auto',
    }
}))

app.use(express.json());
app.use(UserRoute);
app.use(AuthRoute);
app.use(BelajarRoute);

(async() => {
    await db.sync();
})();

app.listen(process.env.APP_PORT, () =>{
    console.log('Server Up and Running...');
});
