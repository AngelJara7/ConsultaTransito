import Sequelize from "sequelize";
import db from "../config/db.js";

const Provincia = db.define('provincia', {
    codigo_provincia: {
        type: Sequelize.STRING,
        primaryKey: true
    },
    provincia: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "provincia",
});

export default Provincia;