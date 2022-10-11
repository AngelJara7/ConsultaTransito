import express from "express";
import { crearLicencia, consultarTipoLicencia, consultarLicencia, editarLicencia } from "../controllers/licenciaController.js";

const router = express.Router();

// permite la manipulacion de los datos de la licencia (acceso: usuario del sistema)
router.post("/licencias", crearLicencia);
router.get("/licencias", consultarTipoLicencia);
router.get("/licencias/:numero_control", consultarLicencia);
router.put("/licencias/:numero_control", editarLicencia);

export default router;