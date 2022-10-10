import Seguro from "../models/seguro.js";

const crearSeguro = async (req, res) => {
    const { id_vehiculo, 
        tipo_seguro, 
        aseguradora, 
        fecha_emision, 
        fecha_vencimiento } = req.body;

    try {
        const seguro = await Seguro.create({
            id_vehiculo, 
            tipo_seguro, 
            aseguradora, 
            fecha_emision, 
            fecha_vencimiento
        });
        if (!seguro) {
            const error = new Error("No se pudo crear el registro");
            return res.status(400).json({msg: error.message});
        }
        return res.status(200).json(seguro);
    } catch (error) {
        return res.status(500).json(error);
    }
};

export { crearSeguro };