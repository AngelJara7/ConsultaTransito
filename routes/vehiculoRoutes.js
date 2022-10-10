import express from "express";
import { crearVehiculo, consultarVehiculo, editarVehiculo } from "../controllers/vehiculoController.js";

const router = express.Router();

// crea los vehiculos relacionas al usuario conductor (acceso: usuario del sistema)
router.post("/vehiculos", crearVehiculo);
router.get("/vehiculos/:id_vehiculo", consultarVehiculo); // (acceso: usuario conductor)
router.put("/vehiculos/:id_vehiculo", editarVehiculo); // (acceso: usuario del sistema)

export default router;