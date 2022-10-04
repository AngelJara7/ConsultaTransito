import Sequelize from "sequelize";
import db from "../config/db.js";

const Licencia = db.define('licencia', {
    numero_control: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    id_usuario: {
        type: Sequelize.INTEGER
    },
    tipo_licencia: {
        type: Sequelize.STRING
    },
    fecha_emision: {
        type: Sequelize.STRING
    },
    fecha_vencimiento: {
        type: Sequelize.STRING
    },
    estado_licencia: {
        type: Sequelize.STRING
    },
    inicio_suspencion: {
        type: Sequelize.STRING
    },
    vencimiento_suspension: {
        type: Sequelize.STRING
    },
}, {
    db,
    tableName: "licencia",
    timestamps: false
});

export default Licencia;