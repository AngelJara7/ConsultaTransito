import express from "express";
import autenticar from "../controllers/usuarioControllers.js";
import consultarVehiculo from "../controllers/vehiulosController.js";
import consultarBoleta from "../controllers/boletaController.js";

const router = express.Router();

router.post("/inicio", autenticar);
router.post("/inicio/vehiculos", consultarVehiculo);
router.post("/inicio/boletas", consultarBoleta);

export default router;