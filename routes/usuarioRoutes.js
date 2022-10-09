import express from "express";
import { autenticar, crearUsuario } from "../controllers/usuarioControllers.js";
import { crearLicencia } from "../controllers/licenciaController.js";
import consultarVehiculo from "../controllers/vehiulosController.js";
import consultarBoleta from "../controllers/boletaController.js";

const router = express.Router();

// Permite el acceso de los usuarios a su historial
router.post("/inicio", autenticar);

// Crear, Eliminar, actualizar datos de los conductores
router.post("/usuarios", crearUsuario);

// Crear, Eliminar, actualizar licencias
router.post("/licencias", crearLicencia);

router.post("/inicio/vehiculos", consultarVehiculo);
router.post("/inicio/boletas", consultarBoleta);

export default router;