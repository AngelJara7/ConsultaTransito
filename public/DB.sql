drop table if exists Boleta;
drop table if exists Tipo_Boleta;
drop table if exists Seguro;
drop table if exists Placa;
drop table if exists Vehiculo;
drop table if exists Licencia;
drop table if exists Tipo_Licencia;
drop table if exists Datos_Usuario;
drop table if exists Municipio;
drop table if exists Provincia;

create table Provincia(
    Codigo_Provincia char(2) not null,
    Provincia text(20) not null,
    primary key (Codigo_Provincia)
);
create table Municipio(
    Codigo_Municipio char(8) not null,
    Codigo_Provincia char(2) not null,
    Municipio varchar(20) not null,
    index (Codigo_Provincia),
    primary key (Codigo_Municipio),
    foreign key (Codigo_Provincia) REFERENCES Provincia(Codigo_Provincia)
);
create table Datos_Usuario(
    ID_Usuario int not null auto_increment,
    Tipo_Identificacion set("Cedula de Identidad Personal", "Registro Único de Contibuyente","Pasaporte", "Código de Entidad Pública") not null,
    Numero_Identificacion varchar(15) not null,
    Nombre varchar(15) not null,
    Apellido varchar(20) not null,
    sexo set("Masculino", "Femenino", "Otro"),
    Fecha_Nacimiento date not null,
    Celular varchar(9) not null,
    Telefono_Residencial varchar(8) not null,
    Correo_Electronico varchar(30) not null,
    primary key (ID_Usuario)
);
create table Tipo_Licencia(
    Tipo_Licencia char(2) not null,
    Descripcion text(100) not null,
    primary key (Tipo_Licencia)
);
create table Licencia(
    Numero_Control bigint(10) not null auto_increment,
    ID_Usuario int not null,
    Tipo_Licencia char(2) not null,
    Fecha_Emision date not null,
    Fecha_Vencimiento date not null,
    Estado_Licencia set("Vigente", "Vencida", "Suspención Temporal", "Suspención Definitiva"),
    Inicio_Suspencion date DEFAULT 0,
    Vencimiento_Suspension date DEFAULT 0,
    index (Tipo_Licencia),
    primary key (Numero_Control),
    foreign key (Tipo_Licencia) REFERENCES Tipo_Licencia(Tipo_Licencia),
    foreign key (ID_Usuario) REFERENCES Datos_Usuario(ID_Usuario)
);
create table Vehiculo(
    ID_Vehiculo int not null auto_increment,
    ID_Usuario int not null,
    Marca varchar(15) not null,
    Modelo varchar(20) not null,
    Tipo_vehiculo varchar(25) not null,
    Numero_Pasajeros int(2) not null,
    Agno int(4) not null,
    Codigo_Provincia char(2) not null,
    Codigo_Municipio char(8) not null,
    index (ID_Usuario),
    index (Codigo_Provincia),
    index (Codigo_Municipio),
    primary key (ID_Vehiculo),
    foreign key (ID_Usuario) REFERENCES Datos_Usuario(ID_Usuario),
    foreign key (Codigo_Provincia) REFERENCES Provincia(Codigo_Provincia),
    foreign key (Codigo_Municipio) REFERENCES Municipio(Codigo_Municipio)
);
create table Placa(
    ID_Placa int not null auto_increment,
    ID_Vehiculo int not null,
    Numero_Placa varchar(7) not null,
    Fecha_Vencimiento date not null,
    index (ID_Vehiculo),
    primary key (ID_Placa),
    foreign key (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo)
);
create table Seguro(
    ID_Seguro int not null auto_increment,
    ID_Vehiculo int not null,
    Tipo_Seguro set("Cobertura Completa", "Daños a Terceros") not null,
    Aseguradora text(30) not null,
    Fecha_Emision date not null,
    Fecha_Vencimiento date not null,
    index (ID_Vehiculo),
    primary key (ID_Seguro),
    foreign key (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo)
);
create table Tipo_Boleta(
    Codigo_Boleta int(5) not null,
    Descripcion text(50) not null,
    Monto_Boleta float(5,2) not null,
    Puntos int(2),
    primary key (Codigo_Boleta)
);
create table Boleta(
    Numero_Boleta int not null auto_increment,
    Numero_Control bigint(10) not null,
    Codigo_Boleta int(5) not null,
    Fecha_Emision date not null,
    Comentario text(50) not null,
    Estado_Boleta set("Pagado", "Pendiente por Pagar") not null,
    Monto_Desacato float(5,2) not null,
    index (Numero_Control),
    index (Codigo_Boleta),
    primary key (Numero_Boleta),
    foreign key (Numero_Control) REFERENCES Licencia(Numero_Control),
    foreign key (Codigo_Boleta) REFERENCES Tipo_Boleta(Codigo_Boleta)
);
COMMIT;
/*Insertar Datos en Provincia*/
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("BT", "Bocas de Toro");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("CL", "Coclé");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("CO", "Colón");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("CH", "Chiriquí");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("DA", "Darién");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("HE", "Herrera");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("LS", "Los Santos");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("VG", "Veraguas");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("PA", "Panamá");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("PO", "Panamá Oeste");
/*Insertar Datos Comarca en Provincia*/
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("EW", "Embera-Wounan");
INSERT INTO `Provincia`(`Codigo_Provincia`, `Provincia`) VALUES ("NB", "Ngobe Bugle");

