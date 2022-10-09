import Sequelize from "sequelize";
import db from "../config/db.js";

const Boleta = db.define('boleta', {
    numero_boleta: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    numero_control: {
        type: Sequelize.INTEGER
    },
    codigo_boleta: {
        type: Sequelize.INTEGER
    },
    fecha_emision: {
        type: Sequelize.STRING
    },
    comentario: {
        type: Sequelize.STRING
    },
    estado_boleta: {
        type: Sequelize.STRING
    },
    monto_desacato: {
        type: Sequelize.FLOAT
    }
}, {
    db,
    tableName: "boleta",
});

export default Boleta;