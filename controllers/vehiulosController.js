import Vehiculo from "../models/vehiculo.js";
import Placa from "../models/placa.js";
import Seguro from "../models/seguro.js";
import Provincia from "../models/provinica.js";
import Municipio from "../models/municipio.js";

const consultarVehiculo = async (req, res) => {
    const { id_usuario } = req.body;
    try {
        const vehiculo = await Vehiculo.findAll({
            include: [{
                model: Placa,
                as: "placa",
            }, {
                model: Seguro,
                as: "seguro"
            }, {
                model: Provincia,
                as: "provincia"
            }, {
                model: Municipio,
                as: "municipio"
        }],
            where: {
                id_usuario
            }
        });
        res.status(200).json(vehiculo);
    } catch (error) {
        res.status(500).json(error);
    }
};

export default consultarVehiculo;