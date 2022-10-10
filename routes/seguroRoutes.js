import express from "express";
import { crearSeguro } from "../controllers/seguroController.js";

const router = express.Router();

router.post("/seguro", crearSeguro);

export default router;
