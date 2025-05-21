-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestionreparaciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestionreparaciones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestionreparaciones` DEFAULT CHARACTER SET utf8 ;
USE `gestionreparaciones` ;

-- -----------------------------------------------------
-- Table `gestionreparaciones`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `cuit` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`puestoLaboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`puestoLaboral` (
  `idpuestoLaboral` INT NOT NULL AUTO_INCREMENT,
  `nombrepuestoLaboral` VARCHAR(45) NULL,
  PRIMARY KEY (`idpuestoLaboral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`moduloSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`moduloSistema` (
  `idmoduloSistema` INT NOT NULL AUTO_INCREMENT,
  `descripcionmoduloSistema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmoduloSistema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nombrePerfil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`funcionSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`funcionSistema` (
  `idfuncionSistema` INT NOT NULL AUTO_INCREMENT,
  `descripcionfuncionSistema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfuncionSistema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`moduloFuncionSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`moduloFuncionSistema` (
  `idmoduloFuncionSistema` INT NOT NULL AUTO_INCREMENT,
  `idmoduloSistema` INT NOT NULL,
  `idfuncionSistema` INT NOT NULL,
  `rutaModuloFuncionSistema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmoduloFuncionSistema`),
  INDEX `fk_moduloFuncionSistema_moduloSistema1_idx` (`idmoduloSistema` ASC) VISIBLE,
  INDEX `fk_moduloFuncionSistema_funcionSistema1_idx` (`idfuncionSistema` ASC) VISIBLE,
  CONSTRAINT `fk_moduloFuncionSistema_moduloSistema1`
    FOREIGN KEY (`idmoduloSistema`)
    REFERENCES `gestionreparaciones`.`moduloSistema` (`idmoduloSistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moduloFuncionSistema_funcionSistema1`
    FOREIGN KEY (`idfuncionSistema`)
    REFERENCES `gestionreparaciones`.`funcionSistema` (`idfuncionSistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`permisoPerfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`permisoPerfil` (
  `idpermisoPerfil` INT NOT NULL AUTO_INCREMENT,
  `idPerfil` INT NOT NULL,
  `estadoPermisoPerfil` TINYINT NOT NULL,
  `idmoduloFuncionSistema` INT NOT NULL,
  PRIMARY KEY (`idpermisoPerfil`),
  INDEX `fk_permisosDePerfiles_perfiles1_idx` (`idPerfil` ASC) VISIBLE,
  INDEX `fk_permisoPerfil_moduloFuncionSistema1_idx` (`idmoduloFuncionSistema` ASC) VISIBLE,
  CONSTRAINT `fk_permisosDePerfiles_perfiles1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `gestionreparaciones`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permisoPerfil_moduloFuncionSistema1`
    FOREIGN KEY (`idmoduloFuncionSistema`)
    REFERENCES `gestionreparaciones`.`moduloFuncionSistema` (`idmoduloFuncionSistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`asignacionUsuarioPermisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`asignacionUsuarioPermisos` (
  `idasignacionUsuarioPermisos` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idpermisoPerfil` INT NOT NULL,
  PRIMARY KEY (`idasignacionUsuarioPermisos`),
  INDEX `fk_asignacionUsuarioPermisos_usuarios1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_asignacionUsuarioPermisos_permisosDePerfiles1_idx` (`idpermisoPerfil` ASC) VISIBLE,
  CONSTRAINT `fk_asignacionUsuarioPermisos_usuarios1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `gestionreparaciones`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacionUsuarioPermisos_permisosDePerfiles1`
    FOREIGN KEY (`idpermisoPerfil`)
    REFERENCES `gestionreparaciones`.`permisoPerfil` (`idpermisoPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoDomicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoDomicilio` (
  `idtipoDomicilio` INT NOT NULL,
  `descripciontipoDomicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoDomicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`domicilio` (
  `idDomicilio` INT NOT NULL AUTO_INCREMENT,
  `codigoPostal` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `barrio` VARCHAR(45) NULL,
  `calle` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  `idtipoDomicilio` INT NOT NULL,
  `idPersona` INT NOT NULL,
  PRIMARY KEY (`idDomicilio`),
  INDEX `fk_domicilio_personas1_idx` (`idPersona` ASC) VISIBLE,
  INDEX `fk_domicilio_tipoDomicilio1_idx` (`idtipoDomicilio` ASC) VISIBLE,
  CONSTRAINT `fk_domicilio_personas1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `gestionreparaciones`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_domicilio_tipoDomicilio1`
    FOREIGN KEY (`idtipoDomicilio`)
    REFERENCES `gestionreparaciones`.`tipoDomicilio` (`idtipoDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoContacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoContacto` (
  `idtipoContacto` INT NOT NULL,
  `descripcióntipoContacto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoContacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`contacto` (
  `idContacto` INT NOT NULL,
  `descripciónContacto` VARCHAR(45) NOT NULL,
  `idtipoContacto` INT NOT NULL,
  `idPersona` INT NOT NULL,
  PRIMARY KEY (`idContacto`),
  INDEX `fk_contacto_tipoContacto1_idx` (`idtipoContacto` ASC) VISIBLE,
  INDEX `fk_contacto_personas1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_tipoContacto1`
    FOREIGN KEY (`idtipoContacto`)
    REFERENCES `gestionreparaciones`.`tipoContacto` (`idtipoContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacto_personas1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `gestionreparaciones`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`empleado` (
  `idEmpleado` INT NOT NULL,
  `fechaContratacion` DATE NOT NULL,
  `fechaFinalizacion` DATE NULL,
  `estadoLaboral` VARCHAR(45) NULL COMMENT 'El estado laboral generalmente se refiere a la situación o condición en la que se encuentra un empleado o persona en relación con su empleo. Este término se usa comúnmente para indicar si una persona está activa en su puesto de trabajo, si está de baja, si está en vacaciones, si ha renunciado, etc.\n\nAlgunos ejemplos de valores que podría tener el campo estadoLaboral en una base de datos son:\n\n\nActivo: El empleado está trabajando actualmente.\n\n\nInactivo: El empleado ya no trabaja en la empresa (por ejemplo, por renuncia o despido).\n\n\nEn licencia: El empleado está temporalmente ausente por motivos como licencia médica, vacaciones, etc.\n\n\nSuspensión: El empleado está suspendido temporalmente de sus labores.\n\n\nVacaciones: El empleado está disfrutando de su periodo vacacional.\n\n\nDe baja: El empleado ha dejado de trabajar en la empresa, por ejemplo, por jubilación o finalización de contrato.',
  `idpuestoLaboral` INT NOT NULL,
  `idPersona` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_empleado_puestoLaboral1_idx` (`idpuestoLaboral` ASC) VISIBLE,
  INDEX `fk_empleado_persona1_idx` (`idPersona` ASC) VISIBLE,
  INDEX `fk_empleado_usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_puestoLaboral1`
    FOREIGN KEY (`idpuestoLaboral`)
    REFERENCES `gestionreparaciones`.`puestoLaboral` (`idpuestoLaboral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `gestionreparaciones`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `gestionreparaciones`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`cliente` (
  `idCliente` INT NOT NULL,
  `estadoCliente` VARCHAR(45) NOT NULL COMMENT 'Un campo para saber si el cliente está activo o inactivo',
  `observaciones` TEXT NULL,
  `idPersona` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_persona1_idx` (`idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_persona1`
    FOREIGN KEY (`idPersona`)
    REFERENCES `gestionreparaciones`.`persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`marcaDispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`marcaDispositivo` (
  `idMarcaDispositivo` INT NOT NULL,
  `descripcionMarcaDispositivo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarcaDispositivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoDispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoDispositivo` (
  `idTipoDispositivo` INT NOT NULL,
  `nombreTipoDispositivo` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idTipoDispositivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`dispositivo` (
  `idDispositivo` INT NOT NULL,
  `descripcionDispositivo` VARCHAR(80) NOT NULL,
  `modeloDispositivo` VARCHAR(45) NOT NULL,
  `idMarcaDispositivo` INT NOT NULL,
  `idTipoDispositivo` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idDispositivo`),
  INDEX `fk_dispositivo_marca1_idx` (`idMarcaDispositivo` ASC) VISIBLE,
  INDEX `fk_dispositivo_tipoDispositivo1_idx` (`idTipoDispositivo` ASC) VISIBLE,
  INDEX `fk_dispositivo_cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_dispositivo_marca1`
    FOREIGN KEY (`idMarcaDispositivo`)
    REFERENCES `gestionreparaciones`.`marcaDispositivo` (`idMarcaDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispositivo_tipoDispositivo1`
    FOREIGN KEY (`idTipoDispositivo`)
    REFERENCES `gestionreparaciones`.`tipoDispositivo` (`idTipoDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dispositivo_cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `gestionreparaciones`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoDatoPreguntaDiagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoDatoPreguntaDiagnostico` (
  `idTipoDatoPreguntaDiagnostico` INT NOT NULL,
  `descripcionTipoDatoPreguntaDiagnostico` VARCHAR(45) NOT NULL COMMENT '(ej: \"texto\", \"número\", \"opción\", etc.)',
  PRIMARY KEY (`idTipoDatoPreguntaDiagnostico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`preguntaDiagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`preguntaDiagnostico` (
  `idPreguntaDiagnostico` INT NOT NULL COMMENT 'preguntasDiagnostico  (define las \"preguntas\" o ítems para el diagnostico segun dispositivo)\nEs la tabla que define qué cosas se le deben preguntar o revisar a un dispositivo cuando llega al local para hacerle un diagnóstico.\nEstas preguntas son parametrizables, lo que significa que el administrador puede crearlas, modificarlas o asignarlas a distintos tipos de dispositivos, sin tocar la base de datos.\n•	idPreguntasDiagnostico (PK)\n•	descripcionPregunta (Ej: ¿Prende?, ¿Está mojado?, ¿Tiene cargador?...)\n•	tipoDatoPregunta (Ej: boolean, texto, número, opción múltiple)',
  `descripcionPreguntaDiagnostico` VARCHAR(90) NOT NULL,
  `idTipoDatoPreguntaDiagnostico` INT NOT NULL,
  `opcionesPregunta` JSON NULL COMMENT '4	¿Qué tan sucio está?	opcion	[\"Limpio\", \"Sucio\", \"Muy sucio\"]',
  PRIMARY KEY (`idPreguntaDiagnostico`),
  INDEX `fk_preguntaDiagnostico_tipoDatoPreguntaDiagnostico1_idx` (`idTipoDatoPreguntaDiagnostico` ASC) VISIBLE,
  CONSTRAINT `fk_preguntaDiagnostico_tipoDatoPreguntaDiagnostico1`
    FOREIGN KEY (`idTipoDatoPreguntaDiagnostico`)
    REFERENCES `gestionreparaciones`.`tipoDatoPreguntaDiagnostico` (`idTipoDatoPreguntaDiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoDispositivoSegunPregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoDispositivoSegunPregunta` (
  `idTipoDispositivoSegunPregunta` VARCHAR(45) NOT NULL,
  `idTipoDispositivo` INT NOT NULL COMMENT 'idTipoDispositivo (FK): Especifica a qué tipo de dispositivo se le asigna un campo de diagnóstico.\n\nidCampoDiagnostico (FK): Define qué campo de diagnóstico está disponible para ese tipo de dispositivo.\n\nPor ejemplo:\n\nSi idTipoDispositivo = 1 (Teléfono), y idCampoDiagnostico = 1 (¿Prende?), entonces para los teléfonos, el campo \"¿Prende?\" se muestra en el formulario de diagnóstico.\n\nSi idTipoDispositivo = 2 (Horno), y idCampoDiagnostico = 2 (¿Funciona el termostato?), ese campo estará disponible solo para hornos.',
  `idPreguntaDiagnostico` INT NOT NULL,
  INDEX `fk_tipoDispositivo_has_preguntasDiagnostico_preguntasDiagno_idx` (`idPreguntaDiagnostico` ASC) VISIBLE,
  INDEX `fk_tipoDispositivo_has_preguntasDiagnostico_tipoDispositivo_idx` (`idTipoDispositivo` ASC) VISIBLE,
  PRIMARY KEY (`idTipoDispositivoSegunPregunta`),
  CONSTRAINT `fk_tipoDispositivo_has_preguntasDiagnostico_tipoDispositivo1`
    FOREIGN KEY (`idTipoDispositivo`)
    REFERENCES `gestionreparaciones`.`tipoDispositivo` (`idTipoDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipoDispositivo_has_preguntasDiagnostico_preguntasDiagnost1`
    FOREIGN KEY (`idPreguntaDiagnostico`)
    REFERENCES `gestionreparaciones`.`preguntaDiagnostico` (`idPreguntaDiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`diagnostico` (
  `idDiagnostico` INT NOT NULL,
  `fechaDiagnostico` DATE NOT NULL,
  `idDispositivo` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idDiagnostico`),
  INDEX `fk_diagnostico_dispositivo1_idx` (`idDispositivo` ASC) VISIBLE,
  INDEX `fk_diagnostico_empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_diagnostico_dispositivo1`
    FOREIGN KEY (`idDispositivo`)
    REFERENCES `gestionreparaciones`.`dispositivo` (`idDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `gestionreparaciones`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`detalleDiagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`detalleDiagnostico` (
  `idDetalleDiagnostico` INT NOT NULL,
  `valorDiagnostico` VARCHAR(150) NOT NULL,
  `idDiagnostico` INT NOT NULL,
  `idTipoDispositivoSegunPregunta` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDetalleDiagnostico`),
  INDEX `fk_detalleDiagnostico_diagnostico1_idx` (`idDiagnostico` ASC) VISIBLE,
  INDEX `fk_detalleDiagnostico_tipoDispositivoSegunPreguntas1_idx` (`idTipoDispositivoSegunPregunta` ASC) VISIBLE,
  CONSTRAINT `fk_detalleDiagnostico_diagnostico1`
    FOREIGN KEY (`idDiagnostico`)
    REFERENCES `gestionreparaciones`.`diagnostico` (`idDiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleDiagnostico_tipoDispositivoSegunPreguntas1`
    FOREIGN KEY (`idTipoDispositivoSegunPregunta`)
    REFERENCES `gestionreparaciones`.`tipoDispositivoSegunPregunta` (`idTipoDispositivoSegunPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`estadoReparacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`estadoReparacion` (
  `idEstadoReparacion` INT NOT NULL,
  `descripcionEstadoReparacion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idEstadoReparacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`reparacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`reparacion` (
  `idReparacion` INT NOT NULL,
  `numeroReparacion` INT NOT NULL,
  `idEstadoReparacion` INT NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `fechaEgreso` DATE NULL,
  `montoTotalReparacion` DECIMAL NOT NULL,
  `idDiagnostico` INT NOT NULL,
  `idEmpleado` INT NOT NULL COMMENT 'puede ser que un empleado haga el diagnostico y otro la reparacion',
  PRIMARY KEY (`idReparacion`),
  INDEX `fk_reparacion_diagnostico1_idx` (`idDiagnostico` ASC) VISIBLE,
  INDEX `fk_reparacion_empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_reparacion_estadoReparacion1_idx` (`idEstadoReparacion` ASC) VISIBLE,
  CONSTRAINT `fk_reparacion_diagnostico1`
    FOREIGN KEY (`idDiagnostico`)
    REFERENCES `gestionreparaciones`.`diagnostico` (`idDiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reparacion_empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `gestionreparaciones`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reparacion_estadoReparacion1`
    FOREIGN KEY (`idEstadoReparacion`)
    REFERENCES `gestionreparaciones`.`estadoReparacion` (`idEstadoReparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`tipoReparacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`tipoReparacion` (
  `idTipoReparacion` INT NOT NULL,
  `descripcionTipoReparacion` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idTipoReparacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`repuesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`repuesto` (
  `idRepuesto` INT NOT NULL,
  `nombreRepuesto` VARCHAR(80) NOT NULL,
  `tipoRepuesto` VARCHAR(80) NOT NULL,
  `precio` DECIMAL NOT NULL,
  `cantidadRepuesto` INT NOT NULL,
  `idMarcaDispositivo` INT NOT NULL,
  PRIMARY KEY (`idRepuesto`),
  INDEX `fk_repuestos_marca1_idx` (`idMarcaDispositivo` ASC) VISIBLE,
  CONSTRAINT `fk_repuestos_marca1`
    FOREIGN KEY (`idMarcaDispositivo`)
    REFERENCES `gestionreparaciones`.`marcaDispositivo` (`idMarcaDispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`detalleReparacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`detalleReparacion` (
  `idDetalleReparacion` INT NOT NULL,
  `montoTotalDetalleReparacion` DECIMAL NOT NULL,
  `manoObra` DECIMAL NOT NULL,
  `precioRepuesto` DECIMAL NOT NULL,
  `descripcion` VARCHAR(60) NULL,
  `idReparacion` INT NOT NULL,
  `idTipoReparacion` INT NOT NULL,
  `idRepuesto` INT NOT NULL COMMENT 'PARA QUE DESCUENTE DEL ALMACEN',
  PRIMARY KEY (`idDetalleReparacion`),
  INDEX `fk_detalleReparacion_reparacion1_idx` (`idReparacion` ASC) VISIBLE,
  INDEX `fk_detalleReparacion_tipoReparacion1_idx` (`idTipoReparacion` ASC) VISIBLE,
  INDEX `fk_detalleReparacion_repuestos1_idx` (`idRepuesto` ASC) VISIBLE,
  CONSTRAINT `fk_detalleReparacion_reparacion1`
    FOREIGN KEY (`idReparacion`)
    REFERENCES `gestionreparaciones`.`reparacion` (`idReparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleReparacion_tipoReparacion1`
    FOREIGN KEY (`idTipoReparacion`)
    REFERENCES `gestionreparaciones`.`tipoReparacion` (`idTipoReparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleReparacion_repuestos1`
    FOREIGN KEY (`idRepuesto`)
    REFERENCES `gestionreparaciones`.`repuesto` (`idRepuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`historialAsignacionReparacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`historialAsignacionReparacion` (
  `idHistorialAsignacionReparacion` INT NOT NULL,
  `fechaInicioAsignacionReparacion` DATE NOT NULL,
  `fechaFinAsignacionReparacion` DATE NULL,
  `idReparacion` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idHistorialAsignacionReparacion`),
  INDEX `fk_historialAsignacionReparacion_reparacion1_idx` (`idReparacion` ASC) VISIBLE,
  INDEX `fk_historialAsignacionReparacion_empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_historialAsignacionReparacion_reparacion1`
    FOREIGN KEY (`idReparacion`)
    REFERENCES `gestionreparaciones`.`reparacion` (`idReparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historialAsignacionReparacion_empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `gestionreparaciones`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionreparaciones`.`historialAsignacionDiagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionreparaciones`.`historialAsignacionDiagnostico` (
  `idHistorialAsignacionDiagnostico` INT NOT NULL,
  `fechaInicioAsignacionDiagnostico` DATE NOT NULL,
  `fechaFinAsignacionDiagnostico` DATE NULL,
  `idDiagnostico` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idHistorialAsignacionDiagnostico`),
  INDEX `fk_historialAsignacionDiagnostico_diagnostico1_idx` (`idDiagnostico` ASC) VISIBLE,
  INDEX `fk_historialAsignacionDiagnostico_empleado1_idx` (`idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_historialAsignacionDiagnostico_diagnostico1`
    FOREIGN KEY (`idDiagnostico`)
    REFERENCES `gestionreparaciones`.`diagnostico` (`idDiagnostico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historialAsignacionDiagnostico_empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `gestionreparaciones`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
