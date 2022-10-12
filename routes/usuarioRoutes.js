import express from "express";
import { autenticar, 
    listarProvincia, 
    listarMunicipio, 
    crearUsuario, 
    listarUsuarios, 
    buscarUsuario, 
    consultarVehiculos,
    consultarBoletas } from "../controllers/usuarioControllers.js";

const router = express.Router();

// Permite el acceso de los usuarios a su historial (acceso: usuario conductor)
router.post("/inicio", autenticar);

// Crear, Eliminar, actualizar datos de los conductores (acceso: usuario del sistema)
router.get("/usuarios/provincia", listarProvincia);
router.get("/usuarios/municipio/:codigo_provincia", listarMunicipio);
router.post("/usuarios", crearUsuario);
router.get("/usuarios", listarUsuarios);
router.get("/usuarios/:numero_identificacion", buscarUsuario);

// permite consultar todos los vehiculos que posee el usuario conductor (acceso: usuario conductor y usuario del sistema)
router.post("/inicio/:id_usuario/vehiculos", consultarVehiculos);
router.post("/inicio/boletas", consultarBoletas);

export default router;