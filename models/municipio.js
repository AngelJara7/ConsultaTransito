import Sequelize from "sequelize";
import db from "../config/db.js";

const Municipio = db.define('municipio', {
    codigo_municipio: {
        type: Sequelize.STRING,
        primaryKey: true
    },
    codigo_provincia: {
        type: Sequelize.STRING
    },
    municipio: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "municipio",
});

export default Municipio;