/*Insertar Datos en Municipio Provincia de Bocas del Toro*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBT", "BT", "Bocas del Toro");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCh", "BT", "Changuinola");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChG", "BT", "Chiriquí Grande");
/*Insertar Datos en Municipio Provincia de Coclé*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuAgd", "CL", "Aguadulce");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuAtn", "CL", "Antón");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLPt", "CL", "La Pintada");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuNatá", "CL", "Natá");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuOlá", "CL", "Olá");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPnnm", "CL", "Penonomé");
/*Insertar Datos en Municipio Provincia de Colón*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChr", "CO", "Chagres");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCln", "CO", "Colón");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuDns", "CO", "Donoso");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPrtb", "CO", "Portobelo");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSIb", "CO", "Santa Isabel");
/*Insertar Datos en Municipio Provincia de Chiriquí*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuAlj", "CH", "Alanje");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBr", "CH", "Barú");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBqrn", "CH", "Boquerón");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBqt", "CH", "Boquete");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBgb", "CH", "Bugaba");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuDvd", "CH", "David");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuDlg", "CH", "Dolega");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuGlc", "CH", "Gualaca");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuRmd", "CH", "Remedios");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuRcmt", "CH", "Renacimiento");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSFx", "CH", "San Félix");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSLz", "CH", "San Lorenzo");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuTl", "CH", "Tolé");
/*Insertar Datos en Municipio Provincia Darién*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChpg", "DA", "Chepigana");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPngn", "DA", "Pinogana");
/*Insertar Datos en Municipio Provincia Herrera*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCht", "HE", "Chitré");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLMns", "HE", "Las Minas");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLPzs", "HE", "Los Pozos");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuOcú", "HE", "Ocú");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPrt", "HE", "Parita");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPesé", "HE", "Pesé");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuStMr", "HE", "Santa María");
/*Insertar Datos en Municipio Provincia Los Santos*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuGre", "LS", "Guararé");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLTbs", "LS", "Las Tablas");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLSts", "LS", "Los Santos");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuMcrs", "LS", "Macaracas");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPds", "LS", "Pedasí");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPcr", "LS", "Pocrí");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuTns", "LS", "Tonosí");
/*Insertar Datos en Municipio Provincia Veraguas*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuAtly", "VG", "Atalaya");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuClbr", "VG", "Calobre");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCñzs", "VG", "Cañazas");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLMs", "VG", "La Mesa");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLPms", "VG", "Las Palmas");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuMrt", "VG", "Mariato");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuMntj", "VG", "Montijo");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuRdJs", "VG", "Río de Jesús");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSFrsc", "VG", "San Fransisco");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSFe", "VG", "Sante Fe");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuStg", "VG", "Santiago");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSoná", "VG", "Soná");
/*Insertar Datos en Municipio Provincia Panamá*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBlb", "PA", "Balboa");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCpr", "PA", "Capira");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChm", "PA", "Chame");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChp", "PA", "Chepo");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuChmn", "PA", "Chimán");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuLChr", "PA", "La Chorrera");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuPnm", "PA", "Panamá");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSCls", "PA", "San Carlos");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSMglt", "PA", "San Miguelito");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuTbg", "PA", "Taboga");
/*Insertar Datos en Comarca Provincia Embera-Wounan*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuCmc", "EW", "Cémaco");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuSmb", "EW", "Sambú");
/*Insertar Datos en Comarca Provincia Ngobe Bugle*/
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuBsk", "NB", "Besikó");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuJrd", "NB", "Jirondai");
INSERT INTO `Municipio`(`Codigo_Municipio`, `Codigo_Provincia`, `Municipio`) VALUES ("MuKnt", "NB", "Kankintú");

