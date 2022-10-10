import express from "express";
import { crearPlaca, consultarPlaca, editarPlaca } from "../controllers/placaController.js";

const router = express.Router();

// maniulacion de las datos de las boletas (acceso: usuario del sistema)
router.post("/placa", crearPlaca);
router.get("/placa/:criterio", consultarPlaca);
router.put("/placa/:numero_placa", editarPlaca);

export default router;