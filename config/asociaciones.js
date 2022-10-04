import Provincia from "../models/provinica.js";
import Municipio from "../models/municipio.js";
import tipoLicencia from "../models/tipoLicencia.js";
import Licencia from "../models/licencia.js";
import Usuario from "../models/usuario.js";
import Vehiculo from "../models/vehiculo.js";
import Placa from "../models/placa.js";
import Seguro from "../models/seguro.js";
import tipoBoleta from "../models/tipoBoleta.js";
import Boleta from "../models/boleta.js";

//crear relacion entre tipoLicencia y Licencia (muchos a uno)
tipoLicencia.hasMany(Licencia, { as: "licencia", foreignKey: "tipo_licencia" });
Licencia.belongsTo(tipoLicencia, { as: "tipoLicencia", foreignKey: "tipo_licencia" });

//crear relacion entre vehiculo y usuario (muchos a uno)
Usuario.hasMany(Vehiculo, { as: "vehiculo", foreignKey: "id_usuario" });
Vehiculo.belongsTo(Usuario, { as: "tipoLicencia", foreignKey: "id_usuario" });

//crear relacion entre vehiculo y placa (uno a uno)
Vehiculo.hasOne(Placa, { as: "placa", foreignKey: "id_vehiculo" });
Placa.belongsTo(Vehiculo, { as: "vehiculo", foreignKey: "id_vehiculo" });

//crear relacion entre vehiculo y placa (uno a uno)
Vehiculo.hasOne(Seguro, { as: "seguro", foreignKey: "id_vehiculo" });
Seguro.belongsTo(Vehiculo, { as: "vehiculo", foreignKey: "id_vehiculo" });

//crear relacion entre tipoBoleta y boleta (muchos a uno)
tipoBoleta.hasMany(Boleta, { as: "boleta", foreignKey: "codigo_boleta" });
Boleta.belongsTo(tipoBoleta, { as: "tipoBoleta", foreignKey: "codigo_boleta" });

//crear relacion entre provincia y municipio (muchos a uno)
Provincia.hasMany(Municipio, { as: "municipio", foreignKey: "codigo_provincia" });
Municipio.belongsTo(Provincia, { as: "provincia", foreignKey: "codigo_provincia" });

//crear relacion entre usuario y licencia (uno a uno)
Usuario.hasOne(Licencia, { as: "licencia", foreignKey: "id_usuario" });
Licencia.belongsTo(Usuario, { as: "usuario", foreignKey: "id_usuario" });

//crear relacion entre  provincia y vehiculo (muchos a uno)
Provincia.hasMany(Vehiculo, { as: "vehiculo", foreignKey: "codigo_provincia" });
Vehiculo.belongsTo(Provincia, { as: "provincia", foreignKey: "codigo_provincia" });

//crear relacion entre  provincia y vehiculo (muchos a uno)
Municipio.hasMany(Vehiculo, { as: "vehiculo", foreignKey: "codigo_municipio" });
Vehiculo.belongsTo(Municipio, { as: "municipio", foreignKey: "codigo_municipio" });