/*Insertar Datos en Tipo_Licencia*/
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("A", "Bicicleta");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("B", "Motocicleta");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("C", "Automóviles y camionetas");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("D", "Camiones livianos hasta 8 Toneladas y autobuses de hasta 16 pasajeros");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("E1", "Transporte selectivo (Taxis)");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("E2", "Busitos de Turismo, colegiales y transporte púbico hasta 16 pasajeros");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("E3", "Autobuses de más de 16 pasajeros");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("F", "Camiones unitarios de más de 8 toneladas y autobuses de más de 16 pasajeros");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("G", "Camiones combinados");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("H", "Vehículos de transporte de cargas peligrosas");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("I", "Equipo pesado");
INSERT INTO `Tipo_Licencia`(`Tipo_Licencia`, `Descripcion`) VALUES ("J", "Autobuses del Nuevo Sistema de Movilización Masivo de Pasajeros del Área Metropolitana (METROBUS)");

/*Insertar datos en Tipo_Boleta*/
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("1", "Sin equipo de seguridad", "50.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("2", "Sin condiciones adecuadas de seguridad", "75.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("3", "Usar señales acusticas o luminosas, en vehículos no autorizados", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("4", "Con llantas lisas", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("5", "Accesorios en rines que sobresalen de los gurdafangos", "20.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("6", "Emitir gases, ruidos o sonidos excesivos", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("7", "Derramar combustible o sustancias tóxicas en la vía", "150.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("8", "En mal estado mecánico o de carrocería", "", "");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("9", "Vehículo sin registro unico de propiredad vehicular", "25.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("10", "Portar placa con diseño diferente al oficial en lugar al establecido o no visible en su totalidad", "20.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("11", "Vehículo con placa vencida", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("12", "Vehículo sin placa", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("13", "Vehículo de transporte público y comercial de carga sin la identificación establecida", "20.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("14", "Vehículo con luces no adecuadas", "25.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("15", "Vehículo con vagón para transporte de personas sin medidas de seguridad", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("16", "Vehículo sin cinta reflectiva o con cinta en mal estado", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("17", "Vehículo para transporte sin dispositivos de seguridad", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("18", "Vehículo para transporte de carga sin gurdabarros", "25.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("19", "Vehículo con vagón para transporte público de personas sin medidas de seguridad", "150.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("20", "Vehículo de transporte colectivo, colegial y turismo sin gobernador o con gobernador alterno", "100.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("21", "Papel ahumado en tono o lugar no autorizado", "20.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("22", "Vehículo de transporte colegial que no cumple las medidas de regulación establecidas", "100.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("23", "Transportar cargas incompatibles entre sí", "500.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("24", "Transportar cargas sin tomar las medidas de seguridad", "500.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("25", "Transportar cargas sin el permiso previo de circulación o con el permiso vencido", "500.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("26", "Transportar cargas fuera del itinerario aprobado", "250.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("27", "Portar licencia de conducir deteriorada (no legible)", "150.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("28", "No portar licencia de conducir", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("29", "Ceder el manejo a persona no autorizada", "150.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("30", "Negarse a detener el vehículo al ser requerido (fuga)", "200.00", "6");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("31", "Transportar carga no adecuada al tipo de vehículo", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("32", "Transportar exceso de pasajeros", "20.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("33", "transportar menores de edad sin medidas de seguridad", "100.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("34", "Prestar servicio de transporte público en vehículo no autorizado", "", "");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("35", "Coducir bicicletas y motocicletas sin medidas de seguridad", "15.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("36", "Hablar por telefono al conducir", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("37", "No utilizar el cituron de seguridad", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("38", "Reparar el Vehiculo en vía pública", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("39", "Cambiar llantas sin tomar medidas la smedidas de seguridad", "20.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("40", "Derramar, arrojar o verter desechos en la va", "75.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("41", "Infrigir prohibiciones con relación a los pasajeros o negarse a llevar pasajeros", "75.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("42", "Condiucir fuera del recorrido establecido o pactado con el usuario", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("43", "Prestar el servicio en ruta distinta a la establecida", "100.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("44", "Tomar o dejar pasasjeros fuera de los lugares especificados", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("45", "Conducir con aliento alcohólico", "150.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("46", "Conducir en estado de embriaguez comprobada o bajo efecto de espefacientes", "", "");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("47", "Conducir de forma desordenada", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("48", "Conducir sin mantener la distancia adecuada", "20.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("49", "Conducir en vía contraria o girar en forma de `U` sobre la vía en lugar prohibido", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("50", "Conducir por carril indebido en carreteras y autopistas", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("51", "Conducir por el hombro", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("52", "Conducir en lugar prohibido", "30.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("53", "Rebasar a otro vehículo sin la debida precaución", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("54", "Conducir obstruyendo el transito", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("55", "Conducir en retroceso en forma indebida", "30.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("56", "Romolcar otro vehículo sin cumplir las medidas de seguridad", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("57", "No hacer alto", "100.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("58", "Realizar giro indebido", "20.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("59", "Desantender lineas de no pare, paso peatonal e indicaciones del inspector", "20.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("60", "Pasar con luz roja en el semaforo", "100.00", "6");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("61", "Abandono de Vehículo en la vía pública (Chatarra)", "75.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("62", "Estacionar autobuses, camiones y unidades de arrastre en areas resindenciales", "75.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("63", "Estacionar autobuses, camiones y unidades de arrastre en la vía pública o en el hombro", "50.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("64", "Vehículo mal estacionado", "10.00", "1");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("65", "Estacionar en espacio para personas con discapacidad (Ley 42 del 27 de agosto de 1999)", "50.00", "3");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("66", "Conducir a velocidad superior al limite", "50.00", "5");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("67", "Conduicr con velocidad inferior al limite", "20.00", "2");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("68", "Hacer compentencia de velocidad (regatas) en la vía pública", "", "");
INSERT INTO `Tipo_Boleta`(`Codigo_Boleta`, `Descripcion`, `Monto_Boleta`, `Puntos`) VALUES ("69", "Colisión y fuga, atropello o daños a la propiedad", "", "");

/*Insertar Datos en Datos_Usuario*/
INSERT INTO `Datos_Usuario`(`Tipo_Identificacion`, `Numero_Identificacion`, `Nombre`, `Apellido`, `Sexo`, `Fecha_Nacimiento`, 
`Celular`, `Telefono_Residencial`,`Correo_Electronico`) VALUES ("Cedula de Identidad Personal", "1-111-1111", "Angel", "Jaramillo", "Masculino", "1996-10-07", "1234-5678", "765-4321", "anlguien@gmail.com");

/*Insertar en Licencia*/
INSERT INTO `Licencia`(`Numero_Control`, `ID_Usuario`, `Tipo_Licencia`, `Fecha_Emision`, `Fecha_Vencimiento`, `Estado_Licencia`) VALUES ("12345678910", 1, "D", "2020-07-02", "2020-07-02", "Vencida");

/*Insertar en Vehiculo*/
INSERT INTO `Vehiculo`(`ID_Usuario`, `Marca`, `Modelo`, `Tipo_Vehiculo`, `Numero_Pasajeros`, `Agno`, `Codigo_Provincia`, `Codigo_Municipio`) VALUES (1, "Hyundai", "Eon", "Camioneta", 5, 2017, "PA", "MuSMglt");

/*Insertar en Seguro*/
INSERT INTO `Seguro`(`ID_Vehiculo`, `Tipo_Seguro`, `Aseguradora`, `fecha_Emision`, `Fecha_Vencimiento`) VALUES (1, "Cobertura Completa", "Assa", "2017-05-03", "2021-05-03");

/*Insertar en Placa*/
INSERT INTO `Placa`(`ID_Vehiculo`, `Numero_Placa`, `Fecha_Vencimiento`) VALUES (1, "CB2712", "2021-05-03");

/*Insertar en Boleta*/
INSERT INTO `Boleta`(`Numero_Control`, `Codigo_Boleta`, `Fecha_Emision`, `Comentario`, `Estado_Boleta`, `Monto_Desacato`) VALUES ("12345678910", 9, "2022-09-10", "Todos los demas documentos en orden", "Pagado", "0.00");
COMMIT;