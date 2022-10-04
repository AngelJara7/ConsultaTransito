import Sequelize from "sequelize";
import db from "../config/db.js";

const tipoLicencia = db.define('tipo_licencia', {
    tipo_licencia: {
        type: Sequelize.STRING,
        primaryKey: true
    },
    descripcion: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "tipo_licencia",
});

export default tipoLicencia;