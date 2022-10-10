import Licencia from "../models/licencia.js";
import tipoLicencia from "../models/tipoLicencia.js";

const crearLicencia = async (req, res) => {
    const { id_usuario, 
        tipo_licencia, 
        fecha_emision, 
        fecha_vencimiento } = req.body;

        try {
            const licencia = await Licencia.create({ 
                id_usuario, 
                tipo_licencia, 
                fecha_emision, 
                fecha_vencimiento,
                estado_licencia: "Vigente"
            });
            return res.status(200).json(licencia);   
        } catch (error) {
            res.status(500).json(error);
        }
};

const consultarLicencia = async (req, res) => {
    const { numero_control } = req.params;

    try {
        const licencia = await Licencia.findOne({
            include: {
                model: tipoLicencia,
                as: "tipoLicencia"
            },
            where: {
                numero_control
            }
        });
        if (!licencia) {
            const error = new Error("El registro no existe.");
            return res.status(400).json({msg: error.message});
        }

        return res.status(200).json(licencia);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

const editarLicencia = async (req, res) => {
    const { numero_control } = req.params;

    try {
        const licencia = await Licencia.findOne({
            where: {
                numero_control
            }
        });
        if (!licencia) {
            const error = new Error("El registro no existe");
            return res.status(404).json({msg: error.message});
        }
        licencia.set(req.body);
        await licencia.save();
        return res.status(200).json(licencia);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

export { crearLicencia, consultarLicencia, editarLicencia };