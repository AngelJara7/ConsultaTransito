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
                id_usuario: id_usuario
            }
        });
        if (!vehiculo) {
            return res.json({msg: "No hay Datos para mostrar"});
        }
        res.json(vehiculo);
    } catch (error) {
        res.json(error);
        console.log(error);
    }
};

export default consultarVehiculo;