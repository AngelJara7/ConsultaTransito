import Sequelize from "sequelize";
import db from "../config/db.js";

const datosUsuario = db.define('datos_usuario', {
    id_usuario: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    tipo_identificacion: {
        type: Sequelize.STRING
    },
    numero_identificacion: {
        type: Sequelize.STRING
    },
    nombre: {
        type: Sequelize.STRING
    },
    apellido: {
        type: Sequelize.STRING
    },
    fecha_nacimiento: {
        type: Sequelize.STRING
    },
    sexo: {
        type: Sequelize.STRING
    },
    celular: {
        type: Sequelize.STRING
    },
    telefono_residencial: {
        type: Sequelize.STRING
    },
    correo_electronico: {
        type: Sequelize.STRING
    }
}, {
    db,
    tableName: "datos_usuario",
});

export default Usuario;