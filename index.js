import express  from "express";"express";
import usuarioRoutes from "./routes/usuarioRoutes.js";
import licenciaRoutes from "./routes/licenciaRoutes.js";
import vehiculoRoutes from "./routes/vehiculoRoutes.js";
import placaRoutes from "./routes/placaRoutes.js";
import seguroRoutes from "./routes/seguroRoutes.js";
import db from "./config/db.js";
import "./config/asociaciones.js";

const app = express();

app.use(express.json());

app.use('/api', usuarioRoutes);
app.use('/api', licenciaRoutes);
app.use('/api', vehiculoRoutes);
app.use('/api', placaRoutes);
app.use('/api', seguroRoutes);

app.listen(3000, () => {
    console.log("Servidor iniciado en el puerto 3000");

    db.authenticate()
        .then(() => console.log('Conectado'))
        .catch(err => console.log('No se conecto'))

    db.sync({ force: false });
});