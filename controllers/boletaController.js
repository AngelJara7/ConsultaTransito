import Boleta from "../models/boleta.js";
import tipoBoleta from "../models/tipoBoleta.js";

const consultarBoleta = async (req, res) => {
    const { numero_control } = req.body;
    try {
        const boleta = await Boleta.findAll({
            include: {
                model: tipoBoleta,
                as: "tipoBoleta",
            },
            where: {
                numero_control: numero_control
            }
        });
        if (!boleta) {
            return res.json({msg: "No hay Datos para mostrar"});
        }
        res.json(boleta);
    } catch (error) {
        res.json(error);
        console.log(error);
    }
};

export default consultarBoleta;