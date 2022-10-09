import datosUsuario from "../models/datosUsuario.js";
import Licencia from "../models/licencia.js";
import tipoLicencia from "../models/tipoLicencia.js";

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
            console.log("Hola:"+usuario);
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

export { autenticar, crearUsuario };