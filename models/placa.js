import Sequelize from "sequelize";
import db from "../config/db.js";

const Placa = db.define('placa', {
    id_placa: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_vehiculo: {
        type: Sequelize.INTEGER
    },
    numero_placa: {
        type: Sequelize.STRING
    },
    fecha_vencimiento: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "placa",
});

export default Placa;