import Sequelize from "sequelize";
import db from "../config/db.js";

const Vehiculo = db.define('vehiculo', {
    id_vehiculo: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_usuario: {
        type: Sequelize.INTEGER
    },
    marca: {
        type: Sequelize.STRING
    },
    modelo: {
        type: Sequelize.STRING
    },
    tipo_vehiculo: {
        type: Sequelize.STRING
    },
    numero_pasajeros: {
        type: Sequelize.STRING
    },
    agno: {
        type: Sequelize.STRING
    },
    codigo_provincia: {
        type: Sequelize.STRING
    },
    codigo_municipio: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "vehiculo",
});

export default Vehiculo;