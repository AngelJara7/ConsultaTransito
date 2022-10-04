import Sequelize from "sequelize";

const db = new Sequelize("consulta transito", "root", "", {
  host: "localhost",
  port: "3306",
  dialect: "mysql",
  define: {
    freezeTableName: false,
    timestamps: false
  },
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  },
  operatorAliasess: false
});
    
export default db;