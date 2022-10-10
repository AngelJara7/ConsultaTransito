import datosUsuario from "../models/datosUsuario.js";
import Licencia from "../models/licencia.js";
import tipoLicencia from "../models/tipoLicencia.js";
import Vehiculo from "../models/vehiculo.js";
import Boleta from "../models/boleta.js";
import tipoBoleta from "../models/tipoBoleta.js";

const autenticar = async (req, res) => {
    const { tipo_identificacion, numero_identificacion, numero_control } = req.body;
    try {
        const usuario = await datosUsuario.findOne({
            include: {
                model: Licencia,
                as: "licencia",
                where: {
                    numero_control
                },
                include: {
                    model: tipoLicencia,
                    as: "tipoLicencia"
                }
            },
            where: {
                tipo_identificacion,
                numero_identificacion
            }
        });
        if (!usuario) {
            return res.status(400).json({msg: "Usuario no encontrado"});
        }
        res.status(200).json(usuario);
    } catch (error) {
        res.status(500).json(error);
    }
};

const crearUsuario = async (req, res) => {
    const { tipo_identificacion, 
        numero_identificacion, 
        nombre, 
        apellido, 
        fecha_nacimiento, 
        sexo, 
        celular, 
        telefono_residencial, 
        correo_electronico } = req.body;
        console.log(req.body);

        try {
            const nuevoUsuario = await datosUsuario.create({
                tipo_identificacion, 
                numero_identificacion, 
                nombre, 
                apellido, 
                fecha_nacimiento, 
                sexo, 
                celular, 
                telefono_residencial, 
                correo_electronico
            });
        
            res.status(200).json(nuevoUsuario);   
        } catch (error) {
            res.status(500).json(error);
        }
};

const listarUsuarios = async (req, res) => {

    try {
        const usuarios = await datosUsuario.findAll();
        return res.status(200).json(usuarios);
    } catch (error) {
        return res.status(500).json(error);
    }
};

const buscarUsuario = async (req, res) => {
    const { numero_identificacion } = req.params;

    try {
        const usuario = await datosUsuario.findOne({
            where: {
                numero_identificacion
            }
        });

        if (!usuario) {
            const error = new Error("El registro no existe.");
            return res.status(404).json({msg: error.message});
        }
        return res.status(200).json(usuario);
    } catch (error) {
        return res.status(500).json(error);
    }
};

const consultarVehiculos = async (req, res) => {
    const { id_usuario } = req.params;
    try {
        const vehiculo = await Vehiculo.findAll({
            where: {
                id_usuario
            }
        });
        res.status(200).json(vehiculo);
    } catch (error) {
        res.status(500).json(error);
    }
};

const consultarBoletas = async (req, res) => {
    const { numero_control } = req.body;
    try {
        const boleta = await Boleta.findOne({
            include: {
                model: tipoBoleta,
                as: "tipoBoleta",
            },
            where: {
                numero_control
            }
        });
        res.status(200).json(boleta);
    } catch (error) {
        res.status(500).json(error);
    }
};

export { autenticar, crearUsuario, listarUsuarios, buscarUsuario, consultarVehiculos, consultarBoletas };