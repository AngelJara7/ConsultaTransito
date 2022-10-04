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
                    numero_control: numero_control
                },
                include: {
                    model: tipoLicencia,
                    as: "tipoLicencia"
                }
            },
            where: {
                tipo_identificacion: tipo_identificacion,
                numero_identificacion: numero_identificacion
            }
        });
        if (!usuario) {
            return res.json({msg: "Usuario no encontrado"});
        }
        res.json(usuario);
    } catch (error) {
        res.json(error);
        console.log(error);
    }
};

export default autenticar;