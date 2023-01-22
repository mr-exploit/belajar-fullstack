import { Sequelize } from "sequelize";

const db = new Sequelize('belajar_db', 'root', '', {
    host: "localhost",
    dialect: "mysql"
});

export default db;