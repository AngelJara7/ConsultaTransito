import Boleta from "../models/boleta.js";
import tipoBoleta from "../models/tipoBoleta.js";

const consultarBoleta = async (req, res) => {
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

export default consultarBoleta;