import datosUsuario from "../models/datosUsuario.js";
import Licencia from "../models/licencia.js";
import tipoLicencia from "../models/tipoLicencia.js";

const crearLicencia = async (req, res) => {
    const { id_usuario, 
        tipo_licencia, 
        fecha_emision, 
        fecha_vencimiento } = req.body;

        try {
            const nuevaLicencia = await Licencia.create({ 
                id_usuario, 
                tipo_licencia, 
                fecha_emision, 
                fecha_vencimiento,
                estado_licencia: "Vigente"
            });
        
            res.status(200).json(nuevaLicencia);   
        } catch (error) {
            res.status(500).json(error);
        }
};

export { crearLicencia };