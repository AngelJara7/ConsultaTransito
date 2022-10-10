import Vehiculo from "../models/vehiculo.js";
import Placa from "../models/placa.js";
import Seguro from "../models/seguro.js";
import Provincia from "../models/provinica.js";
import Municipio from "../models/municipio.js";

const crearVehiculo = async (req, res) => {
    const { id_usuario, 
        marca, 
        modelo, 
        tipo_vehiculo, 
        numero_pasajeros, 
        agno, 
        codigo_provincia, 
        codigo_municipio } = req.body;

        try {
            const vehiculo = await Vehiculo.create({
                id_usuario, 
                marca, 
                modelo, 
                tipo_vehiculo, 
                numero_pasajeros, 
                agno, 
                codigo_provincia, 
                codigo_municipio
            });
        
            res.status(200).json(vehiculo);   
        } catch (error) {
            res.status(500).json(error);
        }
};

const consultarVehiculo = async (req, res) => {
    const { id_vehiculo } = req.params;

    try {
        const vehiculo = await Vehiculo.findOne({
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
                id_vehiculo
            }
        });
        if (!vehiculo) {
            const error = new Error();
            return res.status(400).json({msg: error.message});
        }

        return res.status(200).json(vehiculo);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

const editarVehiculo = async (req, res) => {
    const { id_vehiculo } = req.params;

    try {
        const vehiculo = await Vehiculo.findOne({
            where: {
                id_vehiculo
            }
        });
        if (!vehiculo) {
            const error = new Error("El registro no existe");
            return res.status(404).json({msg: error.message});
        }
        vehiculo.set(req.body);
        await vehiculo.save();
        return res.status(200).json(vehiculo);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

export { crearVehiculo, consultarVehiculo, editarVehiculo };