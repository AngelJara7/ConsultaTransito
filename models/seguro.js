import Sequelize from "sequelize";
import db from "../config/db.js";

const Seguro = db.define('seguro', {
    id_seguro: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    id_vehiculo: {
        type: Sequelize.INTEGER
    },
    tipo_seguro: {
        type: Sequelize.STRING
    },
    aseguradora: {
        type: Sequelize.STRING
    },
    fecha_emision: {
        type: Sequelize.STRING
    },
    fecha_vencimiento: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "seguro",
});

export default Seguro;