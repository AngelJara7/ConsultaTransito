import { Op } from "sequelize";
import Placa from "../models/placa.js";
import Vehiculo from "../models/vehiculo.js";
import Provincia from "../models/provinica.js";
import Municipio from "../models/municipio.js";
import datosUsuario from "../models/datosUsuario.js";

const crearPlaca = async (req, res) => {
    const { id_vehiculo, 
        numero_placa, 
        fecha_vencimiento } = req.body;

        try {
            const placa = await Placa.create({

            });
        
            res.status(200).json(placa);   
        } catch (error) {
            res.status(500).json(error);
        }
};

const consultarPlaca = async (req, res) => {
    const { criterio } = req.params;

    try {
        const placa = await Placa.findOne({
            include: [{
                model: Vehiculo,
                as: "vehiculo",
                include: [{
                    model: Provincia,
                    as: "provincia"
                },{
                    model: Municipio,
                    as: "municipio"
                },{
                    model: datosUsuario,
                    as: "datosUsuario"
                }
            ]}],
            where: {
                [Op.or]: [
                    {id_vehiculo: criterio},
                    {numero_placa: criterio}
                ]
            }
        });
        if (!placa) {
            const error = new Error("No hay datos para mostrar.");
            return res.status(400).json({msg: error.message});
        }

        return res.status(200).json(placa);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

const editarPlaca = async (req, res) => {
    const { numero_placa } = req.params;

    try {
        const placa = await Placa.findOne({
            where: {
                numero_placa
            }
        });
        if (!placa) {
            const error = new Error("El registro no existe");
            return res.status(404).json({msg: error.message});
        }
        placa.set(req.body);
        await placa.save();
        return res.status(200).json(placa);
    } catch (error) {
        console.log(error);
        return res.status(500).json(error);
    }
};

export { crearPlaca, consultarPlaca, editarPlaca };