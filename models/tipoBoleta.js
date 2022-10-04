import Sequelize from "sequelize";
import db from "../config/db.js";

const tipoBoleta = db.define('tipo_boleta', {
    codigo_boleta: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    descripcion: {
        type: Sequelize.STRING
    },
    monto_boleta: {
        type: Sequelize.FLOAT
    },
    puntos: {
        type: Sequelize.INTEGER
    }
}, {
    db,
    tableName: "tipo_boleta",
});

export default tipoBoleta;