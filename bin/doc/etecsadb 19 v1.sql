/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : etecsadb

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 19/01/2020 20:33:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accidente_laboral
-- ----------------------------
DROP TABLE IF EXISTS `accidente_laboral`;
CREATE TABLE `accidente_laboral`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `idtipo_accidentes` int(11) NULL DEFAULT NULL,
  `idforma_accidentes_id` int(11) NULL DEFAULT NULL,
  `idlugar_accidente_id` int(11) NULL DEFAULT NULL,
  `horario_de_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `turnos_de_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tiempo` int(11) NULL DEFAULT NULL,
  `descripcion_accidenete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `costo_directo` double NULL DEFAULT NULL,
  `costo_indirecto` double NULL DEFAULT NULL,
  `conclusiones_recomendaciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha_inicio` date NULL DEFAULT NULL,
  `fecha_terminacion` date NULL DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `idagenteespecificaciones` int(11) NULL DEFAULT NULL,
  `idcausaespecificaciones` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_253AEF46E79FFC08`(`id_trabajador`) USING BTREE,
  INDEX `IDX_253AEF4613A2BC3F`(`idtipo_accidentes`) USING BTREE,
  INDEX `IDX_253AEF461F5A3EC6`(`idforma_accidentes_id`) USING BTREE,
  INDEX `IDX_253AEF46BD8D5AAD`(`idlugar_accidente_id`) USING BTREE,
  INDEX `IDX_253AEF46A2D81587`(`idagenteespecificaciones`) USING BTREE,
  INDEX `IDX_253AEF465F033B7B`(`idcausaespecificaciones`) USING BTREE,
  CONSTRAINT `FK_253AEF4613A2BC3F` FOREIGN KEY (`idtipo_accidentes`) REFERENCES `tipo_accidentes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_253AEF461F5A3EC6` FOREIGN KEY (`idforma_accidentes_id`) REFERENCES `forma_de_accidente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_253AEF465F033B7B` FOREIGN KEY (`idcausaespecificaciones`) REFERENCES `especificaciones_de_causas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_253AEF46A2D81587` FOREIGN KEY (`idagenteespecificaciones`) REFERENCES `especificaciones_de_agentematerial` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_253AEF46BD8D5AAD` FOREIGN KEY (`idlugar_accidente_id`) REFERENCES `lugar_de_trabajo_accidente` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_253AEF46E79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accidente_laboral
-- ----------------------------
INSERT INTO `accidente_laboral` VALUES (7, 2005, 1, 2, 2, '8:00am a 7:30pm', '5', NULL, 'asdfasdf', 555, 555, NULL, '2020-01-01', '2020-01-27', 'asdfasdf', 1, 1);
INSERT INTO `accidente_laboral` VALUES (8, 1540, 3, 4, 3, '8:00am a 5:50pm', '1', NULL, 'ghsf', 555, 555, NULL, '2020-01-16', '2020-01-08', 'asdfadsf', 1, 18);

-- ----------------------------
-- Table structure for accidentelaboral_investigador
-- ----------------------------
DROP TABLE IF EXISTS `accidentelaboral_investigador`;
CREATE TABLE `accidentelaboral_investigador`  (
  `trabajador_id` int(11) NOT NULL,
  `accidente_laboral_id` int(11) NOT NULL,
  PRIMARY KEY (`trabajador_id`, `accidente_laboral_id`) USING BTREE,
  INDEX `IDX_7E8BAF16EC3656E`(`trabajador_id`) USING BTREE,
  INDEX `IDX_7E8BAF16DBC02F6`(`accidente_laboral_id`) USING BTREE,
  CONSTRAINT `FK_7E8BAF16DBC02F6` FOREIGN KEY (`accidente_laboral_id`) REFERENCES `accidente_laboral` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_7E8BAF16EC3656E` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accidentelaboral_naturalezalesion
-- ----------------------------
DROP TABLE IF EXISTS `accidentelaboral_naturalezalesion`;
CREATE TABLE `accidentelaboral_naturalezalesion`  (
  `naturaleza_lesion_id` int(11) NOT NULL,
  `accidente_laboral_id` int(11) NOT NULL,
  PRIMARY KEY (`naturaleza_lesion_id`, `accidente_laboral_id`) USING BTREE,
  INDEX `IDX_C845B10E5FEEED77`(`naturaleza_lesion_id`) USING BTREE,
  INDEX `IDX_C845B10EDBC02F6`(`accidente_laboral_id`) USING BTREE,
  CONSTRAINT `FK_C845B10E5FEEED77` FOREIGN KEY (`naturaleza_lesion_id`) REFERENCES `naturaleza_lesion` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_C845B10EDBC02F6` FOREIGN KEY (`accidente_laboral_id`) REFERENCES `accidente_laboral` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accidentelaboral_naturalezalesion
-- ----------------------------
INSERT INTO `accidentelaboral_naturalezalesion` VALUES (15, 7);
INSERT INTO `accidentelaboral_naturalezalesion` VALUES (16, 8);

-- ----------------------------
-- Table structure for accidentelaboral_partelesionada
-- ----------------------------
DROP TABLE IF EXISTS `accidentelaboral_partelesionada`;
CREATE TABLE `accidentelaboral_partelesionada`  (
  `partes_del_cuerpo_lesionado_id` int(11) NOT NULL,
  `accidente_laboral_id` int(11) NOT NULL,
  PRIMARY KEY (`partes_del_cuerpo_lesionado_id`, `accidente_laboral_id`) USING BTREE,
  INDEX `IDX_672FDBBE2F0BE2A4`(`partes_del_cuerpo_lesionado_id`) USING BTREE,
  INDEX `IDX_672FDBBEDBC02F6`(`accidente_laboral_id`) USING BTREE,
  CONSTRAINT `FK_672FDBBE2F0BE2A4` FOREIGN KEY (`partes_del_cuerpo_lesionado_id`) REFERENCES `partes_del_cuerpo_lesionado` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_672FDBBEDBC02F6` FOREIGN KEY (`accidente_laboral_id`) REFERENCES `accidente_laboral` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accidentelaboral_partelesionada
-- ----------------------------
INSERT INTO `accidentelaboral_partelesionada` VALUES (2, 7);
INSERT INTO `accidentelaboral_partelesionada` VALUES (3, 8);

-- ----------------------------
-- Table structure for agente_material
-- ----------------------------
DROP TABLE IF EXISTS `agente_material`;
CREATE TABLE `agente_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agente_material
-- ----------------------------
INSERT INTO `agente_material` VALUES (1, 'Máquinas');
INSERT INTO `agente_material` VALUES (2, 'Medios de transporte y de elevación o izado');
INSERT INTO `agente_material` VALUES (3, 'Aparatos, equipos y herramientas');
INSERT INTO `agente_material` VALUES (4, 'Materiales, sustancias y radiaciones');
INSERT INTO `agente_material` VALUES (5, 'Ambiente de trabajo');
INSERT INTO `agente_material` VALUES (6, 'Superficie de trabajo');
INSERT INTO `agente_material` VALUES (7, 'Recipientes a presión');
INSERT INTO `agente_material` VALUES (8, 'Hornos');
INSERT INTO `agente_material` VALUES (9, 'Instalaciones eléctricas, incluidos los motores eléctricos pero con exclusión de las herramientas');
INSERT INTO `agente_material` VALUES (10, 'Otros agentes no incluidos anteriormente (chatarra, desperdicios sólidos, etc.)');
INSERT INTO `agente_material` VALUES (11, 'No determinado por falta de datos suficientes');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, 'DTSR');
INSERT INTO `area` VALUES (2, 'MESA PRUEBA');
INSERT INTO `area` VALUES (3, 'CT ALDABÓ');
INSERT INTO `area` VALUES (4, 'CT BOYEROS');
INSERT INTO `area` VALUES (5, 'CT COTORRO');
INSERT INTO `area` VALUES (6, 'CT CUMBRE');
INSERT INTO `area` VALUES (7, 'CT LUZ');
INSERT INTO `area` VALUES (8, 'CT MONTE');

-- ----------------------------
-- Table structure for asignar_medicamento
-- ----------------------------
DROP TABLE IF EXISTS `asignar_medicamento`;
CREATE TABLE `asignar_medicamento`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `id_medicamento` int(11) NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `orden` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_1BA56413E79FFC08`(`id_trabajador`) USING BTREE,
  INDEX `IDX_1BA56413D18B1B73`(`id_medicamento`) USING BTREE,
  CONSTRAINT `FK_1BA56413D18B1B73` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_1BA56413E79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of asignar_medicamento
-- ----------------------------
INSERT INTO `asignar_medicamento` VALUES (1, 1380, 7, 5, NULL, '2020-01-10 23:38:32');
INSERT INTO `asignar_medicamento` VALUES (2, 2005, 4, 52, 'sdgaf', '2020-01-22 00:00:00');
INSERT INTO `asignar_medicamento` VALUES (3, 1927, 5, 5, 'kjhlkjlkjhkjll', '2020-01-29 00:00:00');
INSERT INTO `asignar_medicamento` VALUES (4, 2021, 5, 6745, 'Hhbcfkkghh', '2020-01-01 00:00:00');

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tiempo_chequeo` int(11) NULL DEFAULT NULL,
  `tiempo_original_chequeo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES (1, 'ASESOR LEGAL EN TELEMATICA \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (2, 'ASIGNADOR DE PLANTA EXTERIOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (3, 'AUXILIAR GENERAL', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (4, 'BALANCISTA DISTRIBUIDOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (5, 'CHOFER \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (6, 'CHOFER \"C\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (7, 'CHOFER \"D\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (8, 'CONTROLAD. LLAVE RECAUD. EST. PUBLIC.', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (9, 'DEPENDIENTE DE ALMACEN', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (10, 'DESP. ORDENES PLANTA EXTERIOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (11, 'DIRECTOR \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (12, 'EJECUTIVO DE PUNTO DE VENTA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (13, 'EJECUTIVO DE PUNTO DE VENTA (EP)', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (14, 'ENCARGADO DE ABAST. Y MTTO. DE TRANSP.', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (15, 'ENCARGADO DE ALMACEN \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (16, 'ESP. \"A\" EN EXPL. DEL TRANSP. AUTOMOTOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (17, 'ESP. \"A\" EN OBRAS DE ARQUITECTURA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (18, 'ESP. \"B\" AHORRO Y USO RAC. DE LA ENERGIA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (19, 'ESP. \"B\" EN CIENCIAS INFORMATICAS', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (20, 'ESP. \"B\" EN ECONOMIA DE ALMACENES', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (21, 'ESP. \"B\" EN GEST. DE LA CALIDAD', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (22, 'ESP. \"B\" EN GEST. DE RECURSOS HUMANOS', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (23, 'ESP. \"B\" EN GEST. ECONOMICA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (24, 'ESP. \"B\" EN GEST. ECONOMICA (EP)', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (25, 'ESP. \"B\" EN SEGUR. Y SALUD EN EL TRABAJO', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (26, 'ESP. \"B\" PARA LA DEFENSA Y DEFENSA CIVIL', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (27, 'ESP. \"C\" EN TELEMATICA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (28, 'ESP. \"C\" EN TELEMATICA (EP)', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (29, 'ESP. EN ATENCION A LOS TRABAJADORES', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (30, 'ESP. EN SISTEMAS DE SEGURIDAD \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (31, 'GESTOR DE SERVICIOS', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (32, 'Integración: Posición por defecto', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (33, 'JEFE DE CENTRO \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (34, 'JEFE DE CENTRO \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (35, 'JEFE DE DEPARTAMENTO \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (36, 'JEFE DE DEPARTAMENTO \"C\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (37, 'JEFE DE GRUPO \"C\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (38, 'JEFE DE GRUPO \"D\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (39, 'JEFE DE GRUPO \"E\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (40, 'JEFE DE UNIDAD \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (41, 'JEFE DE UNIDAD \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (42, 'JEFE DE UNIDAD \"C\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (43, 'JEFE DE UNIDAD \"D\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (44, 'JEFE DE UNIDAD \"F\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (45, 'JEFE DE UNIDAD \"G\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (46, 'LINIERO \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (47, 'LINIERO \"A\" (JB)', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (48, 'LINIERO \"B\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (49, 'MANIPULADOR DE EFECTIVOS', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (50, 'MECANICO \"B\" AUTOMOTOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (51, 'nombre', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (52, 'OP. INSTAL. REPARADOR \"B\"', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (53, 'OP. INSTAL. REPARADOR \"B\"  (JB)', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (54, 'OP. INSTAL. REPARADOR \"C\"', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (55, 'OP. INSTAL. REPARADOR \"D\"', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (56, 'OPERARIO DE CABLE \"A\"', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (57, 'OPERARIO DE CABLE \"A\"   (JB)', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (58, 'OPERARIO DE CABLE \"B\"', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (59, 'OPERARIO GENERAL DE MTTO.', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (60, 'OPERARIO GENERAL DE MTTO. (JB)', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (61, 'PROBADOR DE CABLE', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (62, 'PROBADOR DE MESA DE PRUEBA', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (63, 'PROBADOR DE MESA DE PRUEBA (JB)', NULL, 365, NULL);
INSERT INTO `cargo` VALUES (64, 'RECAUDADOR DE ESTAC. PUBLICAS', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (65, 'RECEPCIONISTA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (66, 'SECRETARIA EJECUTIVA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (67, 'TEC. \"A\" EXPL. DEL TRANSP. AUTOMOTOR', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (68, 'TEC. AHORRO Y USO RAC. DE LA ENERGIA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (69, 'TEC. EN CIENCIAS INFORMATICAS \"A\"', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (70, 'TEC. EN ECONOMIA DE ALMACENES', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (71, 'TEC. EN GEST. ECONOMICA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (72, 'TEC. EN PROT. FISICA Y SECRETO ESTATAL', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (73, 'TEC. EN TELEMATICA', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (74, 'TEC. EN TELEMATICA (EP)', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (75, 'TECNICO EN SERVICIO SOCIAL T.M.', NULL, NULL, NULL);
INSERT INTO `cargo` VALUES (76, 'TEC. \"A\" EN GEST. DE RECURSOS HUMANOS', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for causa
-- ----------------------------
DROP TABLE IF EXISTS `causa`;
CREATE TABLE `causa`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of causa
-- ----------------------------
INSERT INTO `causa` VALUES (1, 'Causas técnicas');
INSERT INTO `causa` VALUES (2, 'Causas organizativas');
INSERT INTO `causa` VALUES (4, 'Causas de conducta');

-- ----------------------------
-- Table structure for chequeo_medico
-- ----------------------------
DROP TABLE IF EXISTS `chequeo_medico`;
CREATE TABLE `chequeo_medico`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT NULL,
  `proximo_chequeo` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_A54FDDBCE79FFC08`(`id_trabajador`) USING BTREE,
  CONSTRAINT `FK_A54FDDBCE79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chequeo_medico
-- ----------------------------
INSERT INTO `chequeo_medico` VALUES (7, 1380, '2019-01-19 00:00:00', 'asdffasdfsaf', 1, '2020-01-19 00:00:00');
INSERT INTO `chequeo_medico` VALUES (8, 1383, '2019-01-11 00:00:00', 'asdffasdfsaf', 1, '2020-01-11 00:00:00');
INSERT INTO `chequeo_medico` VALUES (9, 1391, '2020-01-22 00:00:00', 'djsdfhggsg', 1, '2021-01-21 00:00:00');

-- ----------------------------
-- Table structure for entrega_espejuelo
-- ----------------------------
DROP TABLE IF EXISTS `entrega_espejuelo`;
CREATE TABLE `entrega_espejuelo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `fecha_compra` datetime(0) NOT NULL,
  `costo` double NULL DEFAULT NULL,
  `cheque` int(11) NULL DEFAULT NULL,
  `respaldado_politica` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha_recibe_economia` datetime(0) NULL DEFAULT NULL,
  `aprobacion_consejo` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_1355F372E79FFC08`(`id_trabajador`) USING BTREE,
  CONSTRAINT `FK_1355F372E79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entrega_espejuelo
-- ----------------------------
INSERT INTO `entrega_espejuelo` VALUES (1, 2005, '2020-01-03 00:00:00', 50, 123456789, '1', '2020-01-06 00:00:00', 0);
INSERT INTO `entrega_espejuelo` VALUES (4, 1940, '2020-01-06 00:00:00', 100, 456123789, '0', '2020-01-08 00:00:00', 1);
INSERT INTO `entrega_espejuelo` VALUES (5, 1947, '2020-01-06 00:00:00', 100, 456123789, '1', '2020-01-08 00:00:00', 0);
INSERT INTO `entrega_espejuelo` VALUES (6, 1777, '2020-01-06 00:00:00', 100, 456123789, '', '2020-01-08 00:00:00', 1);
INSERT INTO `entrega_espejuelo` VALUES (7, 1540, '2020-01-08 00:00:00', 45, 12352664, '', '2020-01-09 00:00:00', 1);
INSERT INTO `entrega_espejuelo` VALUES (8, 1888, '2020-01-02 00:00:00', 546532, 4564532, '1', '2020-01-15 00:00:00', 0);
INSERT INTO `entrega_espejuelo` VALUES (9, 1941, '2020-01-21 00:00:00', 656, 8977945, '', '2020-01-30 00:00:00', 1);

-- ----------------------------
-- Table structure for especificaciones_de_agentematerial
-- ----------------------------
DROP TABLE IF EXISTS `especificaciones_de_agentematerial`;
CREATE TABLE `especificaciones_de_agentematerial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idagente_material_id` int(11) NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_6337C123CB4DC4A4`(`idagente_material_id`) USING BTREE,
  CONSTRAINT `FK_6337C123CB4DC4A4` FOREIGN KEY (`idagente_material_id`) REFERENCES `agente_material` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of especificaciones_de_agentematerial
-- ----------------------------
INSERT INTO `especificaciones_de_agentematerial` VALUES (1, 1, 'Generadores de energía, excepto motores eléctricos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (2, 1, 'Sistemas de transmisión');
INSERT INTO `especificaciones_de_agentematerial` VALUES (3, 1, 'Máquinas para el trabajo del metal');
INSERT INTO `especificaciones_de_agentematerial` VALUES (4, 1, 'Máquinas para trabajar la madera y otras materias similares');
INSERT INTO `especificaciones_de_agentematerial` VALUES (5, 1, 'Maquinas agrícolas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (6, 1, 'Máquinas para el trabajo en las minas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (7, 1, 'Máquinas para el trabajo en la construcción');
INSERT INTO `especificaciones_de_agentematerial` VALUES (8, 1, 'Máquinas para el trabajo en la industria textil');
INSERT INTO `especificaciones_de_agentematerial` VALUES (9, 1, 'Máquinas para el trabajo en la industria alimenticia');
INSERT INTO `especificaciones_de_agentematerial` VALUES (10, 1, 'Otras máquinas no clasificadas bajo los epígrafes anteriores');
INSERT INTO `especificaciones_de_agentematerial` VALUES (11, 2, 'Medios de elevación o izado');
INSERT INTO `especificaciones_de_agentematerial` VALUES (12, 2, 'Medios de transporte por vías ferreas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (13, 2, 'Medios de transporte automotor');
INSERT INTO `especificaciones_de_agentematerial` VALUES (14, 2, 'Medios de transorte aéreo');
INSERT INTO `especificaciones_de_agentematerial` VALUES (15, 2, 'Medios de transporte fluvial o marítimo');
INSERT INTO `especificaciones_de_agentematerial` VALUES (16, 2, 'Medios de transporte de tracción animal');
INSERT INTO `especificaciones_de_agentematerial` VALUES (17, 2, 'Otros mediso de transporte, incluidos los de tracción humana');
INSERT INTO `especificaciones_de_agentematerial` VALUES (18, 3, 'Recipientes a presión');
INSERT INTO `especificaciones_de_agentematerial` VALUES (19, 3, 'Equipos de calentamiento (no eléctrico)');
INSERT INTO `especificaciones_de_agentematerial` VALUES (20, 3, 'Equipos de soldaduras y cortes');
INSERT INTO `especificaciones_de_agentematerial` VALUES (21, 3, 'Instalaciones frigoríficas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (22, 3, 'Instalaciones eléctricas, incluidos los motores eléctricos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (23, 3, 'Herramientas eléctricas manuales');
INSERT INTO `especificaciones_de_agentematerial` VALUES (24, 3, 'Escaleras de mano, rampas móviles, andamios y plataformas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (25, 3, 'Otros aparatos, equipos y herramientas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (26, 4, 'Explosivos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (27, 4, 'Polvos, gases, líquidos y productos químicos, a excepción de los explosivos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (28, 4, 'Fragmentos volantes');
INSERT INTO `especificaciones_de_agentematerial` VALUES (29, 4, 'Radiaciones');
INSERT INTO `especificaciones_de_agentematerial` VALUES (30, 4, 'Otros materiales y sustancias');
INSERT INTO `especificaciones_de_agentematerial` VALUES (31, 5, 'En el exterior');
INSERT INTO `especificaciones_de_agentematerial` VALUES (32, 5, 'En el interior');
INSERT INTO `especificaciones_de_agentematerial` VALUES (33, 5, 'Subterráneos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (34, 6, 'Pisos');
INSERT INTO `especificaciones_de_agentematerial` VALUES (35, 6, 'Plataformas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (36, 6, 'Andamios');
INSERT INTO `especificaciones_de_agentematerial` VALUES (37, 6, 'Escaleras');
INSERT INTO `especificaciones_de_agentematerial` VALUES (38, 6, 'Otras superficies de tránsito y de trabajo');
INSERT INTO `especificaciones_de_agentematerial` VALUES (39, 7, 'Calderas');
INSERT INTO `especificaciones_de_agentematerial` VALUES (40, 7, 'Recipientes a presión sin fuego');
INSERT INTO `especificaciones_de_agentematerial` VALUES (41, 7, 'Cajones de aire comprimido, equipos de buzo');

-- ----------------------------
-- Table structure for especificaciones_de_causas
-- ----------------------------
DROP TABLE IF EXISTS `especificaciones_de_causas`;
CREATE TABLE `especificaciones_de_causas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_causa` int(11) NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_7D9C693F1932FA96`(`id_causa`) USING BTREE,
  CONSTRAINT `FK_7D9C693F1932FA96` FOREIGN KEY (`id_causa`) REFERENCES `causa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of especificaciones_de_causas
-- ----------------------------
INSERT INTO `especificaciones_de_causas` VALUES (1, 1, '__Deficiencias en el diseño, construcción o montaje de los medios u objetos de trabajo.');
INSERT INTO `especificaciones_de_causas` VALUES (2, 1, '__Mal estado de herramientas, equipos o instalaciones, desnivel o périda de propiedades del terreno o de las edificaciones. ');
INSERT INTO `especificaciones_de_causas` VALUES (3, 1, '__Partes móviles y equipos incorrectamente resguardados');
INSERT INTO `especificaciones_de_causas` VALUES (4, 1, '__Cambios bruscos imprevistos de parámetros en medios u objetos de trabajo.');
INSERT INTO `especificaciones_de_causas` VALUES (5, 1, '__Fallas asociadas al envejevimiento, desgaste, corrosión o sobrecarga');
INSERT INTO `especificaciones_de_causas` VALUES (6, 1, 'Ambiente externo que afecta las instalaciones y el ambiente de trabajo,incluidas las descargas eléctricas, viento.');
INSERT INTO `especificaciones_de_causas` VALUES (7, 1, '__Características de los productos químicos');
INSERT INTO `especificaciones_de_causas` VALUES (8, 1, '__Agresiones de animales vivos');
INSERT INTO `especificaciones_de_causas` VALUES (9, 1, '__Mal estado de la vía o del vehículos (A pesar del mantenimiento recibido)');
INSERT INTO `especificaciones_de_causas` VALUES (10, 1, '__Otras condiciones no imputables al trabajador, ni a la organización de la producción o los servicios');
INSERT INTO `especificaciones_de_causas` VALUES (11, 2, '__Incumplimiento o cumplimiento deficiente de las responsabilidades de dirigentes, jefes directos y técnicos respecto a la seguridad y salud en el trabajo ');
INSERT INTO `especificaciones_de_causas` VALUES (12, 2, '__No incorporación de los elementos de seguridad y salud en el trabajo en los procedimientos de trabajo. ');
INSERT INTO `especificaciones_de_causas` VALUES (13, 2, '__No progrmación e incumplimiento del mantenimiento y reparación');
INSERT INTO `especificaciones_de_causas` VALUES (14, 2, '__Deficiencias de la organización del trabajo');
INSERT INTO `especificaciones_de_causas` VALUES (15, 2, '__Alteraciones del régimen de trabajo');
INSERT INTO `especificaciones_de_causas` VALUES (16, 2, '__Falta de supervisión , regulación o control');
INSERT INTO `especificaciones_de_causas` VALUES (17, 2, '__Deficiencias de la instrucción y adistramiento sobre Seguridad y Salud en el trabajo de los dirigentes, jefes directos y trabajadores');
INSERT INTO `especificaciones_de_causas` VALUES (18, 2, '__Inadecuada selección del personal');
INSERT INTO `especificaciones_de_causas` VALUES (19, 2, '__Falta de señalización y comunicación ');
INSERT INTO `especificaciones_de_causas` VALUES (20, 2, '__Deficiente organización de la circulación interior');
INSERT INTO `especificaciones_de_causas` VALUES (21, 2, '__Falta o inadecuados equipos de protección personal');
INSERT INTO `especificaciones_de_causas` VALUES (22, 2, '__Falta de orden y limpieza');
INSERT INTO `especificaciones_de_causas` VALUES (23, 4, '__Mal estado de salud, afectaciones emocionales, consumo de medicamentos por parte del trabajador no notificados a su jefe antes de comenzar el trabajo que afectan su desempeño, retardan o hacen imprecisas sus reacciones naturales.');
INSERT INTO `especificaciones_de_causas` VALUES (24, 4, '__Incumplimiento de procedimientos, normas o reglas establecidas');
INSERT INTO `especificaciones_de_causas` VALUES (25, 4, '__Falta de ateción a la labor que realiza');
INSERT INTO `especificaciones_de_causas` VALUES (26, 4, '__Ejecutar tareas peligrosas sin autorización');
INSERT INTO `especificaciones_de_causas` VALUES (27, 4, '__No uso o uso inadecuado de los equipos de protección personal');
INSERT INTO `especificaciones_de_causas` VALUES (28, 4, '__Actitudes termerarias ante los peligros');
INSERT INTO `especificaciones_de_causas` VALUES (29, 4, '__Violaciones del código de seguridad vial');
INSERT INTO `especificaciones_de_causas` VALUES (30, 4, '__Consumo de bebidas alcohólicas o drogas de abuso por el trabajor');
INSERT INTO `especificaciones_de_causas` VALUES (31, 4, 'Otras situaciones de origen humano que pueden provocar accidentes');

-- ----------------------------
-- Table structure for forma_de_accidente
-- ----------------------------
DROP TABLE IF EXISTS `forma_de_accidente`;
CREATE TABLE `forma_de_accidente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forma_de_accidente
-- ----------------------------
INSERT INTO `forma_de_accidente` VALUES (1, 'Caída de personas al mismo nivel');
INSERT INTO `forma_de_accidente` VALUES (2, 'Caída de personas a diferentes niveles');
INSERT INTO `forma_de_accidente` VALUES (3, 'Caída de objetos');
INSERT INTO `forma_de_accidente` VALUES (4, 'Pisada sobre, choques contra ogolpes por objetos');
INSERT INTO `forma_de_accidente` VALUES (5, 'Atrapado por un objeto o entre objetos');
INSERT INTO `forma_de_accidente` VALUES (6, 'Esfuerzo excesivo o movimiento violentos');
INSERT INTO `forma_de_accidente` VALUES (7, 'Contacto con cuerpos cortantes y punzantes');
INSERT INTO `forma_de_accidente` VALUES (8, 'Inhalavión, obsorción, ingestió n de productos químicos');
INSERT INTO `forma_de_accidente` VALUES (9, 'Exposición a o contacto con temperaturas extremas');
INSERT INTO `forma_de_accidente` VALUES (10, 'Exposición a o contacto con la corriente eléctrica');
INSERT INTO `forma_de_accidente` VALUES (11, 'Exposición a o contacto con sustancias nocivas o radiaciones');
INSERT INTO `forma_de_accidente` VALUES (12, 'Otras formas de accidentes');

-- ----------------------------
-- Table structure for grado
-- ----------------------------
DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grado
-- ----------------------------
INSERT INTO `grado` VALUES (1, 'Muy Baja');
INSERT INTO `grado` VALUES (2, 'Baja');
INSERT INTO `grado` VALUES (3, 'Moderada');
INSERT INTO `grado` VALUES (4, 'Alta');
INSERT INTO `grado` VALUES (5, 'Muy Alta');

-- ----------------------------
-- Table structure for lugar_de_trabajo_accidente
-- ----------------------------
DROP TABLE IF EXISTS `lugar_de_trabajo_accidente`;
CREATE TABLE `lugar_de_trabajo_accidente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lugar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lugar_de_trabajo_accidente
-- ----------------------------
INSERT INTO `lugar_de_trabajo_accidente` VALUES (1, 'Puesto de trabajo');
INSERT INTO `lugar_de_trabajo_accidente` VALUES (2, 'Fuera del puesto de trabajo');
INSERT INTO `lugar_de_trabajo_accidente` VALUES (3, 'En la vía');
INSERT INTO `lugar_de_trabajo_accidente` VALUES (4, 'Fuera del centro de trabajo');

-- ----------------------------
-- Table structure for medicamento
-- ----------------------------
DROP TABLE IF EXISTS `medicamento`;
CREATE TABLE `medicamento`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medicamento
-- ----------------------------
INSERT INTO `medicamento` VALUES (2, 'Povidona yodada');
INSERT INTO `medicamento` VALUES (3, 'Gasa');
INSERT INTO `medicamento` VALUES (4, 'Curitas');
INSERT INTO `medicamento` VALUES (5, 'Dipirona');
INSERT INTO `medicamento` VALUES (6, 'Paracetamol ');
INSERT INTO `medicamento` VALUES (7, 'Esparadrapo');
INSERT INTO `medicamento` VALUES (8, 'Digestivos en tabletas');
INSERT INTO `medicamento` VALUES (10, 'Algodón');
INSERT INTO `medicamento` VALUES (11, 'Guantes estériles');
INSERT INTO `medicamento` VALUES (12, 'Pomada antinflamatoria');
INSERT INTO `medicamento` VALUES (13, 'Pomada contra quemaduras');
INSERT INTO `medicamento` VALUES (14, 'Pinzas ');
INSERT INTO `medicamento` VALUES (15, 'Tijeras');
INSERT INTO `medicamento` VALUES (16, 'Termómentro');
INSERT INTO `medicamento` VALUES (24, 'Alcohol');

-- ----------------------------
-- Table structure for medidas_seguridad
-- ----------------------------
DROP TABLE IF EXISTS `medidas_seguridad`;
CREATE TABLE `medidas_seguridad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medidas_seguridad
-- ----------------------------
INSERT INTO `medidas_seguridad` VALUES (1, 'Revisar los vientos');
INSERT INTO `medidas_seguridad` VALUES (2, 'Utilización de los EPP');
INSERT INTO `medidas_seguridad` VALUES (3, 'Ver estado del tiempo');
INSERT INTO `medidas_seguridad` VALUES (4, 'Revisión de los equipos de comunicación');
INSERT INTO `medidas_seguridad` VALUES (5, 'Revisión del estado del vehículo');
INSERT INTO `medidas_seguridad` VALUES (6, 'Cumplir reglas de seguridad establecidas');
INSERT INTO `medidas_seguridad` VALUES (7, 'Revisar los gases en el registro');
INSERT INTO `medidas_seguridad` VALUES (8, 'Delimitar área de trabajo');
INSERT INTO `medidas_seguridad` VALUES (9, 'Revisión Nivel de Voltaje');
INSERT INTO `medidas_seguridad` VALUES (10, 'Comprobada Desenergización(neón, cadena de prueba)');
INSERT INTO `medidas_seguridad` VALUES (11, 'Instalación de equipo de puesta a tierra(en lugar de trabajo)');
INSERT INTO `medidas_seguridad` VALUES (12, 'Amarar escalera arriba y al centro');
INSERT INTO `medidas_seguridad` VALUES (13, 'Revisar fogonadura del poste y del resto de la estructura');
INSERT INTO `medidas_seguridad` VALUES (14, 'Revisar enterramiento de columnas y postes');
INSERT INTO `medidas_seguridad` VALUES (15, 'Asegurar poste y columna con vientos, pluma de camión o grua');
INSERT INTO `medidas_seguridad` VALUES (16, 'Revisar estado de los medios de trabajo');
INSERT INTO `medidas_seguridad` VALUES (17, 'Revisar estado de la construcción');

-- ----------------------------
-- Table structure for medio_de_proteccion
-- ----------------------------
DROP TABLE IF EXISTS `medio_de_proteccion`;
CREATE TABLE `medio_de_proteccion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vida_util` int(11) NULL DEFAULT NULL,
  `um` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `costo` double NULL DEFAULT NULL,
  `idTipoTalla` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_A3CCA8191FBC559`(`idTipoTalla`) USING BTREE,
  CONSTRAINT `FK_A3CCA8191FBC559` FOREIGN KEY (`idTipoTalla`) REFERENCES `tipo_tallas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medio_de_proteccion
-- ----------------------------
INSERT INTO `medio_de_proteccion` VALUES (1, '5020080402', 'BOTAS DE PROTECCION (SERVICIO)', 365, 'PAA', 49, 20.02, 1);
INSERT INTO `medio_de_proteccion` VALUES (2, '5020080421', 'BOTAS DE PROTECCION (ENERGETICA)', 365, 'PAA', 49, 23.75, 1);
INSERT INTO `medio_de_proteccion` VALUES (3, '5020080404', 'CALZADO PROTECCION DE PIEL PARA DAMAS', 365, 'UNO', 54, 29.27, 1);
INSERT INTO `medio_de_proteccion` VALUES (4, '5020080405', 'BOTAS DE GOMA PARA AGUA CAÑA ALTA', 1460, 'PAA', 54, 13.63, 1);
INSERT INTO `medio_de_proteccion` VALUES (5, '5020080419', 'BOTAS DE GOMA PARA AGUA CAÑA CORTA', 1460, 'PAA', 54, 5.43, 1);
INSERT INTO `medio_de_proteccion` VALUES (6, '5020080410', 'BOTAS LINIERAS CORTE ALTO', 180, 'PAA', 54, 36.71, 1);
INSERT INTO `medio_de_proteccion` VALUES (7, '5020080412', 'BOTAS DE PROTECCION PARA PLANTA EXTERIOR', 365, 'PAA', 54, 34.32, 1);
INSERT INTO `medio_de_proteccion` VALUES (8, '5020080411', 'BOTAS TORREROS C/CASQUILLO ACERO', 180, 'PAA', 54, 36.25, 1);
INSERT INTO `medio_de_proteccion` VALUES (9, '5020085603', 'OVEROLL CON TIRANTE', 365, 'UNO', 54, 17.94, 2);
INSERT INTO `medio_de_proteccion` VALUES (10, '5020085601', 'OVEROLL PARA HOMBRE C/ZIPPER', 365, 'UNO', 54, 18.47, 2);
INSERT INTO `medio_de_proteccion` VALUES (11, '5020085604', 'OVEROLL MANGA LARGA', 365, 'UNO', 54, 22.34, 2);
INSERT INTO `medio_de_proteccion` VALUES (12, '5020080076', 'OVEROLL DE TIRANTE FORESTAL ANTICORTE', 730, 'UNO', 54, 122.33, 2);
INSERT INTO `medio_de_proteccion` VALUES (13, '5020080077', 'CHAQUETA FORESTAL ANTICORTE', 730, 'UNO', 54, 139.4, 2);
INSERT INTO `medio_de_proteccion` VALUES (14, '5020080079', 'OVEROLL P/SOLDADOR 100% algodón', 730, 'UNO', 54, 16.03, 2);
INSERT INTO `medio_de_proteccion` VALUES (15, '5020080810', 'CAMISETA M/L P/TORRERO ENGUATADA', 365, 'UNO', 54, 10.37, 2);
INSERT INTO `medio_de_proteccion` VALUES (16, '5020080820', 'CAMISA DE TRABAJO CUELLO ABIERTO M/C', 365, 'UNO', 54, 8.56, 2);
INSERT INTO `medio_de_proteccion` VALUES (17, '5020080057', 'CAMISA DE TRABAJO CUELLO ABIERTO M/L', 365, 'UNO', 54, 10.25, 2);
INSERT INTO `medio_de_proteccion` VALUES (18, '5020080819', 'CHUBASQUERO CON PANTALON', 365, 'UNO', 54, 9.63, 2);
INSERT INTO `medio_de_proteccion` VALUES (19, '5020080802', 'CAPAS DE AGUA', 730, 'UNO', 49, 8.21, 2);
INSERT INTO `medio_de_proteccion` VALUES (20, '5020080027', 'CHALECO REFLECTANTE P/TRABAJO EN LA VIA', 1095, 'UNO', 54, 4.73, 2);
INSERT INTO `medio_de_proteccion` VALUES (21, '5020080063', 'BATAS SANITARIAS P/MUJER', 730, 'UNO', 54, 14.91, 2);
INSERT INTO `medio_de_proteccion` VALUES (22, '5020080417', 'BATA SANITARIA PARA HOMBRE', 730, 'UNO', 54, 14.89, 2);
INSERT INTO `medio_de_proteccion` VALUES (23, '5020080403', 'GUANTES SUPER REFORZADOS P/LINIERO', 180, 'PAA', 54, 2.62, 2);
INSERT INTO `medio_de_proteccion` VALUES (24, '5020080013', 'GUANTE OPER/MOTOSIERRA OLEO', 365, 'UNO', 54, 35.28, 2);
INSERT INTO `medio_de_proteccion` VALUES (25, '5020080064', 'GUANTES DE ARAMIDA P/FIBRA OPTICA', 365, 'PAA', 54, 0.87, 2);
INSERT INTO `medio_de_proteccion` VALUES (26, '5020087906', 'GUANTE D/PROTEC. IMPERMEABLE P/SOTERRADO', 90, 'UNO', 54, 1.84, 2);
INSERT INTO `medio_de_proteccion` VALUES (27, '5020080028', 'GUANTES PIEL SUAVE AJUSTABLE P/TORRERO', 730, 'PAA', 54, 6.69, 2);
INSERT INTO `medio_de_proteccion` VALUES (28, '5020080058', 'GUANTE NITRILO ACABADO RUGOS, ANTIRESBALANTE L:60mm', 365, 'UNO', 54, 1.1, 2);
INSERT INTO `medio_de_proteccion` VALUES (29, '5020080065', 'GUANTES DE LATEX', 90, 'PAA', 54, 1.03, 2);
INSERT INTO `medio_de_proteccion` VALUES (30, '5020082411', 'GUANTES DE GOMA', 90, 'PAA', 53, 2.11, 2);
INSERT INTO `medio_de_proteccion` VALUES (31, '5020087905', 'GUANTE DE PROTECCION PARA MOTORISTAS', 730, 'UNO', 54, 5.83, 2);
INSERT INTO `medio_de_proteccion` VALUES (32, '5020082415', 'GUANTES P/ACIDO', 365, 'PAA', 54, 5.63, 2);
INSERT INTO `medio_de_proteccion` VALUES (33, '5020082427', 'GUANTES DIELECT.CLASE 00 TENSION MAX.50V', 730, 'PAA', 54, 24.96, 2);
INSERT INTO `medio_de_proteccion` VALUES (34, '5020082425', 'GUANTES DIELECTRICOS 10KV MOD.40002', 730, 'PAA', 54, 41.62, 2);
INSERT INTO `medio_de_proteccion` VALUES (35, '5020080020', 'GUANTE PARA VIDRIO Y MATERIAL CORTANTE', 365, 'UNO', 54, 10.73, 2);
INSERT INTO `medio_de_proteccion` VALUES (36, '5020082423', 'GUANTES P/SOLDAR', 1095, 'PAA', 54, 3.61, 2);
INSERT INTO `medio_de_proteccion` VALUES (37, '5020080033', 'GUANTES ALGODON FINO P/CONTAR MONEDAS', 365, 'PAA', 54, 0.41, 2);
INSERT INTO `medio_de_proteccion` VALUES (38, '5020080822', 'CASCOS D/PROTECCION P/MOTOS (INTEGRALES)', 1095, 'UNO', 54, 83.07, 2);
INSERT INTO `medio_de_proteccion` VALUES (39, '5020080078', 'CASCO PROTECTOR P/BICICLETAS', 1095, 'UNO', 54, 23.71, 2);
INSERT INTO `medio_de_proteccion` VALUES (40, '5020080818', 'CASCOS DE PROTECCION P/MOTOS NO INTEGRALES', 1095, 'UNO', 54, 54.28, 2);
INSERT INTO `medio_de_proteccion` VALUES (41, '5020080803', 'CINTURON SEGURIDAD P/REPARADOR', 1460, 'UNO', 54, 137.66, 1);
INSERT INTO `medio_de_proteccion` VALUES (42, '5020080804', 'CINTURON SEGURIDAD P/LINIERO 4\"', 1460, 'UNO', 54, 122.16, 1);
INSERT INTO `medio_de_proteccion` VALUES (43, '5020080811', 'CINTURON LABOR FUERZA', 1095, 'UNO', 54, 14.01, 3);
INSERT INTO `medio_de_proteccion` VALUES (44, '5020086006', 'PANTALON ESPECIAL DE TRABAJO', 365, 'UNO', 54, 8.99, 3);
INSERT INTO `medio_de_proteccion` VALUES (45, '5020086010', 'PANTALON DE TORRERO CON REFUERZO', 365, 'UNO', 54, 24.71, 3);
INSERT INTO `medio_de_proteccion` VALUES (46, '5020080816', 'CARETA P/SOLDAR MOVIL', 1825, 'UNO', 54, 138.75, 1);
INSERT INTO `medio_de_proteccion` VALUES (47, '5020080026', 'CRISTAL FILTRO RADIACION P/CARETA SOLDAR(SOMBRA 12)108X51MM', 730, 'UNO', 54, 0.69, 1);
INSERT INTO `medio_de_proteccion` VALUES (48, '5020080825', 'CRISTALES DE CARETAS PARA SOLDAR(BLANCOS) 108X51MM', 730, 'UNO', 54, 0.36, 1);
INSERT INTO `medio_de_proteccion` VALUES (49, '5020084801', 'MANGAS PARA SOLDAR', 1825, 'PAA', 54, 9.99, 1);
INSERT INTO `medio_de_proteccion` VALUES (50, '5020086004', 'POLAINAS DE CUERO PARA SOLDAR', 1825, 'UNO', 54, 8.04, 1);
INSERT INTO `medio_de_proteccion` VALUES (51, '5020081201', 'DELANTAL P/SOLDAR 36\"', 1825, 'UNO', 54, 11.3, 1);
INSERT INTO `medio_de_proteccion` VALUES (52, '5020080066', 'POLAINAS ANTIACIDO', 1095, 'UNO', 54, 11.7, 1);
INSERT INTO `medio_de_proteccion` VALUES (53, '5020080059', 'POLAINAS ANTICORTANTES DE 30 CM', 1095, 'UNO', 54, 78.29, 1);
INSERT INTO `medio_de_proteccion` VALUES (54, '5020081207', 'DELANTAR CONTRA ACIDO', 1095, 'UNO', 54, 10.05, 1);
INSERT INTO `medio_de_proteccion` VALUES (55, '5020081208', 'DELANTAL DE PVC LARGO', 365, 'UNO', 54, 12, 1);
INSERT INTO `medio_de_proteccion` VALUES (56, '5020080002', 'ALFOMBRAS DIELECTRICAS 60X60CM', 3650, 'UNO', 54, 17.45, 1);
INSERT INTO `medio_de_proteccion` VALUES (57, '5020080003', 'ALFOMBRAS DIELECTRICAS (METROS)', 3650, 'M', 54, 53.85, 1);
INSERT INTO `medio_de_proteccion` VALUES (58, '5020080009', 'ESPEJUELO PROTECTOR UV Y PARTICULAS VOLANTES', 730, 'UNO', 54, 2.3, 1);
INSERT INTO `medio_de_proteccion` VALUES (59, '5020084805', 'ESPEJUELOS CONTRA IMPACTOS BLANCO', 730, 'UNO', 54, 1.43, 1);
INSERT INTO `medio_de_proteccion` VALUES (60, '5020080060', 'PANTALLA TRANSPARENTE CON PROTECCIÓN AUDITIVA', 1825, 'UNO', 54, 8.32, 1);
INSERT INTO `medio_de_proteccion` VALUES (61, '5020081601', 'ESPEJUELOS P/SOLDADURAS AUTOGENA', 1825, 'UNO', 54, 7, 1);
INSERT INTO `medio_de_proteccion` VALUES (62, '5020081606', 'ESPEJUELOS CONTRA  ACIDO', 730, 'UNO', 54, 1.98, 1);
INSERT INTO `medio_de_proteccion` VALUES (63, '5020080012', 'CASCO PROTECCION P/MOTOSIERRA OLEO', 1825, 'UNO', 54, 23.42, 1);
INSERT INTO `medio_de_proteccion` VALUES (64, '5020080813', 'CASCOS DE SEGURIDAD P/CONTRUCCIÓN', 1825, 'UNO', 54, 2.15, 1);
INSERT INTO `medio_de_proteccion` VALUES (65, '5020080806', 'CASCOS DIELECTRICOS', 1825, 'UNO', 54, 3.39, 1);
INSERT INTO `medio_de_proteccion` VALUES (66, '5020080014', 'GAFAS PROT OPER/MOTOSIERRA OLEO', 730, 'UNO', 54, 2.67, 1);
INSERT INTO `medio_de_proteccion` VALUES (67, '5020080029', 'PROTECTORES DE OIDO PARA CASCOS', 1095, 'UNO', 54, 13.6, 1);
INSERT INTO `medio_de_proteccion` VALUES (68, '5020085602', 'OREJERA CONTRA RUIDO', 1460, 'UNO', 54, 4.95, 1);
INSERT INTO `medio_de_proteccion` VALUES (69, '5020080032', 'TAPON CONTRA RUIDOS C/BANDA SUJECCION', 730, 'UNO', 54, 0.1, 1);
INSERT INTO `medio_de_proteccion` VALUES (70, '5020080049', 'CASCO P/TORRERO P/UTILIZAR CON EL ARNES', 730, 'UNO', 54, 32.85, 1);
INSERT INTO `medio_de_proteccion` VALUES (71, '5020080039', 'ARNES  P TRABAJO EN ALTURA SIN CINTURÓN', 730, 'UNO', 5, 61.19, 1);
INSERT INTO `medio_de_proteccion` VALUES (72, '5020080040', 'CINTA PTO ANCLAJE MOVIL P/ARNES', 730, 'UNO', 54, 9.27, 1);
INSERT INTO `medio_de_proteccion` VALUES (73, '5020080041', 'CINTA C/3 GANCHOS/ABS/ENERGIA P/ARNES', 730, 'UNO', 54, 30.81, 1);
INSERT INTO `medio_de_proteccion` VALUES (74, '5020080042', 'CUERDA POSICIONAMIENTO AJUST 2M P/ARNES', 730, 'UNO', 54, 18.36, 1);
INSERT INTO `medio_de_proteccion` VALUES (75, '5020080043', 'BLOQUEADOR AUTOM C/CUERDA 30CM P/ARNES', 1825, 'UNO', 54, 66.29, 1);
INSERT INTO `medio_de_proteccion` VALUES (76, '5020080044', 'ABSORBEDOR ENERG ELASTICO 2M P ARNES', 730, 'UNO', 5, 32.87, 1);
INSERT INTO `medio_de_proteccion` VALUES (77, '5020080047', 'CONECTOR GALV  APERTURA 18MM  P/ARNES', 1825, 'UNO', 54, 3.85, 1);
INSERT INTO `medio_de_proteccion` VALUES (78, '5020080048', 'CONECTOR APERTURA/100MM GO-100 P/ARNES', 1825, 'UNO', 54, 100.12, 1);
INSERT INTO `medio_de_proteccion` VALUES (79, '5020080050', 'ELEMENTO ANTICAIDA RETRACTIL P/ARNES', 1825, 'UNO', 54, 92.68, 1);
INSERT INTO `medio_de_proteccion` VALUES (80, '5020080051', 'LINEA DE VIDA 30M TENS/C/PESO/MOSQUETON', 1095, 'UNO', 54, 74.69, 1);
INSERT INTO `medio_de_proteccion` VALUES (81, '5020086801', 'RESPIRADOR P/PROTECC.D/VIAS RES', 730, 'UNO', 54, 8.49, 1);
INSERT INTO `medio_de_proteccion` VALUES (82, '5020082006', 'FILTRO PARA MASCARA DE PINTAR', 365, 'UNO', 54, 5.58, 1);
INSERT INTO `medio_de_proteccion` VALUES (83, '5020082007', 'FILTRO PURIFICADOR AIRE PARA POLVOS Y PARTÍCULAS', 365, 'UNO', 54, 5.57, 1);
INSERT INTO `medio_de_proteccion` VALUES (84, '5033800143', 'NASOBUCO TELA', 90, 'UNO', 54, 3, 1);
INSERT INTO `medio_de_proteccion` VALUES (85, '5020080030', 'MASCARILLA DESECHABLE C/POLVO', 90, 'UNO', 54, 0.06, 1);
INSERT INTO `medio_de_proteccion` VALUES (86, '5020087907', 'MUÑEQUERA DE PIEL', 730, 'PAA', 54, 5.5, 1);
INSERT INTO `medio_de_proteccion` VALUES (87, '5020080081', 'ARNÉS CON CINTURÓN PARA TRABAJOS EN ALTURA', 730, 'UNO', 54, 35.01, 1);
INSERT INTO `medio_de_proteccion` VALUES (88, '5020080016', 'DETECTOR CAMPO ELECTRICO', 365, 'UNO', 54, 181.01, 1);
INSERT INTO `medio_de_proteccion` VALUES (89, '5020080017', 'ARNES DE SEGURIDAD PARA SOTERRADO', 1095, 'UNO', 54, 58.57, 1);
INSERT INTO `medio_de_proteccion` VALUES (90, '5020080067', 'EQUIPO ASCENS/DESCENS 400M SOGA Ø 10.5MM', 1095, 'UNO', 54, 3075.68, 1);
INSERT INTO `medio_de_proteccion` VALUES (91, '5020080069', 'MOCHILA P/SIST ANTI-CAIDA XL 1000X500MM', 1095, 'UNO', 54, 42.02, 1);
INSERT INTO `medio_de_proteccion` VALUES (92, '5020080052', 'CUERDA DE CINTURÓN DE S/HAWK 1.6MC/FORRO', 365, 'UNO', 54, 62.85, 1);
INSERT INTO `medio_de_proteccion` VALUES (93, '5020087910', 'FILTRO MASCARA MASK PLUS P2R', 365, 'UNO', 54, 2.44, 1);
INSERT INTO `medio_de_proteccion` VALUES (94, '5020087912', 'Sombrero Yarey ala ancha', 365, 'UNO', 54, 3, 1);

-- ----------------------------
-- Table structure for medios_asignados
-- ----------------------------
DROP TABLE IF EXISTS `medios_asignados`;
CREATE TABLE `medios_asignados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `id_medios` int(11) NULL DEFAULT NULL,
  `fecha` datetime(0) NULL DEFAULT NULL,
  `causas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_6730ED31E79FFC08`(`id_trabajador`) USING BTREE,
  INDEX `IDX_6730ED31AA6637E2`(`id_medios`) USING BTREE,
  CONSTRAINT `FK_6730ED31AA6637E2` FOREIGN KEY (`id_medios`) REFERENCES `medio_de_proteccion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_6730ED31E79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medios_asignados
-- ----------------------------
INSERT INTO `medios_asignados` VALUES (28, 2005, 1, '2019-03-04 00:00:00', 'Reposición', 3);
INSERT INTO `medios_asignados` VALUES (29, 2005, 2, '2019-03-04 00:00:00', 'Reposición', 2);
INSERT INTO `medios_asignados` VALUES (35, 2005, 93, '2019-03-04 00:00:00', 'Reposición', 1);
INSERT INTO `medios_asignados` VALUES (36, 2005, 94, '2019-03-04 00:00:00', 'Reposición', 5);
INSERT INTO `medios_asignados` VALUES (37, 2005, 91, '2019-03-04 00:00:00', 'Ciclo de vida', 6);
INSERT INTO `medios_asignados` VALUES (38, 2005, 23, '2019-03-04 00:00:00', 'Ciclo de vida', 4);
INSERT INTO `medios_asignados` VALUES (39, 2005, 24, '2019-03-04 00:00:00', 'Ciclo de vida', 7);
INSERT INTO `medios_asignados` VALUES (40, 2005, 19, '2018-05-07 00:00:00', 'Ciclo de vida', 5);
INSERT INTO `medios_asignados` VALUES (41, 1940, 1, '2018-05-08 00:00:00', 'Ciclo de vida', 5);
INSERT INTO `medios_asignados` VALUES (42, 1940, 2, '2018-05-08 00:00:00', 'Ciclo de vida', 5);
INSERT INTO `medios_asignados` VALUES (43, 2005, 30, '2020-01-17 00:00:00', 'Ciclo de vida', NULL);

-- ----------------------------
-- Table structure for naturaleza_lesion
-- ----------------------------
DROP TABLE IF EXISTS `naturaleza_lesion`;
CREATE TABLE `naturaleza_lesion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of naturaleza_lesion
-- ----------------------------
INSERT INTO `naturaleza_lesion` VALUES (1, 'Fracturas');
INSERT INTO `naturaleza_lesion` VALUES (2, 'Luxaciones');
INSERT INTO `naturaleza_lesion` VALUES (3, 'Torceduras y esguinces');
INSERT INTO `naturaleza_lesion` VALUES (4, 'Conmociones y traumatismo internos');
INSERT INTO `naturaleza_lesion` VALUES (5, 'Amputaciones y enucleaciones');
INSERT INTO `naturaleza_lesion` VALUES (6, 'Otras heridas (desgarramientos, heridas, cortaduras, heridas contusas, de cuero cabelludo)');
INSERT INTO `naturaleza_lesion` VALUES (7, 'Traumatismo superficial');
INSERT INTO `naturaleza_lesion` VALUES (8, 'Contusiones y aplastamientos');
INSERT INTO `naturaleza_lesion` VALUES (9, 'Quemaduras');
INSERT INTO `naturaleza_lesion` VALUES (10, 'Intoxicaciones agudas');
INSERT INTO `naturaleza_lesion` VALUES (11, 'Efectos de la exposición a condiciones ambientales (frío, calor, radiaciones, presión atmosférica, rayos, otros)');
INSERT INTO `naturaleza_lesion` VALUES (12, 'Asfixias');
INSERT INTO `naturaleza_lesion` VALUES (13, 'Efectos de la electricidad');
INSERT INTO `naturaleza_lesion` VALUES (14, 'Efectos nocivos de las radiaciones');
INSERT INTO `naturaleza_lesion` VALUES (15, 'Lesiones múltiples de naturaleza diversa ');
INSERT INTO `naturaleza_lesion` VALUES (16, 'Otras lesiones');

-- ----------------------------
-- Table structure for nivel_supervision
-- ----------------------------
DROP TABLE IF EXISTS `nivel_supervision`;
CREATE TABLE `nivel_supervision`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nivel_supervision
-- ----------------------------
INSERT INTO `nivel_supervision` VALUES (1, 'Nivel 1');
INSERT INTO `nivel_supervision` VALUES (2, 'Nivel 2');

-- ----------------------------
-- Table structure for partes_del_cuerpo_lesionado
-- ----------------------------
DROP TABLE IF EXISTS `partes_del_cuerpo_lesionado`;
CREATE TABLE `partes_del_cuerpo_lesionado`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of partes_del_cuerpo_lesionado
-- ----------------------------
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (1, 'Cabeza');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (2, 'Cuello (con inclusión de la garganta y de las vertebras cervicales)');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (3, 'Tronco');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (4, 'Miembro superior');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (5, 'Miembro inferior');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (6, 'Ubicaciones múltiples');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (7, 'Lesiones generales');
INSERT INTO `partes_del_cuerpo_lesionado` VALUES (8, 'Ubicación no precisada');

-- ----------------------------
-- Table structure for permiso_seguridad
-- ----------------------------
DROP TABLE IF EXISTS `permiso_seguridad`;
CREATE TABLE `permiso_seguridad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_de_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lugar_ejecucion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `descripcion_trabajo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permiso_seguridad
-- ----------------------------
INSERT INTO `permiso_seguridad` VALUES (2, '5020', 'Remedios 109', 'No me importa');

-- ----------------------------
-- Table structure for permisosseguridad_medidas
-- ----------------------------
DROP TABLE IF EXISTS `permisosseguridad_medidas`;
CREATE TABLE `permisosseguridad_medidas`  (
  `permiso_seguridad_id` int(11) NOT NULL,
  `medidas_seguridad_id` int(11) NOT NULL,
  PRIMARY KEY (`permiso_seguridad_id`, `medidas_seguridad_id`) USING BTREE,
  INDEX `IDX_FE7227D22E2E3602`(`permiso_seguridad_id`) USING BTREE,
  INDEX `IDX_FE7227D282879D1E`(`medidas_seguridad_id`) USING BTREE,
  CONSTRAINT `FK_FE7227D22E2E3602` FOREIGN KEY (`permiso_seguridad_id`) REFERENCES `permiso_seguridad` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_FE7227D282879D1E` FOREIGN KEY (`medidas_seguridad_id`) REFERENCES `medidas_seguridad` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permisosseguridad_trabajadoresejecutan
-- ----------------------------
DROP TABLE IF EXISTS `permisosseguridad_trabajadoresejecutan`;
CREATE TABLE `permisosseguridad_trabajadoresejecutan`  (
  `trabajador_id` int(11) NOT NULL,
  `permiso_seguridad_id` int(11) NOT NULL,
  PRIMARY KEY (`trabajador_id`, `permiso_seguridad_id`) USING BTREE,
  INDEX `IDX_151CB4B8EC3656E`(`trabajador_id`) USING BTREE,
  INDEX `IDX_151CB4B82E2E3602`(`permiso_seguridad_id`) USING BTREE,
  CONSTRAINT `FK_151CB4B82E2E3602` FOREIGN KEY (`permiso_seguridad_id`) REFERENCES `permiso_seguridad` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_151CB4B8EC3656E` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for plan_de_medidas
-- ----------------------------
DROP TABLE IF EXISTS `plan_de_medidas`;
CREATE TABLE `plan_de_medidas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idsupervision_id` int(11) NULL DEFAULT NULL,
  `id_riesgo_id` int(11) NULL DEFAULT NULL,
  `peligros` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `clasificacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha_cumplimiento` datetime(0) NULL DEFAULT NULL,
  `estado` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_AEE910BFE19EB6CB`(`idsupervision_id`) USING BTREE,
  INDEX `IDX_AEE910BFF2A2B44D`(`id_riesgo_id`) USING BTREE,
  CONSTRAINT `FK_AEE910BFE19EB6CB` FOREIGN KEY (`idsupervision_id`) REFERENCES `supervision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_AEE910BFF2A2B44D` FOREIGN KEY (`id_riesgo_id`) REFERENCES `riesgo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for probabilidad
-- ----------------------------
DROP TABLE IF EXISTS `probabilidad`;
CREATE TABLE `probabilidad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `valor` int(11) NULL DEFAULT NULL,
  `idgrado_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_E73047933B7109C1`(`idgrado_id`) USING BTREE,
  CONSTRAINT `FK_E73047933B7109C1` FOREIGN KEY (`idgrado_id`) REFERENCES `grado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of probabilidad
-- ----------------------------
INSERT INTO `probabilidad` VALUES (1, 'Es improbable que se llegue a producir', 1, 1);
INSERT INTO `probabilidad` VALUES (2, 'Es posible que se llegue a producir', 2, 2);
INSERT INTO `probabilidad` VALUES (3, 'Es probable que se produzca a medio plazo', 3, 3);
INSERT INTO `probabilidad` VALUES (4, 'Es probable que se produzca a corto período de tiempo', 4, 4);
INSERT INTO `probabilidad` VALUES (5, 'Es muy probable que se produzca  inmediatamente', 5, 5);

-- ----------------------------
-- Table structure for riesgo
-- ----------------------------
DROP TABLE IF EXISTS `riesgo`;
CREATE TABLE `riesgo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idprobabilidad_id` int(11) NULL DEFAULT NULL,
  `idseveridad_id` int(11) NULL DEFAULT NULL,
  `idsupervision_id` int(11) NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_CEF448C4E1EACA99`(`idprobabilidad_id`) USING BTREE,
  INDEX `IDX_CEF448C448A61130`(`idseveridad_id`) USING BTREE,
  INDEX `IDX_CEF448C4E19EB6CB`(`idsupervision_id`) USING BTREE,
  CONSTRAINT `FK_CEF448C448A61130` FOREIGN KEY (`idseveridad_id`) REFERENCES `severidad` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CEF448C4E19EB6CB` FOREIGN KEY (`idsupervision_id`) REFERENCES `supervision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CEF448C4E1EACA99` FOREIGN KEY (`idprobabilidad_id`) REFERENCES `probabilidad` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for severidad
-- ----------------------------
DROP TABLE IF EXISTS `severidad`;
CREATE TABLE `severidad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `valor` int(11) NULL DEFAULT NULL,
  `idgrado_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_DC76A9E43B7109C1`(`idgrado_id`) USING BTREE,
  CONSTRAINT `FK_DC76A9E43B7109C1` FOREIGN KEY (`idgrado_id`) REFERENCES `grado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of severidad
-- ----------------------------
INSERT INTO `severidad` VALUES (1, 'Puede causar pequeñas lesiones sin bajas', 1, 1);
INSERT INTO `severidad` VALUES (2, 'Puede causar pequeñas lesiones con bajas', 2, 2);
INSERT INTO `severidad` VALUES (3, 'Puede causar lesiones no invalidantes', 3, 3);
INSERT INTO `severidad` VALUES (4, 'Puede causar lesiones inportantes invalidates', 4, 4);
INSERT INTO `severidad` VALUES (5, 'Puede causar la muerte o gran invalidez', 5, 5);

-- ----------------------------
-- Table structure for supervision
-- ----------------------------
DROP TABLE IF EXISTS `supervision`;
CREATE TABLE `supervision`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idarea_id` int(11) NULL DEFAULT NULL,
  `id_uo_id` int(11) NULL DEFAULT NULL,
  `idnivel_id` int(11) NULL DEFAULT NULL,
  `aspecto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `evaluacion_final` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_30C258C0620B12F2`(`idarea_id`) USING BTREE,
  INDEX `IDX_30C258C0E3D022E5`(`id_uo_id`) USING BTREE,
  INDEX `IDX_30C258C070E16EA3`(`idnivel_id`) USING BTREE,
  CONSTRAINT `FK_30C258C0620B12F2` FOREIGN KEY (`idarea_id`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_30C258C070E16EA3` FOREIGN KEY (`idnivel_id`) REFERENCES `nivel_supervision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_30C258C0E3D022E5` FOREIGN KEY (`id_uo_id`) REFERENCES `unidad_organizativa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for supervision_trabajador
-- ----------------------------
DROP TABLE IF EXISTS `supervision_trabajador`;
CREATE TABLE `supervision_trabajador`  (
  `supervision_id` int(11) NOT NULL,
  `trabajador_id` int(11) NOT NULL,
  PRIMARY KEY (`supervision_id`, `trabajador_id`) USING BTREE,
  INDEX `IDX_39C81ED8F0E62780`(`supervision_id`) USING BTREE,
  INDEX `IDX_39C81ED8EC3656E`(`trabajador_id`) USING BTREE,
  CONSTRAINT `FK_39C81ED8EC3656E` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_39C81ED8F0E62780` FOREIGN KEY (`supervision_id`) REFERENCES `supervision` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tallas
-- ----------------------------
DROP TABLE IF EXISTS `tallas`;
CREATE TABLE `tallas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `talladescripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `medidas_cm` double NULL DEFAULT NULL,
  `proveedor` tinyint(1) NULL DEFAULT NULL,
  `idTipoTalla` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_F4B01691FBC559`(`idTipoTalla`) USING BTREE,
  CONSTRAINT `FK_F4B01691FBC559` FOREIGN KEY (`idTipoTalla`) REFERENCES `tipo_tallas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tallas
-- ----------------------------
INSERT INTO `tallas` VALUES (1, 'S', 50, 0, 2);
INSERT INTO `tallas` VALUES (2, 'M', 52, 0, 2);
INSERT INTO `tallas` VALUES (3, 'L', 56, 0, 2);
INSERT INTO `tallas` VALUES (4, 'XL', 60, 0, 2);
INSERT INTO `tallas` VALUES (5, 'XXL', 64, 0, 2);
INSERT INTO `tallas` VALUES (6, 'XXXL', 66, 0, 2);
INSERT INTO `tallas` VALUES (7, '6', NULL, 0, 2);
INSERT INTO `tallas` VALUES (8, '7', NULL, 0, 2);
INSERT INTO `tallas` VALUES (9, '8', NULL, 0, 2);
INSERT INTO `tallas` VALUES (10, '9', NULL, 0, 2);
INSERT INTO `tallas` VALUES (11, '10', NULL, 0, 2);
INSERT INTO `tallas` VALUES (12, '11', NULL, 0, 2);
INSERT INTO `tallas` VALUES (13, 'S- T 4', 90, 1, 3);
INSERT INTO `tallas` VALUES (14, 'M- T 5', 95, 1, 3);
INSERT INTO `tallas` VALUES (15, 'M- T 6', 105, 1, 3);
INSERT INTO `tallas` VALUES (16, 'L- T 7', 110, 1, 3);
INSERT INTO `tallas` VALUES (17, 'L- T 8', 115, 1, 3);
INSERT INTO `tallas` VALUES (18, 'L- T 9', 120, 1, 3);
INSERT INTO `tallas` VALUES (19, 'XL- T 10', 125, 1, 3);
INSERT INTO `tallas` VALUES (34, '35', NULL, 0, 1);
INSERT INTO `tallas` VALUES (35, '36', NULL, 0, 1);
INSERT INTO `tallas` VALUES (36, '37', NULL, 0, 1);
INSERT INTO `tallas` VALUES (37, '38', NULL, 0, 1);
INSERT INTO `tallas` VALUES (38, '39', NULL, 0, 1);
INSERT INTO `tallas` VALUES (39, '40', NULL, 0, 1);
INSERT INTO `tallas` VALUES (40, '41', NULL, 0, 1);
INSERT INTO `tallas` VALUES (41, '42', NULL, 0, 1);
INSERT INTO `tallas` VALUES (42, '43', NULL, 0, 1);
INSERT INTO `tallas` VALUES (43, '44', NULL, 0, 1);
INSERT INTO `tallas` VALUES (44, '45', NULL, 0, 1);
INSERT INTO `tallas` VALUES (45, '46', NULL, 0, 1);
INSERT INTO `tallas` VALUES (46, '47', NULL, 0, 1);

-- ----------------------------
-- Table structure for tipo_accidentes
-- ----------------------------
DROP TABLE IF EXISTS `tipo_accidentes`;
CREATE TABLE `tipo_accidentes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_accidentes
-- ----------------------------
INSERT INTO `tipo_accidentes` VALUES (1, 'Simple');
INSERT INTO `tipo_accidentes` VALUES (2, 'Mortal');
INSERT INTO `tipo_accidentes` VALUES (3, 'Múltiple');

-- ----------------------------
-- Table structure for tipo_tallas
-- ----------------------------
DROP TABLE IF EXISTS `tipo_tallas`;
CREATE TABLE `tipo_tallas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipo_tallas
-- ----------------------------
INSERT INTO `tipo_tallas` VALUES (1, 'Tallas Cubana');
INSERT INTO `tipo_tallas` VALUES (2, 'Tallas Universal');
INSERT INTO `tipo_tallas` VALUES (3, 'Tallas Proveedor');

-- ----------------------------
-- Table structure for trabajador
-- ----------------------------
DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE `trabajador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) NULL DEFAULT NULL,
  `id_cargo` int(11) NULL DEFAULT NULL,
  `id_unidad_organizativa` int(11) NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `primer_apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Ci` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sexo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `raza` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nivel_escolar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nombre_titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ano_graduacion` int(11) NULL DEFAULT NULL,
  `pcc` int(11) NULL DEFAULT NULL,
  `ujc` int(11) NULL DEFAULT NULL,
  `estado_civil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `calle_y_numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `entre_calles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `municipio` int(11) NULL DEFAULT NULL,
  `detalles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ubicacion_de_la_defensa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `moneda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `area_de_personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `modulo_de_ropa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subdivision_personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `numero_persona` int(11) NULL DEFAULT NULL,
  `clase_de_contrato` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `segundo_apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tiempo_restante_chequeo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_42157CDF5CB4216A`(`id_area`) USING BTREE,
  INDEX `IDX_42157CDFD56B1641`(`id_cargo`) USING BTREE,
  INDEX `IDX_42157CDF2AA9DCC5`(`id_unidad_organizativa`) USING BTREE,
  CONSTRAINT `FK_42157CDF2AA9DCC5` FOREIGN KEY (`id_unidad_organizativa`) REFERENCES `unidad_organizativa` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_42157CDF5CB4216A` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_42157CDFD56B1641` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2068 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trabajador
-- ----------------------------
INSERT INTO `trabajador` VALUES (1379, 4, 12, 39, 'LIANA ISABEL', 'FONTE', '85011501610', '0', 'Blanca', 'Superior', 'Lic. en Economía', 2011, 0, 0, 'Solt.', 'GUSTAVO LORES NO 73', 'ENTRE JUAN G. GÓMEZ Y ANGELES', 111, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 657, 'Indeterminado', 'SUAREZ', '22');
INSERT INTO `trabajador` VALUES (1380, 5, 52, 4, 'JAVIER', 'FLORES', '66042617528', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2008, 0, 0, 'Cas.', 'DELICIAS  NO. 616', 'SAN FRANCISCO  Y CONCEPCION   LAWTON', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 2589, 'Indeterminado', 'OJEDA', '51');
INSERT INTO `trabajador` VALUES (1381, 1, 22, 6, 'GRETEL', 'CUARTA', '79081905272', '0', 'Blanca', 'Superior', 'Ing. Industrial', 2004, 0, 0, 'Solt.', 'DUREGE #117 APTO E', '/ SAN LEONARDO Y ENAMORADO', 309, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 2867, 'Indeterminado', 'DUEÑAS', '214');
INSERT INTO `trabajador` VALUES (1382, 8, 41, 37, 'YERINA', 'BELLO', '80111217110', '0', 'Blanca', 'Superior', 'Lic. en Contabilidad y Finanzas', 2007, 0, 0, 'Solt.', 'SAN IDALECIO 453 BAJOS', 'SANTA EMILIA Y ZAPOTE', 309, NULL, 'Se evacua', 2218, 'CUP', 'Servicios', 'Modulo 1', 'Lic.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 3094, 'Indeterminado', 'MONTEAGUDO', '20');
INSERT INTO `trabajador` VALUES (1383, 4, 54, 46, 'DOMINGO', 'DELGADO', '67051201189', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Cas.', 'CALLE 14 NO. 206', 'E/ 7 Y 9 SAN FELIPE', 2411, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 3842, 'Indeterminado', 'HERNANDEZ', '1');
INSERT INTO `trabajador` VALUES (1384, 8, 13, 38, 'FRANCISCO', 'ARNAU', '65021426222', '0', 'Blanca', 'Superior', 'Ing. en Electrónica', 1993, 0, 0, 'Cas.', 'CALLE 369 EDIF 17821', '178 Y 184 APTO 12 MULGOBA BOYEROS', 313, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Msc.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 6020, 'Indeterminado', 'GARCELL', '7');
INSERT INTO `trabajador` VALUES (1385, 1, 52, 3, 'OSVALDO', 'RAMA', '57050903845', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', 'CALLE LAUREL EDIF 45 A-11', 'ENTRE 6TA Y 7MA REPTO ELECTRICO', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 7937, 'Indeterminado', 'VARELA', '242');
INSERT INTO `trabajador` VALUES (1386, 1, 73, 52, 'MANUELA  L', 'RODRÍGUEZ', '67061600979', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad y Finanzas', 1985, 0, 0, 'Solt.', 'REFORMA NO. 11003 APTO 4', 'E/ 9NA Y PASTORA.', 310, 'R095 01.04.2012', 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 9973, 'Indeterminado', 'MEDEROS', '12');
INSERT INTO `trabajador` VALUES (1387, 1, 50, 51, 'REYNIER', 'TOSCANO', '79102304783', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 1998, 0, 0, 'Solt.', 'CALLE 2DA  NO.268', 'E/ STA CATALINA Y ALBEAR', 310, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Arroyo Naranjo: Alvarado No. 8 e/ Santa Amalia y Miguel', 10054, 'Indeterminado', 'BERMÚDEZ', '45');
INSERT INTO `trabajador` VALUES (1388, 3, 12, 29, 'NITZA', 'BELL', '70122213854', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Química Analítica', 1992, 0, 0, 'Cas.', 'CALLE COTILLA  NO.10016', 'E/ PASTORA Y OESTE   RPTO: LOS PINOS', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 10268, 'Indeterminado', 'GAINZA', '156');
INSERT INTO `trabajador` VALUES (1389, 1, 52, 3, 'FERNANDO', 'GARCIA', '59101031640', '0', 'Blanca', 'Medio', '9no Grado', 2007, 0, 0, 'Solt.', 'CALLE 7MA NO.10302', 'E/ C Y K  RPTO: ALTAHABANA', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 10897, 'Indeterminado', 'ALVAREZ', '46');
INSERT INTO `trabajador` VALUES (1390, 1, 52, 3, 'RENÉ', 'ROJAS', '75070326621', '0', 'Negra', 'Medio', 'Oficio', 1993, 0, 0, 'Solt.', 'CALLE 82 NO.1914 APTO 6.', 'E/ 19 Y 21', 302, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 10917, 'Indeterminado', 'RIZO', '47');
INSERT INTO `trabajador` VALUES (1391, 8, 55, 4, 'RAY', 'MARTINEZ', '73121705724', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Cas.', 'CALLE 47 #7412 APTO 2', '74 y 76', 311, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 11838, 'Indeterminado', 'VERGARA', '216');
INSERT INTO `trabajador` VALUES (1392, 1, 28, 22, 'CARIDAD DE ZENA', 'JIMÉNEZ', '59043012712', '0', 'Blanca', 'Superior', 'Lic. en Aritmética y Matemática', 1982, 0, 0, 'Solt.', 'CDA. DE VENTO NO.7527 APTO 11  E/ 100  Y  EMBIL.', NULL, 313, NULL, 'No incorporado', 1841, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 11923, 'Indeterminado', 'CABRERA', '269');
INSERT INTO `trabajador` VALUES (1393, 4, 74, 41, 'JUAN ANTONIO', 'HERNANDEZ', '51082200465', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Radio Enlace', 1977, 0, 0, 'Cas.', 'MAYIA RODRIGUEZ NO.455', 'CARMEN Y PATROCINIO', 309, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12035, 'Indeterminado', 'PITA', '154');
INSERT INTO `trabajador` VALUES (1394, 4, 13, 39, 'AIDA CARIDAD', 'CALVO', '72042825539', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'AVE ALTURA LAS GUÁSIMAS, EDIF: 22', 'Apto 3  LAS GUASIMAS', 314, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12137, 'Indeterminado', 'GONZÁLEZ', '232');
INSERT INTO `trabajador` VALUES (1395, 4, 12, 39, 'DULCE MARÍA', 'DESCHAPELLES', '60091200879', '0', 'Negra', 'Medio Superior', '12mo Grado', 1981, 0, 0, 'Solt.', 'VELARDES 226 ALTOS', 'E/ PRIMELLES Y CHURRUCA', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12276, 'Indeterminado', 'BRUNE', '114');
INSERT INTO `trabajador` VALUES (1396, 4, 12, 39, 'YELAINE', 'SÁNCHEZ', '74010602296', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 1991, 0, 0, 'Div.', 'AVE 61 NO 7407', 'E/ 74 Y 76', 311, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12352, 'Indeterminado', 'HIDALGO', '39');
INSERT INTO `trabajador` VALUES (1397, 4, 12, 39, 'YUSIMIR DULCE', 'RODRÍGUEZ', '73121826211', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Solt.', ' HABANA #13', ' E/ PORVENIR Y MOISES MAESTRE APTO2', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12353, 'Indeterminado', 'RODRÍG', '33');
INSERT INTO `trabajador` VALUES (1398, 4, 13, 39, 'MABEL', 'CANCIO', '64121515390', '0', 'Mestiza', 'Superior', 'Lic. en Educación Espec. Lengua Rusa', 1985, 0, 0, 'Solt.', '1 RA NO 1034', 'E PEPE PRIETO Y MIRANDA', 308, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12368, 'Indeterminado', 'ROQUE', '262');
INSERT INTO `trabajador` VALUES (1399, 4, 12, 39, 'ROSA  ANABEL', 'DE PEDRO', '72102401833', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'CALLE 227 NO.20626', '206  Y 210 FONTANAR', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14380, 'Indeterminado', 'ALDERETE', '141');
INSERT INTO `trabajador` VALUES (1400, 1, 27, 22, 'TERESA DE LOS ANGELES', 'FLORES', '66102427196', '0', 'Mestiza', 'Superior', 'Lic. en Educación', 2007, 0, 0, 'Div.', 'CALLE 94 NO. 25507', '255 Y 257', 308, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 12528, 'Indeterminado', 'HUNGO', '254');
INSERT INTO `trabajador` VALUES (1401, 3, 12, 29, 'ANA ASTERIA.', 'CASTILLO', '61010713157', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1978, 0, 0, 'Solt.', 'CALLE 3ERA #11601', 'E/ PASAJE MARCHAL Y 6TA, FORTUNA', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 12535, 'Indeterminado', 'ARIAS', '115');
INSERT INTO `trabajador` VALUES (1402, 8, 12, 37, 'MARÍA  DEL CARMEN', 'CISNERO', '57050900114', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1978, 0, 0, 'Solt.', 'CORREA 11', 'E/ 10 DE OCTUBRE Y RABÍ SANTO SUAREZ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 12537, 'Indeterminado', 'HERNANDEZ', '3');
INSERT INTO `trabajador` VALUES (1403, 7, 12, 35, 'YAMILA', 'PLACERES', '74110303039', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1995, 0, 0, 'Solt.', 'DOLORES No.58', 'e/n DELICIAS  Y BUENAVENTURA    LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 12616, 'Indeterminado', 'VALDÉS', '125');
INSERT INTO `trabajador` VALUES (1404, 6, 12, 33, 'DAYANA', 'RIVAS', '78121206856', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1997, 0, 0, 'Solt.', 'FERNANDINA NO 61 B ALTO', 'E/ CADIZ Y STA ROSA', 310, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 12618, 'Indeterminado', 'RUÍZ', '1');
INSERT INTO `trabajador` VALUES (1405, 5, 12, 31, 'ZAHILY', 'ZUMETA', '82122106710', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2000, 0, 0, 'Cas.', 'TEJAR   # 10', 'E/ SAN LAZARO Y SAN ANASTACIO', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 12627, 'Indeterminado', 'CASTAIGNE', '26');
INSERT INTO `trabajador` VALUES (1406, 1, 52, 3, 'ERIC', 'MEJÍAS', '83062815828', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2005, 0, 0, 'Cas.', 'ESTELA Nº 26', 'CARLOS Y JUSTO PÁRRAGA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13389, 'Indeterminado', 'TRUJILLO', '222');
INSERT INTO `trabajador` VALUES (1407, 4, 34, NULL, 'ARMANDO LUIS', 'MARCHÁN', '55020629845', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comunicaciones', 1984, 0, 0, 'Cas.', 'ANITA No. 9  apto 3', '2da y PROGRESO. MANTILLA', 314, 'R22 1.09.2015', 'No incorporado', 2796, 'CUP', 'Cuadros', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13394, 'Indeterminado', 'BÁRCENAS', '265');
INSERT INTO `trabajador` VALUES (1408, 8, 73, 41, 'JORGE', 'GORT', '62082802400', '0', 'Blanca', 'Superior', 'Ing. en RadioComunicaciones', 1985, 0, 0, 'Solt.', 'CALLE VIA BLANCA NO.319', 'ENTRE DUREQUE Y SAN JULIO', 309, NULL, 'FE: Formación Especial', 1357, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13593, 'Indeterminado', 'CALVO', '38');
INSERT INTO `trabajador` VALUES (1409, 1, 64, 45, 'JORGE NILO.', 'VALDES', '63091906969', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Montaje y Rep. Equipos Ind.', 1988, 0, 0, 'Cas.', 'CALLE REYES NO.370', 'ENTRE', 309, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13595, 'Indeterminado', 'CHIROLDI', '27');
INSERT INTO `trabajador` VALUES (1410, 1, 49, 45, 'ANAY', 'JONES', '74081324510', '0', 'Negra', 'Medio Superior', '12mo Grado', 1993, 0, 0, 'Solt.', 'CALLE CARLOS III NO.909', 'ENTRE INFANTA Y CIPRE.', 303, 'R090 02.04.2012', 'Se evacua', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13602, 'Indeterminado', 'REED', '18');
INSERT INTO `trabajador` VALUES (1411, 1, 73, 50, 'YASNEIBY', 'CUMANÁ', '83100129416', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Comercio', 2002, 0, 0, 'Solt.', 'CALLE VIA BLANCA NO 275 ALTOS', 'ENTRE DUREGE Y SERRANO, SANTOS SUÁREZ', 309, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13615, 'Indeterminado', 'ALDAMA', '10');
INSERT INTO `trabajador` VALUES (1412, 1, 52, 50, 'LAZARO ANTONIO', 'SERRANO', '71082018288', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1990, 0, 0, 'Solt.', 'CALLE 313 NO 6610-A', 'E/ 66 y 68. EL GLOBO', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13622, 'Indeterminado', 'HERNANDEZ', '13');
INSERT INTO `trabajador` VALUES (1413, 4, 54, 4, 'JOSE', 'GARCIA', '49080900843', '0', 'Blanca', 'Sin Título', 'Ninguno', 0, 0, 0, 'Solt.', 'CALLE 160 NO.26907', 'ENTRE 267 Y 269', 313, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13625, 'Indeterminado', 'MARTINEZ.', '250');
INSERT INTO `trabajador` VALUES (1414, 3, 55, 4, 'JORGE', 'CALVO', '74081324405', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE GUANTANAMO NO', 'ENTRE GUASIMAL Y YUMURI', 314, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13631, 'Indeterminado', 'MICHEL', '244');
INSERT INTO `trabajador` VALUES (1415, 1, 54, 50, 'JAVIER', 'NOVELLE', '83021429781', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2002, 0, 0, 'Solt.', 'CALLE ZUZARTE NO.420', 'ENTRE CEPERO Y ARZOBISPO', 310, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13632, 'Indeterminado', 'VEGA', '25');
INSERT INTO `trabajador` VALUES (1416, 3, 54, 4, 'ALAIN', 'GARCIA', '70011300621', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Mant. Reparac. de Automovil', 1988, 0, 0, 'Solt.', 'CALLE AGRAMONTE  NO.D', 'ENTRE CALZADA DE BEJUCAL Y GÓMEZ', 314, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13637, 'Indeterminado', 'SALAS', '256');
INSERT INTO `trabajador` VALUES (1417, 3, 52, 4, 'CARLOS CERVILIO', 'PEDROSO', '54052400901', '0', 'Mestiza', 'Medio', '9no Grado', 2007, 0, 0, 'Solt.', 'CALLE 33 NO.157', ' ENTRE  2 Y 4', 302, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13638, 'Indeterminado', 'PRADO', '225');
INSERT INTO `trabajador` VALUES (1418, 7, 55, 4, 'OSCAR', 'GONZALEZ', '67030801720', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1988, 0, 0, 'Solt.', 'PEDRO NUEVO  No. 68', ' CALZADA DE MANAGUA Y CARMELA  MANTILLA', 314, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13643, 'Indeterminado', 'MENDEZ', '241');
INSERT INTO `trabajador` VALUES (1419, 3, 53, 4, 'ANA DOLORES', 'LARRAZABAL', '52040401731', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Maestro Primaria', 1986, 0, 0, 'Cas.', 'CALLE C NO.57', 'ENTRE AVENIDA 2DA Y ROSARIO.', 314, NULL, 'Se evacua', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13644, 'Indeterminado', 'CASTILLO', '191');
INSERT INTO `trabajador` VALUES (1420, 5, 53, 4, 'JOSE EMILIO', 'PERDOMO', '73070212303', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1996, 0, 0, 'Solt.', 'CALLE 26 NO.7110', 'ENTRE 71 Y 99', 315, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 13646, 'Indeterminado', 'DOMINGUEZ', '177');
INSERT INTO `trabajador` VALUES (1421, 8, 53, 4, 'FELIX MANUEL.', 'MONZON', '72041201902', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Eléctrico Indust.', 1991, 0, 0, 'Cas.', 'CALLE DOOIZ NO.223', 'ENTRE PRENSA Y PRIMELLES', 310, NULL, 'Asignado a UMR', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13651, 'Indeterminado', 'CAMPOS', '188');
INSERT INTO `trabajador` VALUES (1422, 8, 55, 4, 'JORGE ANTONIO', 'PEREZ', '59100910809', '0', 'Blanca', 'Sin Título', 'Ninguno', 0, 0, 0, 'Solt.', 'CALLE ENCARNACIÓN NO.152', 'ENTRE SAN BENIGNO Y FLORES.', 309, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13652, 'Indeterminado', 'ROMERO', '256');
INSERT INTO `trabajador` VALUES (1423, 6, 52, 4, 'RADEL', 'RODRIGUEZ', '68070311146', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 8VA NO.1317', 'ENTRE 5TA Y SAN FRANCISCO.', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 13667, 'Indeterminado', 'RICARDO', '242');
INSERT INTO `trabajador` VALUES (1424, 8, 55, 4, 'JUSTO MANUEL.', 'RAMIREZ', '51103101847', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1987, 0, 0, 'Solt.', 'PASAJE  INFANTA  No. 32', 'MAYIA  RODRIGUEZ  Y  GOICURIA  VIBORA', 309, NULL, 'Asignado a Unid. MTT', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13668, 'Indeterminado', 'CURIEL', '12');
INSERT INTO `trabajador` VALUES (1425, 7, 55, 4, 'FERMIN LAZARO.', 'NAPOLES', '60101114445', '0', 'Blanca', 'Medio', '9no Grado', 1979, 0, 0, 'Solt.', '8va    No. 193   APTO 4', 'B  Y   POCITO   LAWTON', 309, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13669, 'Indeterminado', 'GARCIA', '15');
INSERT INTO `trabajador` VALUES (1426, 4, 53, 4, 'ORLANDO', 'HERRERIA', '63112016380', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2006, 0, 0, 'Solt.', 'CALLE 198  NO 39709', 'ENTRE 397 Y 399 SANTIAGO D ELAS VEGAS', 313, 'R149 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13670, 'Indeterminado', 'RICARDO', '171');
INSERT INTO `trabajador` VALUES (1427, 4, 52, 4, 'JORGE', 'TRUJILLO', '71102911766', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 277 NO 13626', 'RIO VERDE', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13671, 'Indeterminado', 'GARCIA', '50');
INSERT INTO `trabajador` VALUES (1428, 7, 54, 4, 'EDUARDO', 'ROQUE', '64080512968', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Radio', 1993, 0, 0, 'Cas.', 'LUGAREÑO   No. 1', ' BOUZA Y LUGAREÑO   LAWTON', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13677, 'Indeterminado', 'RAVELO', '33');
INSERT INTO `trabajador` VALUES (1429, 7, 53, 4, 'RAMON', 'RODRIGUEZ', '65090400942', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1983, 0, 0, 'Cas.', 'AVE  OESTE  No.1183', 'e/n  COTILLA  Y  ALDABO    RPTO  ALDABO', 314, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13678, 'Indeterminado', 'MURIEDAS', '203');
INSERT INTO `trabajador` VALUES (1430, 1, 53, 3, 'JOSE ANTONIO.', 'ELEJALDE', '65051706767', '0', 'Negra', 'Medio', '9no Grado', 1979, 0, 0, 'Solt.', 'CALLE D NO 11168', 'ENTRE 7MA Y PASEO', 313, 'RO010 02.04.201', 'No incorporado', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13679, 'Indeterminado', 'FERRER', '174');
INSERT INTO `trabajador` VALUES (1431, 3, 54, 4, 'HERIBERTO GUSTAVO.', 'GONZALEZ', '60011611480', '0', 'Blanca', 'Medio', 'Oficio', 1979, 0, 0, 'Solt.', 'CALLE 22 NO.4  APTO 5', 'ENTRE CONCEPCIÓN Y BARAGUA.', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13688, 'Indeterminado', 'RODRIGUEZ', '7');
INSERT INTO `trabajador` VALUES (1432, 7, 52, 4, 'LUIS MIGUEL.', 'HERRERA', '55070800386', '0', 'Blanca', 'Medio', '9no Grado', 2006, 0, 0, 'Solt.', 'CONCEPCION  No. 272  apto 13', 'E/ MIGUEL BIONDI Y STA JULIA  MANTILLA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13693, 'Indeterminado', 'ESPINO', '259');
INSERT INTO `trabajador` VALUES (1433, 1, 7, 47, 'AURELIO', 'SERRANO', '62070127103', '0', 'Negra', 'Medio', '9no Grado', 1978, 0, 0, 'Solt.', 'CALLE PALMAR NO.12007', ' ENTRE RAMBLA Y AMERICA.', 310, NULL, 'FE: Formación Especial', 1014.9, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13694, 'Indeterminado', 'BONET', '224');
INSERT INTO `trabajador` VALUES (1434, 8, 55, 4, 'JESUS LUCIANO.', 'SANTANA', '59122430689', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Solt.', 'CALLE ZAPOTE NO.111    APTO 2', 'ENTRE   SAN BENITNO Y SAN INDALE', 309, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13698, 'Indeterminado', 'ARZOLA', '38');
INSERT INTO `trabajador` VALUES (1435, 4, 52, 4, 'GONZALO', 'GUTIERREZ', '76011803225', '0', 'Negra', 'Medio', '9no Grado', 1990, 0, 0, 'Solt.', 'CALLE  C  NO 83', 'ENTRE  AVE ROSARIO Y 2DA', 314, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13703, 'Indeterminado', 'ACOSTA', '262');
INSERT INTO `trabajador` VALUES (1436, 3, 52, 4, 'RAUL MODESTO.', 'CALDERON', '72060101860', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Electrónica', 2012, 0, 0, 'Solt.', 'CALLE 2DA NO.411', ' ENTRE PACO Y KESEL.', 314, NULL, 'Asignado a UMR', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13705, 'Indeterminado', 'DOMINGUEZ', '260');
INSERT INTO `trabajador` VALUES (1437, 1, 45, 45, 'OSCAR SILVESTRE.', 'NAVIA', '66123103082', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1992, 0, 0, 'Solt.', 'PARRAGA 227 APTO 11', 'SAN MARIANO Y VISTA ALEGRE VIBORA', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13720, 'Indeterminado', 'DIAZ', '1');
INSERT INTO `trabajador` VALUES (1438, 1, 52, 50, 'ANTONIO FRANCISCO.', 'RODRIGUEZ', '66090632946', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1984, 0, 0, 'Solt.', 'CALLE SAN RAFAEL NO.809    APTO 1', 'ENTRE OQUENDO Y SOLEDAD', 303, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13723, 'Indeterminado', 'RODRIGUEZ', '236');
INSERT INTO `trabajador` VALUES (1439, 4, 55, 4, 'OSVALDO', 'NOVO', '65120114920', '0', 'Blanca', 'Medio', '9no Grado', 1980, 0, 0, 'Solt.', 'CALLE 221  NO.23649', 'ENTRE 236 Y 246', 313, NULL, 'No incorporado', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13734, 'Indeterminado', 'YANES', '4');
INSERT INTO `trabajador` VALUES (1440, 4, 41, 43, 'DANIEL', 'IGLESIAS', '80052604202', '0', 'Blanca', 'Superior', 'Lic. en Educación', 2008, 0, 0, 'Cas.', 'CALLE PRINCIPE NO.162', 'ENTRE ESPADA Y SAN FRANCISCO.', 303, NULL, 'FE: Formación Especial', 2218, 'CUP', 'Servicios', 'Modulo 2', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 13741, 'Indeterminado', 'CARNERO', '342');
INSERT INTO `trabajador` VALUES (1441, 3, 55, 4, 'JORGE', 'ACOSTA', '80111521585', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2000, 0, 0, 'Solt.', 'CALLE QUINTANA NO.13206  APTO 2', 'ENTRE  6 Y 7', 313, NULL, 'Asignado a Unid. MTT', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 13744, 'Indeterminado', 'MARTINEZ', '26');
INSERT INTO `trabajador` VALUES (1442, 1, 73, 50, 'YOLANDA ANTOLINA', 'CALVO', '66090203056', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1992, 0, 0, 'Cas.', 'CALLE 4TA NO.4617  A-1', 'ENTRE CENTRAL Y MERCADO', 308, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13749, 'Indeterminado', 'MACIAS', '116');
INSERT INTO `trabajador` VALUES (1443, 7, 13, 35, 'GISELLE', 'GARCIA', '72030211318', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Máquinas Comp. Electrónica', 1991, 0, 0, 'Solt.', 'CALLE QUIROGA NO.217', 'E/ BLANQUIZAR Y REYES   LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13764, 'Indeterminado', 'MELLA', '258');
INSERT INTO `trabajador` VALUES (1444, 1, 73, 22, 'DULCE M.', 'ESCALANTE', '62042226274', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1989, 0, 0, 'Cas.', 'CALLE 3ra #9810', 'E/ 4ta y 6ta rpto azotea', 307, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13790, 'Indeterminado', 'LOPEZ', '13');
INSERT INTO `trabajador` VALUES (1445, 8, 33, 17, 'ELADIO RAMON', 'IGLESIAS', '47111428063', '0', 'Blanca', 'Superior', 'Lic. en Física', 1978, 0, 0, 'Cas.', 'CALLE SAN PABLO NO 419  HAB-8', 'ENTRE MARIANO Y CLAVEL', 310, 'R157 01.09.2012', 'No incorporado', 2903, 'CUP', 'Cuadros', 'Modulo 1', 'Lic.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13825, 'Indeterminado', 'MÁRTINEZ', '185');
INSERT INTO `trabajador` VALUES (1446, 7, 38, 41, 'ERNESTO JOSÉ', 'SOTO', '59100613106', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1979, 0, 0, 'Solt.', 'CALLE 4  1/2   APTO -1    NO.504', 'E/ 22 Y 23', 302, NULL, 'FE: Formación Especial', 2621, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13829, 'Indeterminado', 'GONZÁLEZ', '333');
INSERT INTO `trabajador` VALUES (1447, 7, 53, 46, 'DONEL', 'ALDANA', '83022429441', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Montaje y Rep. Equipos Ind.', 2002, 0, 0, 'Solt.', 'CALLE D No. 69  apto 2', 'A y RADILLO       LAWTON', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 13857, 'Indeterminado', 'BORRAYO', '37');
INSERT INTO `trabajador` VALUES (1448, 8, 54, 46, 'DANIEL ENRIQUE', 'MÁRTINEZ', '65022702582', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2003, 0, 0, 'Solt.', 'CALLE LACRET NO.462 APTO 10', 'DESTRAMPES Y JUAN DELGADO', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 13858, 'Indeterminado', 'PAYÁN', '3');
INSERT INTO `trabajador` VALUES (1449, 1, 62, 27, 'IRENE DELIA', 'CASTILLO', '63072831333', '0', 'Negra', 'Medio Superior', '12mo Grado', 1983, 0, 0, 'Solt.', 'CALLE HOLGUIN EDF 5 NO.S/N', 'E/ LOURDES Y ALEGRIA', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13900, 'Indeterminado', 'HEREDIA', '26');
INSERT INTO `trabajador` VALUES (1450, 1, 27, 20, 'ADOLFO', 'VALDES', '61031613964', '0', 'Mestiza', 'Superior', 'Lic. en Economía', 1992, 0, 0, 'Solt.', 'LEALTAD  NO 766 ALTOS', 'ENTRE MALOJA Y SITIOS', 303, NULL, 'Asignado a Unid. MTT', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13930, 'Indeterminado', 'RODRIGUEZ', '244');
INSERT INTO `trabajador` VALUES (1451, 1, 62, 27, 'DANAYSI', 'PRADO', '88102240336', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2007, 0, 0, 'Solt.', 'ZANJA REAL NO 1', 'ENTRE PEÑON', 310, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 13951, 'Indeterminado', 'CALDERON', '3');
INSERT INTO `trabajador` VALUES (1452, 1, 35, 19, 'AYME TERESA', 'GONZALEZ', '71061829836', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2003, 0, 0, 'Solt.', 'SAN RAFAEL # 123A', 'ESPERANZA Y POCITO RPTO MANAGUA', 314, 'R09 02.04.2012', 'No incorporado', 3004, 'CUP', 'Cuadros', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14043, 'Indeterminado', 'HERNANDEZ', '90');
INSERT INTO `trabajador` VALUES (1453, 4, 38, 19, 'ALINA MARIA', 'VALLADARES', '66092300139', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 1987, 0, 0, 'Solt.', 'CALLE 16 NO.1506', '15 Y 17', 2401, NULL, 'Se evacua', 2621, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14049, 'Indeterminado', 'SOLARES', '349');
INSERT INTO `trabajador` VALUES (1454, 8, 54, 46, 'ORLANDO ALBERTO', ' DE LA TORRE', '64081520207', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Cas.', '4 NO.870', '35 Y 37.', 302, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14143, 'Indeterminado', 'HIDALGO', '246');
INSERT INTO `trabajador` VALUES (1455, 8, 53, 46, 'ORESTES', 'IZQUIERDO', '67110919449', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'SAN MARIANO NO.339', 'CORTINAS Y JUAN BRUNO ZAYAS', 309, NULL, 'Asignado a UMR', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14166, 'Indeterminado', 'MENENDEZ', '192');
INSERT INTO `trabajador` VALUES (1456, 8, 52, 46, 'JOEL', 'GOVIN', '71101301887', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Dibujo Mecánico', 1990, 0, 0, 'Div.', 'JOSE ANTONIO SACO No 426 APTO 1', 'CARMEN Y VISTA ALEGRE', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14170, 'Indeterminado', 'GONZALEZ', '257');
INSERT INTO `trabajador` VALUES (1457, 1, 52, 3, 'JUAN ELVIS', 'RODRIGUEZ', '59071109802', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Cas.', 'MARTINEZ NO.470', ' A Y POCITO', 309, NULL, 'No incorporado', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14172, 'Indeterminado', 'GUILARTE', '227');
INSERT INTO `trabajador` VALUES (1458, 8, 52, 46, 'EDUARDO', 'SERRANO', '71033117441', '0', 'Blanca', 'Medio', '9no Grado', 1986, 0, 0, 'Cas.', 'RABI NO.552', ' SANTA IRENE Y SAN BERNANDINO.', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14175, 'Indeterminado', 'RAMBLA', '267');
INSERT INTO `trabajador` VALUES (1459, 7, 12, 35, 'LISBET', 'LEAL', '88020740197', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2007, 0, 0, 'Solt.', 'ENNA  NO.  310    APTO 28', 'LUCO  Y  JUSTICIA      LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14187, 'Indeterminado', 'LAY', '19');
INSERT INTO `trabajador` VALUES (1460, 7, 42, 35, 'ANA CECILIA', 'BARCIELA', '88041410294', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2004, 0, 0, 'Solt.', 'B   No  774', '29    y    ZAPATA      VEDADO', 302, NULL, 'FE: Formación Especial', 2036, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14190, 'Indeterminado', 'BOEHME', '145');
INSERT INTO `trabajador` VALUES (1461, 1, 27, 19, 'VICTORIA', 'LIBERA', '61042907059', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones', 1984, 0, 0, 'Solt.', 'ARTOLA #87', 'E/ SANTA ISABEL Y SAN ROMÓN, JACOMINO', 308, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14193, 'Indeterminado', 'GARCÍA', '33');
INSERT INTO `trabajador` VALUES (1462, 8, 31, 24, 'RICARDO', 'PÉREZ', '69120529383', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1995, 0, 0, 'Cas.', 'AVENIDA 99 EDIF.9 APTO. C-10', 'E/CARRETERA ALBERRO, REPARTO ALBERRO', 315, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14195, 'Indeterminado', 'ORTEGA', '31');
INSERT INTO `trabajador` VALUES (1463, 1, 35, 42, 'BORIS LUIS', 'GÓMEZ', '72032331465', '0', 'Blanca', 'Superior', 'Ing. en RadioComunicaciones', 1994, 0, 0, 'Solt.', 'EDIFICIO C #24 APTO 25', 'ZONA 6 ALAMAR HABANA DEL ESTE', 306, 'R015 01.10.2015', 'BPD Centro de Trabajo', 3004, 'CUP', 'Cuadros', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14196, 'Indeterminado', 'GÁLVEZ', '13');
INSERT INTO `trabajador` VALUES (1464, 8, 3, 24, 'AIDA LUISA', 'SEGURA', '61100500595', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1987, 0, 0, 'Solt.', 'PÉREZ  # 363 APTO.5', 'E/FABRICA Y REFORMA LUYANÓ 10 DE OCTUBRE', 309, NULL, 'FE: Formación Especial', 739, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14199, 'Indeterminado', 'BEATÓN', '25');
INSERT INTO `trabajador` VALUES (1465, 8, 12, 37, 'ELAINE', 'ANTOMACHI', '43021100791', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Planificación', 1984, 0, 0, 'Solt.', 'SAN MARIANO # 154 APTO. 8', 'E/SACOS Y HEREDIA RPTO.STOS.SUÁREZ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14204, 'Indeterminado', 'SEMANAT', '155');
INSERT INTO `trabajador` VALUES (1466, 7, 12, 35, 'TAYMI', 'RABASSA', '73010109590', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1990, 0, 0, 'Solt.', 'FONTS    No.100', 'BEALES   Y   PASAJE CORDOBA   LAWTON', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14205, 'Indeterminado', 'VÁZQUEZ', '10');
INSERT INTO `trabajador` VALUES (1467, 8, 12, 37, 'LEONOR TERESA', 'GONZÁLEZ', '63070115113', '0', 'Blanca', 'Medio', '9no Grado', 1977, 0, 0, 'Solt.', 'D\'STRAMPES # 63 APTO.6', 'E/LUÍS ESTÉVEZ Y LACRET RPTO.STOS.SUÁREZ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14206, 'Indeterminado', 'RIOS', '10');
INSERT INTO `trabajador` VALUES (1468, 7, 12, 35, 'LEONOR  BEATRIZ', 'BATISTA', '64082213552', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Planificación', 1985, 0, 0, 'Cas.', 'ATARES  NO. 419', 'RODRIGUEZ   Y   MUNICIPIO      LUYANO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14207, 'Indeterminado', 'CASTAÑEDA', '18');
INSERT INTO `trabajador` VALUES (1469, 8, 12, 37, 'AILIN DE LA CARIDAD', 'PEROVANI', '87061809210', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2006, 0, 0, 'Solt.', 'VELARDE # 262 APTO.10', 'E/PRENSA Y PRIMELLES CERRO', 310, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14209, 'Indeterminado', 'DANGER', '124');
INSERT INTO `trabajador` VALUES (1470, 8, 12, 37, 'JULIA', 'BORDAS', '73030701370', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Química Analítica', 1991, 0, 0, 'Solt.', 'O\'FARRILL #564 APTO.2', 'E/MAYIARODRIGUEZYGOSS STOS.SUÁREZ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14212, 'Indeterminado', 'PIEDRA', '19');
INSERT INTO `trabajador` VALUES (1471, 7, 38, 19, 'DEBORAH', 'MUSTELIER', '68091900293', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 2005, 0, 0, 'Cas.', 'LUZ  ESTE  No 316', 'A    y   RADILLO        LAWTON', 309, NULL, 'FE: Formación Especial', 2621, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14214, 'Indeterminado', 'GARCÍA', '6');
INSERT INTO `trabajador` VALUES (1472, 8, 73, 19, 'YULEYDIS', 'PÉREZ', '80020505236', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Termoenergética', 1999, 0, 0, 'Cas.', 'CARMEN 6 APTO 6', 'E/10 DE OCTUBRE Y SAN LÁZARO LAWTON', 309, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14217, 'Indeterminado', 'GONZÁLEZ', '119');
INSERT INTO `trabajador` VALUES (1473, 7, 12, 35, 'MIDALAY', 'HERNANDEZ', '72031313595', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Cas.', 'CALLE  C   NO. 567', 'ENTRE  16  Y  17      LAWTON', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14219, 'Indeterminado', 'HERRERA', '11');
INSERT INTO `trabajador` VALUES (1474, 6, 73, 9, 'MAYELIN', 'CALDERÓN', '72030310992', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Conformación de Metales', 1991, 0, 0, 'Solt.', 'BUENASUERTE #71 ALTOS', 'E/PROSPERIDAD Y SAN MIGUEL DEL PADRÓN', 308, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14220, 'Indeterminado', 'FERRO', '122');
INSERT INTO `trabajador` VALUES (1475, 8, 12, 37, 'ROSALINA SANTIAGO', 'CHACÓN', '61072514179', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1980, 0, 0, 'Cas.', '8VA #1146 APTO.1', 'E/QUINTANA Y LAS PALMAS ALDABÓ', 313, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14221, 'Indeterminado', 'CASAL', '49');
INSERT INTO `trabajador` VALUES (1476, 8, 12, 37, 'ZENAIDA  RAMONA', 'ARAGÓN', '82092907614', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2002, 0, 0, 'Solt.', 'ENNA #317', 'E/JUSTICIA Y LUCO LUYANÓ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14222, 'Indeterminado', 'MUÑOZ', '50');
INSERT INTO `trabajador` VALUES (1477, 7, 12, 35, 'AYMARA DE LA CARIDAD', 'PEROVANI', '87061809294', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2006, 0, 0, 'Cas.', 'BELARDE  No 262   apto 10', 'PRENSA   Y   PRIMELLES     LAS CAÑAS', 310, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14224, 'Indeterminado', 'DANGER', '122');
INSERT INTO `trabajador` VALUES (1478, 1, 63, 27, 'NORMA', 'ARGUELLES', '49032200532', '0', 'Blanca', 'Medio', '9no Grado', 1966, 0, 0, 'Cas.', 'PASAJE CUMBRE NO.62', 'ENTRE/ 13 Y 14 REPARTO LAWTON', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14225, 'Indeterminado', 'SUÁREZ', '16');
INSERT INTO `trabajador` VALUES (1479, 8, 73, 16, 'IRINA MARÍA', 'GONZÁLEZ', '71122711576', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Solt.', 'RODRÍGUEZ NO. 171', 'ENTRE FLORES Y SAN BENIGNO SANTOS SUÁREZ', 309, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14226, 'Indeterminado', 'RODRÍGUEZ', '36');
INSERT INTO `trabajador` VALUES (1480, 8, 37, 41, 'FRANCO HUMBERTO', 'FONSECA', '66040907260', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Cas.', 'LACRET #509', 'ENTRE JUAN DELGADO Y GOICURÍA, SANTOS SU', 309, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14228, 'Indeterminado', 'MUÑOZ', '210');
INSERT INTO `trabajador` VALUES (1481, 8, 54, 46, 'RAFAEL', 'RAMIREZ', '71092302265', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Solt.', 'VENTO OESTE NO.18 APTO 6', 'E/ VENTO A Y VENTO D, SANTA CATALINA', 310, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14230, 'Indeterminado', 'ROCHA', '254');
INSERT INTO `trabajador` VALUES (1482, 3, 73, 41, 'MAHELIS', 'PEÑA', '63020912997', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Explotación Transporte Ferr', 1985, 0, 0, 'Cas.', '93 #3818', 'E/ 38 Y 40, SANTA CLARA', 315, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14232, 'Indeterminado', 'QUINTANA', '23');
INSERT INTO `trabajador` VALUES (1483, 1, 62, 27, 'ANA MARÍA', 'CEPERO', '60102300471', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1979, 0, 0, 'Cas.', '10 DE OCTUBRE #653 APTO 6', 'E/ MANGOS Y QUIROGA, SANTOS SUÁREZ', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14233, 'Indeterminado', 'SAN EMETERIO', '13');
INSERT INTO `trabajador` VALUES (1484, 8, 52, 46, 'VLADIMIR', 'ROJO', '64052211407', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1983, 0, 0, 'Solt.', 'ALFREDO ZAYAS 19-A', 'SAN CARLOS Y STA EULALIA, SANTOS SUÁREZ', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14236, 'Indeterminado', 'ESPINOSA', '21');
INSERT INTO `trabajador` VALUES (1485, 8, 52, 46, 'ANYER', 'CÁRDENAS', '78021607483', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Comunic. Teleg. y Tx. Datos', 1999, 0, 0, 'Solt.', 'AVE. ACOSTA #463 APTO B', 'E/ JUAN DELGADO Y GOICURÍA, SEVILLANO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14237, 'Indeterminado', 'RODRÍGUEZ', '2');
INSERT INTO `trabajador` VALUES (1486, 8, 54, 46, 'ROMMEL DE JESÚS', 'CASTELLANOS', '64070301666', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Laminación', 1982, 0, 0, 'Cas.', 'FELIPE POEY #565 APTO 1', 'E/ ACOSTA Y O¨FARRILL, VÍBORA', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14238, 'Indeterminado', 'ÁLVAREZ', '267');
INSERT INTO `trabajador` VALUES (1487, 8, 52, 46, 'LÁZARO REINEIRO', 'VALDÉS', '61061710982', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Eléctrico Indust.', 1982, 0, 0, 'Cas.', 'CERVANTE #80 APTO 5', 'E/ GOICURÍA Y D´STRAMPES, SEVILLANO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14239, 'Indeterminado', 'DULZAIDE', '246');
INSERT INTO `trabajador` VALUES (1488, 7, 52, 46, 'JOSE DE LA  LUZ', 'CHIBAS', '47121402027', '0', 'Negra', 'Sin Título', 'Ninguno', 0, 0, 0, 'Solt.', 'VELAZQUEZ  No. 4807   apto 3', 'GARRIDO     Y   E      RPTO CAROLINA', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14243, 'Indeterminado', 'FAURE', '2');
INSERT INTO `trabajador` VALUES (1489, 7, 52, 46, 'NELSON', 'YADRÓ', '70112910844', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'ARELLANO  No. 282', 'C  Y   D         LAWTON', 309, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14244, 'Indeterminado', 'FIGUEROA', '256');
INSERT INTO `trabajador` VALUES (1490, 8, 52, 46, 'JESUS ENRIQUE', 'RUBIÑO', '65063011801', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2000, 0, 0, 'Cas.', 'B #213', 'E/ 9 Y 10, LAWTON', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14245, 'Indeterminado', 'BOSCH', '242');
INSERT INTO `trabajador` VALUES (1491, 7, 54, 46, 'LÁZARO JUAN', 'CARTAYA', '70082912946', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1990, 0, 0, 'Viud.', 'PORVENIR  No. 105', 'BOUZA  Y  AGUILERA       LAWTON', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14246, 'Indeterminado', 'FUENTES', '246');
INSERT INTO `trabajador` VALUES (1492, 8, 40, 43, 'ALFREDO', 'RODRIGUEZ', '71021702044', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2001, 0, 0, 'Cas.', 'MILAGROS #310 APTO 2', 'E/ CORTINA Y JUAN BRUNO ZAYAS, STOS SUÁR', 309, NULL, 'FE: Formación Especial', 2419, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14247, 'Indeterminado', 'ARMAS', '7');
INSERT INTO `trabajador` VALUES (1493, 8, 52, 46, 'LÁZARO  JOEL', 'HERNANDEZ', '71121729445', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Mecánica de Taller', 1990, 0, 0, 'Cas.', '152 # 6921 APTO 6', '69 Y 71 LA LISA', 312, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14248, 'Indeterminado', 'CASANOVA', '230');
INSERT INTO `trabajador` VALUES (1494, 8, 52, 46, 'IVÁN BÁRBARO', 'NUÑEZ', '72022231265', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1995, 0, 0, 'Solt.', 'ALTURA DE MONTEJO # 503', 'E/ GUASIMA Y GERONA LA LIRA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14249, 'Indeterminado', 'DIAZ', '36');
INSERT INTO `trabajador` VALUES (1495, 8, 54, 46, 'MANUEL FRANCISCO', 'SAAVEDRA', '69072314602', '0', 'Blanca', 'Medio', '9no Grado', 1984, 0, 0, 'Cas.', '3RA #1304-06 APTO 22', 'E/ ENTRADA Y LINDERO, CASINO DEPORTIVO', 310, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14250, 'Indeterminado', 'PÉREZ', '6');
INSERT INTO `trabajador` VALUES (1496, 7, 52, 46, 'REINALDO DANIEL', 'ATANES', '72122600368', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Div.', 'ALVARADO  No. 324', 'MIGUEL  Y  LINDERO    RPTO  STA  AMALIA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14251, 'Indeterminado', 'HERNANDEZ', '267');
INSERT INTO `trabajador` VALUES (1497, 8, 54, 46, 'ALEJANDRO', 'GIGATO', '67102012241', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Viales', 1985, 0, 0, 'Solt.', 'MASÓ # 332 APTO 2', 'E/ GRAL AGUIRRE Y GRAL SUÁREZ', 310, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14252, 'Indeterminado', 'LAGOA', '266');
INSERT INTO `trabajador` VALUES (1498, 7, 52, 46, 'HÉCTOR', 'CORRIPIO', '66090901028', '0', 'Blanca', 'Medio', '9no Grado', 1983, 0, 0, 'Cas.', 'DREEM  No.566', 'JUAN ALONSO  Y TERESA BLANCO  LUYANO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14254, 'Indeterminado', 'GARCÍA', '20');
INSERT INTO `trabajador` VALUES (1499, 7, 52, 46, 'JULIO', 'PÉREZ', '65091013324', '0', 'Mestiza', 'Medio', '9no Grado', 1981, 0, 0, 'Cas.', 'LUIS  ESTEVEZ  No 373', 'CORTINA  Y  FIGUEROA   SANTOS  SUAREZ', 309, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14255, 'Indeterminado', 'ALVAREZ', '13');
INSERT INTO `trabajador` VALUES (1500, 8, 54, 46, 'PEDRO', 'GARCIA', '61051901303', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1982, 0, 0, 'Cas.', ' SAN MIGUEL #269 APTO 10', 'E/ JORGE Y D´ESTRAMPE', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14258, 'Indeterminado', 'LINARES', '254');
INSERT INTO `trabajador` VALUES (1501, 7, 54, 46, 'ADRIAN', 'RODRIGUEZ', '67100519962', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Solt.', 'E  No.60   INTERIOR', 'A  Y   RADILLO      LAWTON', 309, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14262, 'Indeterminado', 'DE ARMAS', '13');
INSERT INTO `trabajador` VALUES (1502, 7, 52, 46, 'ABELARDO', 'REYES', '66102803203', '0', 'Mestiza', 'Medio', '9no Grado', 1987, 0, 0, 'Solt.', 'SANTA  BARBARA  No.9008  apto  C', '2da  y  5ta       LUYANO  MODERNO', 308, NULL, 'Asignado a UMR', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14263, 'Indeterminado', 'PARDO', '9');
INSERT INTO `trabajador` VALUES (1503, 8, 54, 4, 'ALBERTO LUIS', 'CID', '61103101366', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1979, 0, 0, 'Cas.', 'VISTA ALEGRE #361', 'E/ CORTINA Y FIGUEROA, VIBORA', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14264, 'Indeterminado', 'GOYA', '266');
INSERT INTO `trabajador` VALUES (1504, 1, 62, 27, 'JOSEFINA', 'HERNANDEZ', '51031900232', '0', 'Negra', 'Medio', '9no Grado', 1982, 0, 0, 'Solt.', ' VIA BLANCA # 365 APTO 1', 'E/ PAZ Y SAN JULIO, SANTOS SÚAREZ', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14267, 'Indeterminado', 'FERNANDEZ', '22');
INSERT INTO `trabajador` VALUES (1505, 8, 43, 24, 'MARIBEL', 'MORENO', '69011311455', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'LUIS ESTÉVEZ #318', 'E/ CORTINA Y JUAN BRUNO ZAYAS, STOS SUÁR', 309, NULL, 'No incorporado', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14270, 'Indeterminado', 'MENENDEZ', '294');
INSERT INTO `trabajador` VALUES (1506, 8, 52, 46, 'EDUARDO', 'ALBERTO', '72080910823', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1990, 0, 0, 'Cas.', 'FIGUEROA 102 APTO C', 'E/ LUIS ESTEVES Y ESTRADA PALMA', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14272, 'Indeterminado', 'HERNANDEZ', '37');
INSERT INTO `trabajador` VALUES (1507, 7, 53, 46, 'WALTER RUBEN', 'RUIZ', '64010526523', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Química Inorgánica', 1992, 0, 0, 'Cas.', 'LUZ  No.316', 'A  Y   RADILLO      LAWTON', 309, NULL, 'Asignado a Unid. MTT', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14285, 'Indeterminado', 'RUIZ', '0');
INSERT INTO `trabajador` VALUES (1508, 7, 55, 46, 'MIGUEL', 'DOMINGUEZ', '46060725640', '0', 'Blanca', 'Medio', '9no Grado', 1965, 0, 0, 'Solt.', 'HIDALGO  No. 602  piso 9  apto  J', 'COLON  Y   SAN  PEDRO   NUEVO  VEDADO', 302, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14289, 'Indeterminado', 'ALFONSO', '24');
INSERT INTO `trabajador` VALUES (1509, 7, 52, 46, 'GABRIEL', 'ECHEVARRIA', '69012411020', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Solt.', 'SAN QUINTIN  No.369', 'e/ SAN JULIO Y MAGNOLIA  EL CANAL', 310, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14290, 'Indeterminado', 'RUIZ', '33');
INSERT INTO `trabajador` VALUES (1510, 6, 55, 46, 'RAFAEL', 'GUTIERREZ', '56062003343', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1976, 0, 0, 'Solt.', 'CALLE 5TA # 17036 APTO 11', 'E/ A Y B, ALTHABANA', 313, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14291, 'Indeterminado', 'HERNANDEZ', '253');
INSERT INTO `trabajador` VALUES (1511, 7, 54, 46, 'JESÚS', 'REUS', '65053118520', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1985, 0, 0, 'Cas.', 'AVE  ACOSTA  No. 571', 'MAYIA  RODRIGUEZ   Y  GOSS     VIBORA', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14292, 'Indeterminado', 'HERNANDEZ', '22');
INSERT INTO `trabajador` VALUES (1512, 1, 73, 43, 'MARITZA  ESTHER', 'FONSECA', '67122902458', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1990, 0, 0, 'Cas.', 'ARANGUREN #10404', 'E/ 3RA Y 5TA, CASINO DEPORTIVO', 310, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14294, 'Indeterminado', 'GARCÍA', '49');
INSERT INTO `trabajador` VALUES (1513, 1, 2, 27, 'ILEANA VICTORIA', 'GONZÁLEZ', '64121118758', '0', 'Mestiza', 'Medio', '9no Grado', 1979, 0, 0, 'Cas.', 'CALLE H No. 10823', 'E/  2da.  y  3ra.', 313, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14295, 'Indeterminado', 'RODRIGUEZ', '29');
INSERT INTO `trabajador` VALUES (1514, 1, 62, 27, 'LIBERTAD', 'GONZÁLEZ', '60052008476', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'ROSITA #14067 APTO 27 4TO PISO', 'E/ PUENTE Y LILILOY, LOS PINOS', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14296, 'Indeterminado', 'BLANCO', '1');
INSERT INTO `trabajador` VALUES (1515, 1, 63, 27, 'YUSMARA', 'GONZÁLEZ', '74010801557', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2005, 0, 0, 'Cas.', 'BALEAR #17136', 'E/ CALZADA DE GUANABACOA Y 8VA, VIRGEN D', 308, NULL, 'Se evacua', 1095, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14297, 'Indeterminado', 'ÁLVAREZ', '11');
INSERT INTO `trabajador` VALUES (1516, 1, 62, 27, 'LISARYS', 'PHILLIPS', '75110409957', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Cas.', 'LUZ CABALLERO #420', 'E/ CARMEN Y VISTA ALEGRE', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14303, 'Indeterminado', 'ROBINSON', '5');
INSERT INTO `trabajador` VALUES (1517, 1, 62, 27, 'MARÍA ANTONIA', 'ARGUELLES', '56042601757', '0', 'Negra', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Cas.', 'AVE 107 EDIF. 1 APTO 23', 'SIERRA MAESTRA', 313, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14308, 'Indeterminado', 'DE LA NUEZ', '348');
INSERT INTO `trabajador` VALUES (1518, 7, 12, 35, 'DIANELYS', 'PROENZA', '83021306412', '0', 'Blanca', 'Superior', 'Ing. Industrial', 2002, 0, 0, 'Solt.', 'CALZADA  DE  MANAGUA   No. 66', 'LIRA   Y  CORTES        LA  LIRA', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14309, 'Indeterminado', 'LAFFITTE', '116');
INSERT INTO `trabajador` VALUES (1519, 8, 53, 46, 'EDUARDO', 'COSCA', '61052902001', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', 'CALLE CENTRAL# 260', '/ SOTO Y LUZ FRIO. LA FERNANDA', 308, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14312, 'Indeterminado', 'DOMÍNGUEZ', '172');
INSERT INTO `trabajador` VALUES (1520, 5, 39, 19, 'GEIDY', 'HERNANDEZ', '72050527917', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Cas.', 'CALLE 217 # 9904 A', '1RA Y CRUZ VERDE. CRUZ VERDE', 315, 'RO15 02.04.2012', 'FE: Formación Especial', 2419, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14313, 'Indeterminado', 'SAURA', '254');
INSERT INTO `trabajador` VALUES (1521, 5, 27, 19, 'ELENA', 'MONTES DE OCA', '73100712295', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones', 2009, 0, 0, 'Solt.', 'CALLE B # 10414', '/ PINO Y MARIA LUISA. TEJAS', 308, NULL, 'No incorporado', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Cotorro: Ave.101# 1623 / 16 y 18', 14314, 'Indeterminado', 'CANOURA', '4');
INSERT INTO `trabajador` VALUES (1522, 1, 14, 51, 'DEISY AYME', 'GONZÁLEZ', '72041203297', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'CALLE 38 # 9507 A', 'e/ 95 Y 97 RPTO LA GRANADA', 315, NULL, 'Se evacua', 739, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Arroyo Naranjo: Alvarado No. 8 e/ Santa Amalia y Miguel', 14315, 'Indeterminado', 'ESTEL', '131');
INSERT INTO `trabajador` VALUES (1523, 5, 73, 7, 'KENIA', 'LEÓN', '75062825116', '0', 'Blanca', 'Superior', 'Lic. en Educación Espec. Informática', 2012, 0, 0, 'Cas.', 'CALLE 16 # 11705', '/ 1RA Y 3RA. PARAISO', 315, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Cotorro: Calle 101 #1623 / 14 y16', 14316, 'Indeterminado', 'GUZMAN', '20');
INSERT INTO `trabajador` VALUES (1524, 5, 73, 41, 'YUDITH', 'PEDRET', '70111314011', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1991, 0, 0, 'Solt.', 'EDIFICIO C # 16 APTO C-7', 'ALBERRO', 315, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14319, 'Indeterminado', 'CASANOVA', '1');
INSERT INTO `trabajador` VALUES (1525, 6, 12, 33, 'SONIA', 'PEREZ', '66070902119', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1985, 0, 0, 'Solt.', 'PLAYITA Y 24 ALBERGUE NAVE 15 CUB.13', '6TO CONGRESO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14321, 'Indeterminado', 'CALDERÓN', '138');
INSERT INTO `trabajador` VALUES (1526, 6, 12, 33, 'SANDRA', 'RODRIGUEZ', '71010111117', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1991, 0, 0, 'Solt.', 'CALLE ALBERTO ALVAREZ # 65', '/ REINALDO CRUZ Y LEONARDO VALDES. REGLA', 305, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14322, 'Indeterminado', 'ESCALONA', '139');
INSERT INTO `trabajador` VALUES (1527, 5, 12, 31, 'LIANA ELVIRA', 'ACOSTA', '49113007934', '0', 'Blanca', 'Medio', '9no Grado', 1967, 0, 0, 'Cas.', 'AVE. 101 # 22809', '/ 219 Y 220. CRUZ  VERDE', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14327, 'Indeterminado', 'ALAS', '147');
INSERT INTO `trabajador` VALUES (1528, 5, 12, 31, 'TANIA', 'ALMEIDA', '72033010779', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1996, 0, 0, 'Cas.', 'CALLE 91 # 4612', '/ 46 Y 48. LOTERIA', 315, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14328, 'Indeterminado', 'CARDO', '9');
INSERT INTO `trabajador` VALUES (1529, 5, 74, 41, 'ALIDA', 'GONZÁLEZ', '70042828199', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1989, 0, 0, 'Cas.', 'CALLE 97A # 5404', '/ 54 Y 56. LOTERIA', 315, 'R051 02.04.2012', 'FE: Formación Especial', 1452, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 14329, 'Indeterminado', 'RODRÍGUEZ', '178');
INSERT INTO `trabajador` VALUES (1530, 6, 52, 46, 'ERNESTO ANTONIO', 'NÁPOLES', '72061411006', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema de Radio', 1991, 0, 0, 'Solt.', 'CALLE CZDA SAN MIGUEL DEL PADRÓN # 9813', '/ 6TA Y VISTA HERMOSA. LUYANO MODERNO', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14332, 'Indeterminado', 'MACHADO', '236');
INSERT INTO `trabajador` VALUES (1531, 6, 52, 46, 'ALFREDO', 'TORRES', '66020426529', '0', 'Negra', 'Medio Superior', '12mo Grado', 1984, 0, 0, 'Solt.', 'BELTRAN # 20709', '/ CZDA GUINES Y SAN ANTONIO. JACOMINO', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14335, 'Indeterminado', 'BARROSO', '5');
INSERT INTO `trabajador` VALUES (1532, 6, 52, 46, 'JUAN ANTONIO', 'VERDECIA', '61100523789', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Zootécnia', 1980, 0, 0, 'Solt.', 'CALLE H # 18346 ALTOS', '/ 1RA Y 2DA. MONTERREY', 308, NULL, 'Asignado a UMR', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14337, 'Indeterminado', 'GINARTE', '255');
INSERT INTO `trabajador` VALUES (1533, 6, 54, 46, 'JENRRY AURELIO', 'BENÍTEZ', '83090329801', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2003, 0, 0, 'Solt.', '1ERA # 20503 APTO 11', 'E/ ROSARIO Y SAN ANTONIO rPTO CAROLINA', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14338, 'Indeterminado', 'PÉREZ', '50');
INSERT INTO `trabajador` VALUES (1534, 5, 52, 46, 'JULIO ASMEL', 'MARQUEZ', '72102310749', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1990, 0, 0, 'Cas.', 'CALLE 99 #5001', 'E/50 y 50A  LOTERÍA', 315, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14339, 'Indeterminado', 'BETANCOURT', '35');
INSERT INTO `trabajador` VALUES (1535, 5, 52, 46, 'OMAR', 'RAVELO', '69112329567', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Mant. Reparac. de Automovil', 1988, 0, 0, 'Cas.', 'CALLE 99  #3420', '/ 34 y 36  DELICIAS', 315, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14340, 'Indeterminado', 'DÍAZ', '242');
INSERT INTO `trabajador` VALUES (1536, 1, 62, 27, 'ELSA CELIA', 'LEMUS', '68052629436', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Solt.', 'CDA. DE GUINES KM 11 1/2 # 10407', '/ 104 Y 112. LA ROSITA', 308, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14342, 'Indeterminado', 'ALONSO', '344');
INSERT INTO `trabajador` VALUES (1537, 6, 54, 46, 'FIDEL', 'TAMAYO', '67022307267', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1985, 0, 0, 'Solt.', 'GABRIEL NO 1822 APTO 7', 'E/STA CECILIA Y STA FRANCISCA RPTO ROSAL', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14343, 'Indeterminado', 'AVILES', '46');
INSERT INTO `trabajador` VALUES (1538, 6, 53, 46, 'LLANOTSY', 'RODRÍGUEZ', '70041326403', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1988, 0, 0, 'Solt.', 'CALLE 255 # 9020', '/ 90 Y 94. LA CUMBRE', 308, 'RO36 01.05.2014', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14346, 'Indeterminado', 'SOCARRAZ', '19');
INSERT INTO `trabajador` VALUES (1539, 4, 12, 39, 'LOURDES', 'CORREA', '54013100637', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2005, 0, 0, 'Solt.', '397 NO. 17417', '174  Y  176   VILLANUEVA', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14381, 'Indeterminado', 'ESCOBEDO', '119');
INSERT INTO `trabajador` VALUES (1540, 6, 52, 46, ' CELESTINO RAFAEL', 'GARCIA', '62102412640', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Solt.', 'CALLE 3RA # 24313', '/ G Y H. DOLORES', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14352, 'Indeterminado', 'VALDES', '36');
INSERT INTO `trabajador` VALUES (1541, 5, 54, 46, 'OLIVER', 'RAVELO', '66100830408', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1985, 0, 0, 'Cas.', 'CALLE 52 #9739', '/ 97A Y 99. LOTERIA', 315, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 14354, 'Indeterminado', 'DÍAZ', '262');
INSERT INTO `trabajador` VALUES (1542, 6, 52, 46, 'JUAN ZENEN', 'ALVAREZ', '68073026368', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'BELTRAN # 19901', '/ VISTA HERMOSA Y SANTA ISABEL. JACOMINO', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14355, 'Indeterminado', 'PLANCHET', '1');
INSERT INTO `trabajador` VALUES (1543, 6, 38, 41, 'RAFAEL ENRIQUE', 'GOMEZ', '65122915306', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Termoenergética', 1985, 0, 0, 'Solt.', 'CALLE E EDIF.23 APTO 7', '/ 2DA Y 3RA. VERACRUZ', 308, 'RO36 01.02.2014', 'FE: Formación Especial', 2621, 'CUP', 'Servicios', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14357, 'Indeterminado', ' DE ALBEAR', '350');
INSERT INTO `trabajador` VALUES (1544, 5, 54, 46, 'LÁZARO RAFAEL', 'VELAZQUEZ', '71091101569', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Solt.', 'CALLE 20 # 6722', '/ 67 Y 69. CENTRO COTORRO', 315, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 14359, 'Indeterminado', 'PRIETO', '248');
INSERT INTO `trabajador` VALUES (1545, 1, 37, 20, 'ARIEL', 'GEJO', '67050318886', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2001, 0, 0, 'Cas.', 'CALLE 1RA. NO.11820', 'E/ ALDAY  Y LINDERO  RPTO: JOSÉ A SACO', 313, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14363, 'Indeterminado', 'MARTÍNEZ', '215');
INSERT INTO `trabajador` VALUES (1546, 3, 73, 19, 'JANEISI', 'PÉREZ', '78102005657', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1999, 0, 0, 'Solt.', 'PINAR NO.7419', 'SAN FRANCISCO Y 100 RPTO. PONCE', 314, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14364, 'Indeterminado', 'GÓMEZ', '17');
INSERT INTO `trabajador` VALUES (1547, 1, 28, 19, 'GISELA', 'CASTELLANOS', '74012502971', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Solt.', 'RODRÍGUEZ NO.155 apto 2', 'FLORES Y SAN BENIGNO STOS. SUÁREZ', 309, NULL, 'FE: Formación Especial', 1841, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14365, 'Indeterminado', 'GUEVARA', '292');
INSERT INTO `trabajador` VALUES (1548, 1, 27, 50, 'MARIA DEL CARMEN', 'SUÁREZ', '69092202655', '0', 'Blanca', 'Superior', 'Lic. en Sociocultural', 2011, 0, 0, 'Cas.', '196   #39704', '397 y 399, Stgo de las Vegas', 313, NULL, 'Se evacua', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14366, 'Indeterminado', 'MAYEA', '27');
INSERT INTO `trabajador` VALUES (1549, 1, 62, 27, 'MERCEDES C.', 'GARCIA', '56100527235', '0', 'Blanca', 'Medio', '9no Grado', 1978, 0, 0, 'Cas.', 'QUINTA   No. 109', 'CERRADA Y SAN FELIPE', 310, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14368, 'Indeterminado', 'GONZALEZ', '329');
INSERT INTO `trabajador` VALUES (1550, 4, 12, 39, 'GRISEL', 'GUERENDIAN', '52060501810', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 12', '15  Y  17  BEJUCAL', 2401, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14383, 'Indeterminado', 'FERNÀNDEZ', '118');
INSERT INTO `trabajador` VALUES (1551, 3, 37, 19, 'IDANIA', 'YERA', '64072300179', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Finanzas', 1983, 0, 0, 'Solt.', 'CONUCO NO.9', 'JORGE  E INGLÉS  RPTO. SEVILLANO', 309, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14370, 'Indeterminado', 'CASTELLANOS', '32');
INSERT INTO `trabajador` VALUES (1552, 3, 12, 29, 'YAQUELIN', 'DÍAZ', '74022100111', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Solt.', 'OESTE 601 E/ S.ANTONIO Y FDEZ.CASTRO', 'ARROYO NARANJO', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14372, 'Indeterminado', 'RODRÍGUEZ', '41');
INSERT INTO `trabajador` VALUES (1553, 3, 12, 29, 'YAMILE IDA', 'LIMENDÚ', '72041301558', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', '3RA NO. 471', 'PACO Y MA. AUXILIADORA VIBORA PARK', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14373, 'Indeterminado', 'PACHECO', '9');
INSERT INTO `trabajador` VALUES (1554, 3, 13, 29, 'ANISSA', 'ARANGO', '74060121614', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2009, 0, 0, 'Solt.', 'STA. BEATRIZ NO. 308', 'LOURDES Y VILLOLDO  V. PARK', 314, 'R033 02.04.2012', 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14375, 'Indeterminado', 'RODRIGUEZ', '36');
INSERT INTO `trabajador` VALUES (1555, 3, 12, 29, 'MILENA', 'HERNANDEZ', '73012400895', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', '1RA NO. 11820', 'ALDAY Y LINDERO JOSÉ A. SACO', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14377, 'Indeterminado', 'ALONSO', '112');
INSERT INTO `trabajador` VALUES (1556, 3, 12, 29, 'YISLEN', 'HERNANDEZ', '73012400918', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Cas.', '1RA NO. 11820', 'ALDAY Y LINDERO JOSÉ A. SACO', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14378, 'Indeterminado', 'ALONSO', '31');
INSERT INTO `trabajador` VALUES (1557, 4, 12, 39, 'NUVIA SUYIN', 'ALMEIDA', '70061800875', '0', 'Blanca', 'Superior', 'Lic. en Sociocultural', 1988, 0, 0, 'Solt.', '3  NO.18822', '2   Y  4   STGO.LAS VEGAS', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14388, 'Indeterminado', 'GONZÀLEZ', '51');
INSERT INTO `trabajador` VALUES (1558, 4, 12, 39, 'ALINA', 'DELGADO', '55102500670', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 192 NO.39723', '397  Y  399 STGO. LAS VEGAS', 313, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14392, 'Indeterminado', 'FERNÀNDEZ', '26');
INSERT INTO `trabajador` VALUES (1559, 4, 76, 24, 'ADIANEZ ZENAIDA', 'RIVERA', '70081712076', '0', 'Blanca', 'Superior', 'Licenciatura en Informática', 2013, 0, 0, 'Solt.', '411 NO. 19607 A', '196  Y 198  STGO. LA VEGAS', 313, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14382, 'Indeterminado', 'DÍAZ', '174');
INSERT INTO `trabajador` VALUES (1560, 4, 12, 39, 'YAMILÉ', 'GUTIERREZ', '71102004098', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2002, 0, 0, 'Solt.', '409  edif 21000 apto 30', '210 y 212 La Catalina', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14396, 'Indeterminado', 'REYES', '0');
INSERT INTO `trabajador` VALUES (1561, 7, 12, 35, 'ODALYS', 'ESTRADA', '72112705679', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'PASAJE RAMAYO NO. 11207', '10  Y  12  RPTO. PARAJÓN', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14385, 'Indeterminado', 'GUZMAN', '122');
INSERT INTO `trabajador` VALUES (1562, 4, 12, 39, 'NORMA', 'ANIDO', '68021201198', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Finanzas', 1985, 0, 0, 'Cas.', 'CALLE 16 NO.11711', '1 RA  Y  3 RA. RPTO. PARAISO.', 315, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14397, 'Indeterminado', 'MARIN', '38');
INSERT INTO `trabajador` VALUES (1563, 3, 12, 29, 'MAYELIN', 'RICARDO', '72102028952', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planif. Industria Sideromec', 1991, 0, 0, 'Solt.', 'AVE. 99 NO. 3413 (ALTOS)', '34  Y  36  RPTO.LAS  DELICIAS', 315, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14389, 'Indeterminado', 'HERNÀNDEZ', '144');
INSERT INTO `trabajador` VALUES (1564, 4, 12, 39, 'MARLEM', 'HERNANDEZ', '66100832230', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1986, 0, 0, 'Solt.', 'CALLE E    17 A', '1RA Y AVE DEL ROSARIO', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16468, 'Indeterminado', 'GUERRA', '143');
INSERT INTO `trabajador` VALUES (1565, 3, 12, 29, 'ESMERALDA DE LA CARIDAD', 'ROMERO', '64083013272', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Cas.', 'CARABALLOS 9113', ' VIGIA Y REINALDO PÉREZ S. FCO. DE PAULA', 308, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14393, 'Indeterminado', 'MOREJÓN', '136');
INSERT INTO `trabajador` VALUES (1566, 4, 13, 39, 'LISANDRA', 'MAYE', '86013008332', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Contabilidad y Finanzas', 2004, 0, 0, 'Solt.', '200 NO. 39917', 'E/ 399 Y 401 BOYEROS', 313, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 17340, 'Indeterminado', 'BETANCOURT', '236');
INSERT INTO `trabajador` VALUES (1567, 4, 12, 39, 'MARISOL CARIDAD', 'ESCARRÁ', '73100800917', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Solt.', '88-A  5739N°', '57 Y 61.', 311, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 17509, 'Indeterminado', 'TRETO', '40');
INSERT INTO `trabajador` VALUES (1568, 3, 74, 41, 'VILMA', 'MARTIN', '64042100971', '0', 'Mestiza', 'Superior', 'Licenciatura en Informática', 2010, 0, 0, 'Solt.', 'LARCADA NO. 11704', 'COTILLA  Y ALDABÓ  ALDABÓ', 313, 'R029 02.04.2012', 'Se evacua', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14398, 'Indeterminado', 'MARTÌNEZ', '0');
INSERT INTO `trabajador` VALUES (1569, 4, 73, 19, 'MILEYDIS', 'ALCOLEA', '72011900055', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Radiocomunicaciones', 1991, 0, 0, 'Solt.', 'CALLE 186 NO. 18409', '184  Y  409  STGO. LAS VEGAS', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14400, 'Indeterminado', 'LA ROSA', '123');
INSERT INTO `trabajador` VALUES (1570, 4, 53, 46, 'JESUS ARÍSTIDES', 'GUEVARA', '67062218165', '0', 'Negra', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE  241  NO. 22816', '228  Y  230  ABEL STA. MARIA', 313, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14401, 'Indeterminado', 'CAINET', '38');
INSERT INTO `trabajador` VALUES (1571, 4, 52, 46, 'PABLO RAÙL', 'SANTACRUZ', '61011505167', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', ' 245 NO. 23412', '234  Y  236  ABEL STA. MARIA', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14402, 'Indeterminado', 'LAZAGA', '233');
INSERT INTO `trabajador` VALUES (1572, 4, 52, 46, 'EDDY LORENZO', 'HERNANDEZ', '45072202007', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2005, 0, 0, 'Solt.', 'CALLE 22  NO. 1719', '17  Y  19', 2401, NULL, 'Se evacua', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14403, 'Indeterminado', 'DÍAZ', '255');
INSERT INTO `trabajador` VALUES (1573, 3, 52, 46, 'GUSTAVO V', 'CRUZ', '72110730521', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1999, 0, 0, 'Solt.', 'SOFÍA  NO. 15', 'JUSTO Y  LUISA CARLOTA PÁRRAGA', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14407, 'Indeterminado', 'IBARRA', '39');
INSERT INTO `trabajador` VALUES (1574, 4, 54, 46, 'TOMAIDES', 'COBAS', '64060918966', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1986, 0, 0, 'Solt.', 'CALLE 188 NO. 28111', '281  Y  283  BALUARTE', 313, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14408, 'Indeterminado', ' LA FLOR', '50');
INSERT INTO `trabajador` VALUES (1575, 3, 54, 46, 'LAZARO M', 'GONZÀLEZ', '59112813445', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 36 NO. 2707', '27  Y 29  MIRAMAR', 301, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14409, 'Indeterminado', 'MORE', '228');
INSERT INTO `trabajador` VALUES (1576, 4, 52, 46, 'LEANDRO', 'MADRIGAL', '61031600709', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Máquinas Comp. Electrónica', 1989, 0, 0, 'Solt.', ' 182 NO.37911', '379  Y  383 MULGOBA', 313, NULL, 'No incorporado', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14410, 'Indeterminado', 'DÌAZ', '45');
INSERT INTO `trabajador` VALUES (1577, 4, 52, 46, 'JOSÈ RAMÒN', 'BARRETO', '57030901603', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 407  NO. 19816', '198   Y   200', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14411, 'Indeterminado', 'VALDES', '251');
INSERT INTO `trabajador` VALUES (1578, 4, 52, 46, 'ISRAEL', 'RODRÌGUEZ', '50042602123', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 66  NO. 35310', ' 359 Y 361 MULGOBA', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14412, 'Indeterminado', 'MENDEZ', '239');
INSERT INTO `trabajador` VALUES (1579, 3, 52, 46, 'GABRIEL', 'CUESTA', '63032413941', '0', 'Negra', 'Medio', '9no Grado', 1980, 0, 0, 'Viud.', 'CALLE B EDIF.  256', 'GUINERA Y LOMA REPARTO GUINERA', 314, NULL, 'No incorporado', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14413, 'Indeterminado', 'BOCOURT', '237');
INSERT INTO `trabajador` VALUES (1580, 4, 54, 46, 'JOSÉ A.', 'HERNÁNDEZ', '43120200167', '0', 'Blanca', 'Medio', '9no Grado', 2002, 0, 0, 'Cas.', 'CALLE  184  NO.29518', '303  Y  299', 313, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14414, 'Indeterminado', 'DÍAZ', '255');
INSERT INTO `trabajador` VALUES (1581, 4, 52, 46, 'CARLOS ENRIQUE', 'BORREGO', '68091001308', '0', 'Mestiza', 'Medio', '9no Grado', 1983, 0, 0, 'Solt.', 'CALLE  194 # 42316', '421 Y FINAL  LA ESPECIAL STGO VEGAS', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14415, 'Indeterminado', 'HERNÀNDEZ', '46');
INSERT INTO `trabajador` VALUES (1582, 3, 52, 46, 'RODNEY', 'DUVERGEL', '67020100960', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'JACKSON NO.20', 'RIVERA  Y ARNAO', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14416, 'Indeterminado', 'DALDÒN', '253');
INSERT INTO `trabajador` VALUES (1583, 3, 52, 46, 'RAFAEL', 'VALDÉS', '67121800700', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1988, 0, 0, 'Cas.', 'JOAQUIN DELGADO NO. 43', 'CLZDA. BEJUCAL  Y MATANZAS  PARRAGA', 314, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14417, 'Indeterminado', 'VALDÉS', '259');
INSERT INTO `trabajador` VALUES (1584, 3, 53, 46, 'GUILLERMO IVAN', 'CHACÒN', '65021030526', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'JULIAN DEL CASAR NO. 63', 'HEREDIA  Y CISNEROS  PARRAGA', 314, 'R031 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14418, 'Indeterminado', 'PEDRO', '178');
INSERT INTO `trabajador` VALUES (1585, 3, 64, 45, 'JOSÉ ALEJANDRO', 'GONZÁLEZ', '63101900908', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Materiales de Construcción', 1984, 0, 0, 'Cas.', 'CALLE 409 NO. 20028', '200  Y  202', 313, NULL, 'FE: Formación Especial', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14421, 'Indeterminado', 'RIVERO', '1');
INSERT INTO `trabajador` VALUES (1586, 4, 52, 46, 'ARMANDO LUIS', 'ZALDIVAR', '76122102984', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 198  NO. 27709', '277  Y  281   PANAMÉRICA', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14422, 'Indeterminado', 'TORRES', '24');
INSERT INTO `trabajador` VALUES (1587, 5, 52, 4, 'ROGER', 'GUERRA', '85100106783', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2005, 0, 0, 'Solt.', 'DOLORES  NO. 24512', 'F   Y   G', 308, NULL, 'Asignado a UMR', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14423, 'Indeterminado', 'ROUCO', '241');
INSERT INTO `trabajador` VALUES (1588, 4, 54, 46, 'DENNIS', 'DARIAS', '74082501945', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1998, 0, 0, 'Solt.', 'CALLE 12 NO. 11006', 'PASTORA  Y  9  NA.  RPTO. ANTONIO MACEO', 310, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14424, 'Indeterminado', 'DE LEÒN', '0');
INSERT INTO `trabajador` VALUES (1589, 3, 54, 46, 'PEDRO J', 'VICTORES', '49041708709', '0', 'Blanca', 'Primaria', '6to Grado', 1963, 0, 0, 'Solt.', 'CALLE 5TA. NO. 6218', '62  Y  66', 301, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14426, 'Indeterminado', 'AGUILERA', '240');
INSERT INTO `trabajador` VALUES (1590, 4, 54, 46, 'JULIO', 'NUÑEZ', '68012618649', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 182 NO. 40936', '411 Y AVE.LÍDICE', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14428, 'Indeterminado', 'DÌAZ', '246');
INSERT INTO `trabajador` VALUES (1591, 3, 54, 46, 'LUIS ALBERTO', 'VALDÉS', '74011200021', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1999, 0, 0, 'Cas.', '4ta No. 48', 'PROGRESO Y LINDERO', 314, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14429, 'Indeterminado', 'PIÑERO', '9');
INSERT INTO `trabajador` VALUES (1592, 4, 54, 46, 'ESTEBAN', 'SUÁREZ', '70091811301', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Fundición', 1989, 0, 0, 'Solt.', 'CALLE 395 NO.18218', '  182  Y 184 VILLANUEVA', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14430, 'Indeterminado', 'SIERRA', '42');
INSERT INTO `trabajador` VALUES (1593, 4, 73, 43, 'YANELY', 'CARMONA', '72010402533', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Construcción Civil', 1992, 0, 0, 'Solt.', 'CALLE 194 NO. 41915', '419  Y  421  LA ESPECIAL', 313, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14431, 'Indeterminado', 'MORALES', '25');
INSERT INTO `trabajador` VALUES (1594, 3, 12, 29, 'LOURDES MAGALIS', 'MAESTREY', '67021114873', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Solt.', 'CALLE 289 NO.18417', '184  Y  188 RPTO DINORA', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14432, 'Indeterminado', 'SOSA', '135');
INSERT INTO `trabajador` VALUES (1595, 3, 10, 43, 'MILAGROS', 'GUTIERREZ', '71040910630', '0', 'Negra', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', 'AVE. 1RA. NO 60', '2DA. Y  1RA. RPTO VOLPE', 314, NULL, 'Se evacua', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14433, 'Indeterminado', 'MACHIN', '50');
INSERT INTO `trabajador` VALUES (1596, 3, 52, 46, 'JORGE LUIS', 'MARTÍNEZ', '68061700100', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2003, 0, 0, 'Solt.', 'CALLE 12 NO. 2108', 'E/ 21 Y 23. BEJUCAL', 206, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14435, 'Indeterminado', 'PÉREZ', '4');
INSERT INTO `trabajador` VALUES (1597, 3, 73, 41, 'MABEL', 'VÁZQUEZ', '67062914096', '0', 'Mestiza', 'Superior', 'Ing. en Telecomunicaciones', 1990, 0, 0, 'Cas.', '4ta. NO 1-B', '5TA Y FINAL. REPARTO PARCELACION MODERNA', 314, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14437, 'Indeterminado', 'VICENT', '117');
INSERT INTO `trabajador` VALUES (1598, 1, 27, 19, 'TAMARA', 'SEMANAT', '70113001779', '0', 'Negra', 'Superior', 'Ing. en Telecomunicaciones', 2005, 0, 0, 'Solt.', 'CALLE 63 NO. 2031', '20C  Y  22 RPTO. AMERICA', 315, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14438, 'Indeterminado', 'DUHARTE', '2');
INSERT INTO `trabajador` VALUES (1599, 3, 52, 46, 'YADEL', 'GONZALEZ', '75011103105', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1994, 0, 0, 'Cas.', 'PEDRO NUEVO 306', '6TA Y 7MA. MANTILLA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14440, 'Indeterminado', 'RIVERO', '259');
INSERT INTO `trabajador` VALUES (1600, 8, 12, 37, 'MIREYA', 'MADARIAGA', '53081709757', '0', 'Negra', 'Medio', '9no Grado', 1988, 0, 0, 'Solt.', 'CALLE RASTRO NO.2224', 'ENTRE APTO. 4 E/ BELASCOAIN Y CAMAPAÑAR', 303, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14549, 'Indeterminado', 'S.O.A', '44');
INSERT INTO `trabajador` VALUES (1601, 3, 52, 46, 'LEONARDO', 'VERA', '67120812267', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', ' 89 A NO.12607', 'ENTRE 126 Y 128  REPARTO: PALMAR.', 311, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14627, 'Indeterminado', 'LÓPEZ', '30');
INSERT INTO `trabajador` VALUES (1602, 7, 12, 35, 'ADRIANA', 'BASULTO', '60100408370', '0', 'Blanca', 'Medio', 'Oficio', 1978, 0, 0, 'Cas.', 'CONCHA  NO.112  apto 5   3er piso', 'e/  ENSENADA  Y FOMENTO   LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 14683, 'Indeterminado', 'MAJENDIE', '155');
INSERT INTO `trabajador` VALUES (1603, 6, 12, 33, 'YENI', 'MORALES', '75011103773', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Construcción Civil', 1993, 0, 0, 'Cas.', 'CALLE B Nº 12', 'ENTRE CARRETERA CENTRAL Y 1ª  REPATO MAR', 308, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14688, 'Indeterminado', 'MORA', '138');
INSERT INTO `trabajador` VALUES (1604, 6, 12, 33, 'JANET', 'ABAD', '82052109412', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2001, 0, 0, 'Cas.', 'CALLE 6ª Nº4809 A', 'ENTRE CENTRAL Y HERNANDEZ REPARTO MARTIN', 308, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14690, 'Indeterminado', 'ESTEVEZ', '134');
INSERT INTO `trabajador` VALUES (1605, 1, 54, 3, 'René Jesús', 'Acosta', '69040201483', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 1988, 0, 0, 'Solt.', 'CESPEDES Nº.470', 'ENTRE MILLAR Y AGUSTIN GARCIA', 305, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14739, 'Indeterminado', 'Fernández', '243');
INSERT INTO `trabajador` VALUES (1606, 7, 71, 24, 'MARIA ANDREA', 'NOVAL', '62111002818', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Contabilidad', 1982, 0, 0, 'Solt.', '10 DE OCTUBRE   No  763', 'E/ COLINA Y QUIROGA  SANTOS  SUAREZ', 309, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14815, 'Indeterminado', 'ZAYAS', '36');
INSERT INTO `trabajador` VALUES (1607, 8, 76, 24, 'IDOLIDIA', 'MORENO', '68091902091', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1986, 0, 0, 'Div.', 'PARQUE # 681 APTO 43', '/ AMADO Y ARANGUREN SEVILLANO', 309, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14824, 'Indeterminado', 'HERNANDEZ', '7');
INSERT INTO `trabajador` VALUES (1608, 7, 43, 24, 'GEORGINA', 'VALLADARES', '52091510119', '0', 'Blanca', 'Medio', '9no Grado', 1975, 0, 0, 'Solt.', 'BEALES   No  99', 'ESQ    FONT        LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14832, 'Indeterminado', 'OTERO', '49');
INSERT INTO `trabajador` VALUES (1609, 1, 49, 45, 'MARIA ISABEL', 'RODRIGUEZ', '63051611930', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1981, 0, 0, 'Solt.', 'MAYIA RODRIGUEZ # 929', '/ PERLA Y AVE. DE LOS PINOS', 314, 'R092 02.04.2012', 'BPD Área Residencia', 806, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14834, 'Indeterminado', 'CESAR', '129');
INSERT INTO `trabajador` VALUES (1610, 8, 71, 24, 'ODALIS', 'DIAZ', '65101632595', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Planificación', 1985, 0, 0, 'Solt.', 'EGIDO NO 705 APTO 55', 'E/ PAULA Y MERCEDES', 304, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14842, 'Indeterminado', 'BORIS', '159');
INSERT INTO `trabajador` VALUES (1611, 8, 71, 24, 'ADA MARIA', 'AVALO', '63062632119', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 1986, 0, 0, 'Div.', 'SEGUNDA EDIFICIO 13 APTO 12', 'D Y AVE VERACRUZ REPARTO VERACRUZ', 308, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 14848, 'Indeterminado', 'ALMORA', '28');
INSERT INTO `trabajador` VALUES (1612, 1, 35, 23, 'YUDITH', 'PEREZ', '72060913754', '0', 'Blanca', 'Superior', 'Lic. en Economía', 1996, 0, 0, 'Solt.', 'CALLE 12 # 14845, apto13', '/E Y  8', 313, 'R06 02.04.2012', 'Se evacua', 3004, 'CUP', 'Cuadros', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14864, 'Indeterminado', 'SAÑUDO', '97');
INSERT INTO `trabajador` VALUES (1613, 4, 43, 24, 'YAUMARA', 'BOSCH', '83032105853', '0', 'Blanca', 'Superior', 'Lic. en Contabilidad y Finanzas', 2010, 0, 0, 'Solt.', 'CALLE 108 NO 28712', 'E/ 287 Y 291, CALABAZAR', 313, NULL, 'Se evacua', 1841, 'CUP', 'Servicios', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14865, 'Indeterminado', 'VELIZ', '2');
INSERT INTO `trabajador` VALUES (1614, 3, 43, 24, 'ROSA ODALYS', 'PUENTES', '70081409738', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1992, 0, 0, 'Cas.', 'AVE 235 NO 21023', 'E/ 210 Y 216, FONTANAR', 313, NULL, 'Se evacua', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14866, 'Indeterminado', 'CARABALLO', '263');
INSERT INTO `trabajador` VALUES (1615, 3, 76, 24, 'MAYELIN', 'PORRASPITA', '71121311357', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1990, 0, 0, 'Div.', 'CALLE 6TA NO 17112', 'E/ 1RA Y 3RA, LA FORTUNA', 313, 'R103 02.04.2012', 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14868, 'Indeterminado', 'GOMEZ', '36');
INSERT INTO `trabajador` VALUES (1616, 1, 23, 21, 'SILVIA E.', 'SENTMANAT', '45090901918', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 1965, 0, 0, 'Solt.', 'CALLE REYES NO 337', 'e/n      C    y    LUZ   LAWTON', 309, NULL, 'FE: Formación Especial', 1452, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14876, 'Indeterminado', 'SANABRIA', '31');
INSERT INTO `trabajador` VALUES (1617, 7, 71, 24, 'ZULEY', 'PÉREZ', '82042512011', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 2001, 0, 0, 'Cas.', 'GERTRUDIS   NO. 161  APTO 3', 'E/   3RA Y 4TA    LAWTON', 309, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14877, 'Indeterminado', 'FIALLO', '178');
INSERT INTO `trabajador` VALUES (1618, 5, 71, 24, 'MABEL', 'PEREZ', '85010606815', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2003, 0, 0, 'Div.', 'MANUEL GONZALEZ NO 19532 APTO 2', 'E/ PEPE PRIETO Y GABRIEL LA ROSALIA', 308, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14878, 'Indeterminado', 'DUCONGER', '49');
INSERT INTO `trabajador` VALUES (1619, 1, 22, 6, 'CRISTINA', 'VERGARA', '54080100535', '0', 'Blanca', 'Superior', 'Ing. Pecuario', 1980, 0, 0, 'Cas.', 'CONCEPCION NO 14', 'E/ 10 DE OCTUBRE Y DELICIAS, LAWTON', 309, 'R110 02.04.2012', 'Se evacua', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14880, 'Indeterminado', 'VALDES', '222');
INSERT INTO `trabajador` VALUES (1620, 6, 43, 24, 'FE KATIUSKA', 'RUIZ', '61122001931', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Finanzas', 1988, 0, 0, 'Cas.', 'BALEAR NO 17912', 'APTO 6 E/ CALZADA DE SAN MIGUEL DEL PADR', 308, 'R056 02.04.2012', 'FE: Formación Especial', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14881, 'Indeterminado', 'IGLESIAS', '6');
INSERT INTO `trabajador` VALUES (1621, 5, 43, 24, 'TAYMI YUSIMIN', 'SMITH', '73040823996', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. Contador', 2001, 0, 0, 'Cas.', 'RITA NO 110', 'E/ PIEDRA Y SOTO,', 308, 'R050 02.04.2012', 'No incorporado', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 14882, 'Indeterminado', 'RODRIGUEZ', '48');
INSERT INTO `trabajador` VALUES (1622, 1, 27, 20, 'GLADYS', 'AMIGO', '64101413219', '0', 'Blanca', 'Superior', 'Lic. en Contabilidad', 1992, 0, 0, 'Solt.', 'CALLE 2DA NO 64', 'APTO 7 E/ LAGUERUELA Y GERTRUDIS. LAWTON', 309, NULL, 'FE: Formación Especial', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14892, 'Indeterminado', 'GUTIERREZ', '31');
INSERT INTO `trabajador` VALUES (1623, 1, 23, 23, 'MARLENE MARIA', 'CISNEROS', '62080611798', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1983, 0, 0, 'Solt.', 'MAYIA RODRIGUEZ NO 205', 'E/ MILAGRO Y LIBERTAD, STOS SUAREZ', 309, 'R048 02.04.2012', 'Se evacua', 1452, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14895, 'Indeterminado', 'LEDO', '245');
INSERT INTO `trabajador` VALUES (1624, 4, 71, 24, 'ROSA DIODINA', 'ALFONSO', '63083013558', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 1981, 0, 0, 'Solt.', 'AVE 305 NO 17005', 'E/ 170 Y 172, RPTO LUTGARDITA', 313, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14901, 'Indeterminado', 'LINARES', '163');
INSERT INTO `trabajador` VALUES (1625, 1, 37, 21, 'ZOILA', 'SAIZ', '61121814218', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1983, 0, 0, 'Cas.', 'CALLE 239 NO 23540 Bloque II Bajos', 'ESQUINA 206 FONTANAR', 313, NULL, 'BPD Centro de Trabajo', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14902, 'Indeterminado', 'SANCHEZ', '230');
INSERT INTO `trabajador` VALUES (1626, 3, 71, 24, 'DAYANI', 'RODRIGUEZ', '80122900912', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1999, 0, 0, 'Solt.', 'CALLE 281 No.10219', 'E/ 102 y 104. CALABAZAR', 313, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14906, 'Indeterminado', 'SERRANO', '33');
INSERT INTO `trabajador` VALUES (1627, 6, 71, 24, 'SIULYS CARIDAD', 'VERDECIAS', '84060706739', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2003, 0, 0, 'Solt.', 'SUAREZ NO 3', 'E/ PERKINS Y MATOS LA FERNANDA', 308, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14908, 'Indeterminado', 'MARTINEZ', '4');
INSERT INTO `trabajador` VALUES (1628, 3, 42, 29, 'DAYSI MARGARITA', 'DENIS', '65012802518', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1991, 0, 0, 'Solt.', 'CALLE 100 NO 17524', 'ESQUINA ALDAY', 313, NULL, 'BPD Centro de Trabajo', 2036, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 14912, 'Indeterminado', 'MIRANDA', '19');
INSERT INTO `trabajador` VALUES (1629, 7, 73, 14, 'GELDA DELIA', 'REYNALDO', '67121319115', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Comunicac. Postales y Teleg', 1986, 0, 0, 'Solt.', 'PEDRO PERNAS # 351', '/ROSA ENRIQUEZ Y MANUEL PRUNA', 309, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 14971, 'Indeterminado', 'DESCHAPELLS', '117');
INSERT INTO `trabajador` VALUES (1630, 6, 73, 9, 'TERESA', 'JUNCO', '70050411037', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1991, 0, 0, 'Div.', 'PAMPLONA # 15', 'MARQUEZ DE LA TORRE Y CZDA.DE 10 DE OCT', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 14972, 'Indeterminado', 'GONZALEZ', '41');
INSERT INTO `trabajador` VALUES (1631, 1, 69, 49, 'GRACIELA', 'SANCHEZ', '67012400615', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2007, 0, 0, 'Solt.', 'DOLORES # 810', '/16 Y LINEA DE FERROCARRIL', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14973, 'Indeterminado', 'LUGO', '30');
INSERT INTO `trabajador` VALUES (1632, 1, 36, 49, 'AIMEE', 'AREVALO', '70111413776', '0', 'Blanca', 'Superior', 'Ing. en Control Automático', 1995, 0, 0, 'Solt.', 'CALLE 124 # 4506', 'E/ 45 Y 49, COCOSOLO', 311, 'R05 01.07.2013', 'Se evacua', 2903, 'CUP', 'Cuadros', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14991, 'Indeterminado', 'PERERA', '27');
INSERT INTO `trabajador` VALUES (1633, 1, 27, 48, 'YANETTE', 'DOMINGUEZ', '78110606857', '0', 'Blanca', 'Superior', 'Licenciatura en Informática', 2009, 0, 0, 'Solt.', 'SECCION C # 59', 'RPTO FRANK PAIS MANAGUA', 314, NULL, 'Se evacua', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14995, 'Indeterminado', 'MORALES', '215');
INSERT INTO `trabajador` VALUES (1634, 1, 19, 49, 'JENY', 'FERRANDO', '70021814795', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2002, 0, 0, 'Solt.', 'MILAGROS # 310 APTO 2', '/CORTINA Y JUAN BRUNO ZAYAS, STOS SUAREZ', 309, 'R05 01.07.2013', 'Se evacua', 1633, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14996, 'Indeterminado', 'MORALES', '292');
INSERT INTO `trabajador` VALUES (1635, 1, 69, 49, 'YANET', 'CAMPA', '78122010397', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Informática', 2002, 0, 0, 'Solt.', 'CALLE 3RA. # 12427', '/ TREBOL Y B RPTO.TREBOL', 306, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 14998, 'Indeterminado', 'FERNANDEZ', '289');
INSERT INTO `trabajador` VALUES (1636, 1, 71, 21, 'GUADALUPE', 'EXPOSITO', '85071005535', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 2004, 0, 0, 'Solt.', 'CALLE 78 E/ 21D Y 21C    NAVE  H', 'CUBICULO  6    REPARTO  GUITERAS', 306, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15014, 'Indeterminado', 'GONZALEZ', '195');
INSERT INTO `trabajador` VALUES (1637, 4, 71, 24, 'ELAINIE', 'DEL PINO', '88093009714', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 2007, 0, 0, 'Solt.', 'CALLE 375 NO 17846', 'E/ 178 Y 184 MULGOBA', 313, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15020, 'Indeterminado', 'HARTMAN', '193');
INSERT INTO `trabajador` VALUES (1638, 1, 69, 49, 'YANISLEYDI', 'CASTELLANOS', '88112206350', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2007, 0, 0, 'Solt.', 'CALLE 236 # 24944', '/247 Y 249 RPTO. ABEL SANTAMARIA', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15025, 'Indeterminado', 'SIMPSON', '271');
INSERT INTO `trabajador` VALUES (1639, 1, 37, 48, 'ALAIN', 'CRUZ', '74052503022', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones y Electrónica', 2004, 0, 0, 'Solt.', 'CALLE JUAN DELGADO NO. 114', 'E/ ESTRADA PALMA Y LUIS ESTEVEZ, STOS SU', 309, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15060, 'Indeterminado', 'ROCA', '44');
INSERT INTO `trabajador` VALUES (1640, 4, 52, 46, 'DANIEL', 'GONZALEZ', '69051111625', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2000, 0, 0, 'Cas.', '415 # 18411', 'E/ 184 y 186 LIDICE', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15073, 'Indeterminado', 'GUTIERREZ', '260');
INSERT INTO `trabajador` VALUES (1641, 8, 73, 41, 'SURYA', 'SOTOLONGO', '73101809176', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1992, 0, 0, 'Cas.', 'CALLE ENAMORADOS NO. 207', 'E/ FLORES Y SERRANOS', 309, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15104, 'Indeterminado', 'ZAPATA', '114');
INSERT INTO `trabajador` VALUES (1642, 4, 73, 41, 'RAMON AMELIO', 'VALDES', '60041101261', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1986, 0, 0, 'Cas.', 'AVE. INDEPENDENCIA NO. 1172', 'E/ PASEO Y CAMPAMENTO', 314, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15164, 'Indeterminado', 'SUAREZ', '119');
INSERT INTO `trabajador` VALUES (1643, 1, 73, 44, 'MIRTHA', 'RODRIGUEZ', '72040627715', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1993, 0, 0, 'Cas.', 'CALLE  67    No.  4404', '44   y   46      RPTO  MODELO', 315, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15168, 'Indeterminado', 'GARCIA', '105');
INSERT INTO `trabajador` VALUES (1644, 1, 37, 44, 'ORESTES', 'O`FARRILL', '68061714141', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Cas.', 'CALLE CALZADA NO. 208', 'E/ J Y K', 302, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15171, 'Indeterminado', 'BROUGHTON', '16');
INSERT INTO `trabajador` VALUES (1645, 8, 74, 41, 'ALBERTO', 'GONZALEZ', '69031200666', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 1996, 0, 0, 'Cas.', 'CALLE 1RA NO. 20', 'E/ 2DA Y 4TA', 309, NULL, 'FE: Formación Especial', 1512, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15172, 'Indeterminado', 'SALINAS', '45');
INSERT INTO `trabajador` VALUES (1646, 7, 74, 41, 'CARMEN CECILIA', 'GONZALEZ', '65052019799', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1984, 0, 0, 'Solt.', 'CALLE    LUZ    NO.10431', 'E/  6TA   Y  CALZADA DE BEJUCAL', 314, NULL, 'Se evacua', 1452, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15173, 'Indeterminado', 'PEREZ', '155');
INSERT INTO `trabajador` VALUES (1647, 7, 34, 15, 'MAGDA CARIDAD', 'CABADA', '65010700558', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Cas.', 'DELICIAS  No. 22 1/2   apto 3', 'MADRID   Y   PAMPLONA      LAWTON', 309, 'R019 01.09.2015', 'Asignado a Unid. MTT', 2796, 'CUP', 'Cuadros', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15174, 'Indeterminado', 'HERRERA', '246');
INSERT INTO `trabajador` VALUES (1648, 1, 73, 44, 'LAZARA OFELIA', 'HERNANDEZ', '67030702170', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Solt.', 'CALLE SAN JOSE NO. 20712', 'E/ 3RA Y SAN ANTONIO   RPTO CAROLINA', 308, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15175, 'Indeterminado', 'DIAZ', '32');
INSERT INTO `trabajador` VALUES (1649, 1, 73, 44, 'DIANELA', 'GARRIGA', '73082209641', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Cas.', 'CALLE JUSTICIA NO. 626', 'E/ HERRERA Y SANTA FELICIA    LUYANO', 309, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15178, 'Indeterminado', 'ARMENTEROS', '48');
INSERT INTO `trabajador` VALUES (1650, 7, 73, 41, 'DAMARIS', 'HERNANDEZ', '73011812879', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Cas.', 'CALLE VILLALOBOS NO. 11631', 'E/ SANTOS GARCIA Y CALZADA DE S.M.P', 308, NULL, 'Se evacua', 1347, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15179, 'Indeterminado', 'SOTO', '12');
INSERT INTO `trabajador` VALUES (1651, 6, 73, 41, 'ARIEL MARCOS', 'MONDUY', '70101211685', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1983, 0, 0, 'Cas.', 'AVE JOSE MARTI NO 12412', '3ERA Y 4TA DIEZMERO', 308, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15183, 'Indeterminado', 'ROJO', '102');
INSERT INTO `trabajador` VALUES (1652, 6, 73, 41, 'JUAN DANIEL', 'FAJARDO', '63010300944', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transmisión', 1980, 0, 0, 'Solt.', 'CALLE NARCISA NO. 2', 'E/ 6TA Y CENTRAL', 308, NULL, 'FE: Formación Especial', 1347, 'CUP', 'Técnico', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15186, 'Indeterminado', 'ALVAREZ', '49');
INSERT INTO `trabajador` VALUES (1653, 5, 73, 41, 'RAIZA', 'LLERENA', '67072514830', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1986, 0, 0, 'Cas.', 'CALLE 52 NO. 9739', 'E/ 97 A Y 99', 315, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 15187, 'Indeterminado', 'TORRES', '14');
INSERT INTO `trabajador` VALUES (1654, 6, 73, 41, 'MAGDEL', 'SABORIT', '73071911756', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Cas.', 'CALLE NARCISA NO. 21509', 'E/ CALZADA DE GUINES Y 1RA', 308, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15192, 'Indeterminado', 'CABRERA', '23');
INSERT INTO `trabajador` VALUES (1655, 1, 73, 44, 'MAITE', 'MARQUEZ', '73110500315', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1994, 0, 0, 'Cas.', '7ma EDIF 230 APTO. 2', 'C FINAL', 307, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15193, 'Indeterminado', 'LLORENTE', '112');
INSERT INTO `trabajador` VALUES (1656, 1, 73, 44, 'DIXIE JAVIER', 'NUÑEZ', '71013111425', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comercio', 1989, 0, 0, 'Cas.', '  AVE. 41 NO.9209', ' 92 A Y 94', 311, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15195, 'Indeterminado', 'SUAREZ', '26');
INSERT INTO `trabajador` VALUES (1657, 4, 73, 41, 'RAMIRO', 'VALDÉS', '65101832284', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1998, 0, 0, 'Cas.', 'SECCIÓN  C  24-A', 'RPTO. FRANK PAIS MANAGUA', 314, NULL, 'FE: Formación Especial', 1347, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15196, 'Indeterminado', 'SUÁREZ', '16');
INSERT INTO `trabajador` VALUES (1658, 4, 73, 41, 'JUANA MIGDALIA', 'JARDINES', '50050612695', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Radiocomunicaciones', 1973, 0, 0, 'Solt.', 'CALLE 31 NO. 2', 'E/ 250 Y 29 A', 312, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15198, 'Indeterminado', 'JARROSAY', '30');
INSERT INTO `trabajador` VALUES (1659, 4, 73, 41, 'MABEL', 'ESPONDA', '71022810890', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1990, 0, 0, 'Cas.', 'CALLE 170 S/N', '383    Y  FINAL MULGOBA', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15199, 'Indeterminado', 'CASTILLERO', '45');
INSERT INTO `trabajador` VALUES (1660, 4, 73, 41, 'REDELIO', 'CARDENAS', '56061316620', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1983, 0, 0, 'Cas.', 'CALLE 423 NO. 19007', 'E/ 190 Y 194', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15201, 'Indeterminado', 'MANRIQUE', '101');
INSERT INTO `trabajador` VALUES (1661, 4, 73, 41, 'JORGE RAUL', 'SUÁREZ', '65041911904', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Radiotecnico', 1985, 0, 0, 'Solt.', 'CALLE 27 NO. 72', ' N Y O', 302, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15202, 'Indeterminado', 'FROMETA', '104');
INSERT INTO `trabajador` VALUES (1662, 4, 73, 41, 'ARSENIO FRANCISCO', 'GONZALEZ', '57121400780', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transmisión', 1978, 0, 0, 'Cas.', 'CALLE 399 NO. 19801', 'E/ 198 Y 200', 313, NULL, 'FE: Formación Especial', 1347, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15205, 'Indeterminado', 'BORREGO', '18');
INSERT INTO `trabajador` VALUES (1663, 4, 73, 12, 'CELIA', 'SÁNCHEZ', '69070310238', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1990, 0, 0, 'Cas.', 'AVE. 31 A NO. 6201', 'E/ 62 Y 64', 2411, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15206, 'Indeterminado', 'LEYVA', '86');
INSERT INTO `trabajador` VALUES (1664, 3, 73, NULL, 'MILADYS', 'SALVADOR', '72092711332', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Cas.', 'ESTELA No. 359', 'ISABEL Y MARIA LUISA  PARRAGA', 314, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15208, 'Indeterminado', 'HORTA', '47');
INSERT INTO `trabajador` VALUES (1665, 3, 61, 41, 'JORGE LUIS', 'PEREZ', '47081601868', '0', 'Blanca', 'Medio', 'Oficio', 1964, 0, 0, 'Cas.', 'CALLE CRESPO NO. 124', 'COLON Y TROCADERO', 303, 'R114 02.04.2012', 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15211, 'Indeterminado', 'PEDRAZA', '122');
INSERT INTO `trabajador` VALUES (1666, 4, 73, 41, 'LUIS CARLOS', 'LÓPEZ', '51071023800', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1995, 0, 0, 'Cas.', 'CALLE 5 NO. 885', 'E/ 1RA Y RADIAL EDUARDO CHIVÁS', 307, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15212, 'Indeterminado', 'GÓMEZ', '20');
INSERT INTO `trabajador` VALUES (1667, 3, 73, 41, 'MARTHA MARIA', 'ALONSO', '68040402276', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1988, 0, 0, 'Solt.', 'CALLE 6TA #11108 APTO 4', 'E/ QUINTANA Y FORTUNA', 313, NULL, 'FE: Formación Especial', 1347, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15213, 'Indeterminado', 'LOPEZ', '95');
INSERT INTO `trabajador` VALUES (1668, 4, 73, 41, 'OMAR DE J.', 'ROCA', '37123001586', '0', 'Blanca', 'Superior', 'Ing. Electricista', 1966, 0, 0, 'Cas.', 'CALLE 223 NO. 23634', 'E/ 246 Y 236', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', 'Ing.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15214, 'Indeterminado', 'SOLER', '88');
INSERT INTO `trabajador` VALUES (1669, 4, 38, 41, 'ARMANDO', 'SIERRA', '72110218202', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Viales', 1990, 0, 0, 'Solt.', 'CALLE 5TA NO. 269', ' ALBEAR Y SANTA CATALINA', 310, NULL, 'Asignado a Unid. MTT', 2621, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15376, 'Indeterminado', 'GUERRA', '4');
INSERT INTO `trabajador` VALUES (1670, 1, 9, 1, 'ANTONIO', 'ARMAS', '53052412080', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Instrumentación y Control', 1979, 0, 0, 'Solt.', ' SANTA IRENE   No. 251', 'SERRANO Y DUREGE   SANTOS  SUAREZ', 309, NULL, 'FE: Formación Especial', 806, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15388, 'Indeterminado', 'CAMPOS', '21');
INSERT INTO `trabajador` VALUES (1671, 7, 56, 2, 'ELADIO', 'MEDINA', '67021812447', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Mant. Reparac. de Automovil', 1986, 0, 0, 'Solt.', 'CALLE 10 NO. 911', 'E/ LUZ Y POCITO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15389, 'Indeterminado', 'ABREU', '237');
INSERT INTO `trabajador` VALUES (1672, 6, 34, 10, 'ALEXIS', 'ARRIETA', '71090403764', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2013, 0, 0, 'Cas.', 'SAN ANASTACIO # 771', 'E/ SAN MARIANO Y VISTA ALEGRE, LAWTON', 309, 'R004 12.11.2015', 'FE: Formación Especial', 2796, 'CUP', 'Cuadros', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15412, 'Indeterminado', 'HERNANDEZ', '246');
INSERT INTO `trabajador` VALUES (1673, 6, 58, 2, 'MIGUEL A.', 'TAMAYO', '63021711603', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Maquinado Corte de Met.', 1981, 0, 0, 'Solt.', 'GLORIA #785', 'RASTRO Y CARMEN    JESUS MARIA', 304, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15421, 'Indeterminado', 'ROMERO', '258');
INSERT INTO `trabajador` VALUES (1674, 3, 56, 2, 'ADDIEL', 'FEO', '86041008324', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2004, 0, 0, 'Cas.', ' GELABERT NO. 56', ' SAN MIGUEL Y LAGUERUELA', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15438, 'Indeterminado', 'LABRADA', '225');
INSERT INTO `trabajador` VALUES (1675, 1, 41, 52, 'FRANCISCO LAZARO', 'GARCIA', '59031529486', '0', 'Blanca', 'Medio', '9no Grado', 2006, 0, 0, 'Cas.', 'CALLE CRUZ FERNANDEZ  NO.9', 'E/ 15 Y 16', 309, 'R044 01.06.2014', 'FE: Formación Especial', 2218, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15488, 'Indeterminado', 'HERRERA', '11');
INSERT INTO `trabajador` VALUES (1676, 8, 73, 41, 'ROSARIO DE LA CARIDAD', 'LLORENTE', '51100709696', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1980, 0, 0, 'Solt.', 'CALLE NARANJITO NO. 815', 'E/ ASUNCION Y VARONA', 314, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15523, 'Indeterminado', 'GARCIA', '116');
INSERT INTO `trabajador` VALUES (1677, 1, 73, 52, 'KENYA', 'MEDEROS', '72100514313', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'CALLE FELIPE POEY #567 APTO 10', 'ENTRE OFARRIL Y ACOSTA. VÍBORA', 309, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15524, 'Indeterminado', 'DIAZ', '105');
INSERT INTO `trabajador` VALUES (1678, 8, 73, 43, 'ALAIN', 'ALFONSO', '75060323867', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1998, 0, 0, 'Solt.', 'CALLE CABALLERO NO. 120', 'E/ C Y ROSELL', 314, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15525, 'Indeterminado', 'LUIS', '8');
INSERT INTO `trabajador` VALUES (1679, 1, 2, 27, 'JORGE JESUS', 'HERRERA', '54012000664', '0', 'Negra', 'Primaria', '6to Grado', 1970, 0, 0, 'Solt.', 'CALLE LAZADA DE VENTO NO. 2 A', 'E/ VENTO Y VENTO OESTE RTO STA CATALINA', 310, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15526, 'Indeterminado', 'PEREZ', '291');
INSERT INTO `trabajador` VALUES (1680, 8, 61, 41, 'MIGUEL ANGEL', 'DEL RIO', '55051300686', '0', 'Blanca', 'Medio', '9no Grado', 2006, 0, 0, 'Cas.', 'CALLE 5TA NO. 19378', 'E/ CALZADA DE SAN MIGUEL Y 1', 308, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15530, 'Indeterminado', 'NOGUES', '129');
INSERT INTO `trabajador` VALUES (1681, 7, 61, 41, 'ADIS LUISA', 'MOLINA', '62081914953', '0', 'Blanca', 'Medio', '9no Grado', 1979, 0, 0, 'Cas.', 'LUGAREÑO   No  69', 'E/ AGUILERA Y CESPEDES   LAWTON', 309, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15531, 'Indeterminado', 'ALMAGUER', '2');
INSERT INTO `trabajador` VALUES (1682, 8, 61, 41, 'LEANDRO', 'GONZALEZ', '72111917582', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2006, 0, 0, 'Cas.', 'CALLE LUIS ESTEVEZ NO. 361', 'E/ FIGUEROA Y CORTINA', 309, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15536, 'Indeterminado', 'RIOS', '12');
INSERT INTO `trabajador` VALUES (1683, 7, 13, 35, 'YOVANY', 'ATANES', '75090803106', '0', 'Blanca', 'Superior', 'Ing. en Informática', 2015, 0, 0, 'Solt.', ' SANTA FELICIA   No.311', 'E/ REFORMA Y GUASABACOA     LUYANO', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 15537, 'Indeterminado', 'HERNANDEZ', '227');
INSERT INTO `trabajador` VALUES (1684, 8, 73, 41, 'YOBANY', 'VALDES', '75012103108', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Mont. Reparac. Máq. Herram.', 1993, 0, 0, 'Cas.', 'CALLE GENERAL LEE NO. 253  APTO 3', 'E/ JUAN DELGADO Y DESTRAMPES', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15538, 'Indeterminado', 'BATISTAPAU', '30');
INSERT INTO `trabajador` VALUES (1685, 1, 47, 5, 'ROBERTO E', 'NADAL', '59071500707', '0', 'Blanca', 'Medio', '9no Grado', 1973, 0, 0, 'Solt.', 'CALLE CALZADA DE MANAGUA NO. 307', 'E/ LUNA Y ALEGRIA', 314, 'R127 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15539, 'Indeterminado', 'SANTIAGO', '193');
INSERT INTO `trabajador` VALUES (1686, 1, 46, 5, 'JOSE FRANCISCO', 'ACOSTA', '63110112106', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1992, 0, 0, 'Cas.', 'EDIFICIO H 64', 'ZONA NO. 14 ALAMAR', 306, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15543, 'Indeterminado', 'RODRIGUEZ', '190');
INSERT INTO `trabajador` VALUES (1687, 1, 6, 2, 'MIGUEL A.', 'GARCIA', '69020511729', '0', 'Blanca', 'Medio', '9no Grado', 1985, 0, 0, 'Solt.', 'CALLE MARIA AUXILIADORA NO. 5B', 'E/ 2DA Y 3RA', 314, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15544, 'Indeterminado', 'HERNANDEZ', '0');
INSERT INTO `trabajador` VALUES (1688, 7, 41, 43, 'ALBERTO', 'ARIAS', '66041200742', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Planificación', 1984, 0, 0, 'Cas.', ' PEDRO PERNAS No 476', 'E/ JUAN ALONSO Y TERESA BLANCO   LUYANO', 309, NULL, 'FE: Formación Especial', 2218, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15546, 'Indeterminado', 'RODRIGUEZ', '24');
INSERT INTO `trabajador` VALUES (1689, 7, 57, 2, 'GIRALDO', 'LLANOS', '71112601949', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2012, 0, 0, 'Cas.', 'CARMEN   No.8807', 'SAN ANTONIO Y MEIRELES   RPTO PONCE', 314, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15549, 'Indeterminado', 'MONTEAGUDO', '42');
INSERT INTO `trabajador` VALUES (1690, 4, 56, 2, 'LAZARO', 'LOZADA', '61121715008', '0', 'Blanca', 'Medio', '9no Grado', 2009, 0, 0, 'Cas.', 'CALLE 371 NO. 17838', '178 Y 184', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15550, 'Indeterminado', 'RODRIGUEZ', '234');
INSERT INTO `trabajador` VALUES (1691, 7, 56, 2, 'FILIBERTO', 'VARGAS', '53082200560', '0', 'Blanca', 'Sin Título', 'Ninguno', 0, 0, 0, 'Cas.', 'B    No. 213', ' 9 Y 10       LAWTON', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15551, 'Indeterminado', 'RODRIGUEZ', '243');
INSERT INTO `trabajador` VALUES (1692, 8, 56, 2, 'JUAN MIGUEL', 'GALAN', '57070512402', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Solt.', 'CALLE35  No 2603', 'E/ 26 y 30', 301, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15552, 'Indeterminado', 'VERDECIA', '231');
INSERT INTO `trabajador` VALUES (1693, 1, 56, 2, 'JUAN VLADIMIR', 'LOPEZ', '58112428924', '0', 'Negra', 'Medio', '9no Grado', 1976, 0, 0, 'Solt.', 'CALLE  373  No. 16622   apto 22', '166   y   178     RPTO CALVARIO', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15553, 'Indeterminado', 'ARREBATO', '50');
INSERT INTO `trabajador` VALUES (1694, 7, 56, 2, 'EUGENIO', 'RIVERO', '67090619688', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1984, 0, 0, 'Solt.', ' HIDALGO   No. 602', 'SAN PEDRO Y COLON   NUEVO VEDADO', 302, NULL, 'Se evacua', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15554, 'Indeterminado', 'FALCON', '32');
INSERT INTO `trabajador` VALUES (1695, 7, 52, 46, 'SERGIO', 'OSORIO', '65102116267', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Producción Metales Ferrosos', 1981, 0, 0, 'Cas.', 'PEREZ   No.509', 'MELONES    Y   JOSE  ENRIQUEZ    LUYANO', 309, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15558, 'Indeterminado', 'PUENTES', '241');
INSERT INTO `trabajador` VALUES (1696, 8, 56, 2, 'RICARDO', 'DE PEÑA', '69082800265', '0', 'Blanca', 'Medio', '9no Grado', 1986, 0, 0, 'Cas.', 'CALLE 36 B NO. 10914', 'E/ 109 Y 111', 315, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15559, 'Indeterminado', 'PEREDA', '4');
INSERT INTO `trabajador` VALUES (1697, 8, 56, 2, 'JESUS', 'GARCIA', '71120312384', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Comunic. Teleg. y Tx. Datos', 1991, 0, 0, 'Solt.', 'CALLE ENTRADA NO. 112', 'E/ C Y AMARGURA', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15560, 'Indeterminado', 'RIVERON', '231');
INSERT INTO `trabajador` VALUES (1698, 7, 56, 2, 'LUIS GABRIEL', 'MEJIA', '62032400761', '0', 'Blanca', 'Medio', '9no Grado', 1979, 0, 0, 'Cas.', '  C    No. 70     apto 3', 'ENTRADA   Y     CALVARIO  RPTO  CALVARIO', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15561, 'Indeterminado', 'ALONSO', '258');
INSERT INTO `trabajador` VALUES (1699, 8, 56, 2, 'JORGE JESUS', 'CHORENS', '69101562348', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1989, 0, 0, 'Solt.', 'CALLE SANTA FELICIA NO. 119', 'E/ LUCO Y VILLANUEVA', 309, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15562, 'Indeterminado', 'DEL SOL', '41');
INSERT INTO `trabajador` VALUES (1700, 1, 52, 3, 'ERICK', 'BAÑOS', '76120802423', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'CALLE VENTO 2 A NO. 1022', 'E/ VENTO Y VENTO OESTE', 310, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15563, 'Indeterminado', 'PORTES', '228');
INSERT INTO `trabajador` VALUES (1701, 8, 57, 2, 'LUIS', 'ESTRADA', '62072226563', '0', 'Mestiza', 'Medio', '9no Grado', 2006, 0, 0, 'Cas.', 'CALLE PASAJE TERESITA NO. 10', 'E/ OCTAVA Y PORVENIR', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15564, 'Indeterminado', 'VALDES', '1');
INSERT INTO `trabajador` VALUES (1702, 1, 56, 2, 'ERNESTO', 'DUHARTE', '65110927622', '0', 'Mestiza', 'Medio', '9no Grado', 1988, 0, 0, 'Cas.', '37  No. 4812  apto 1', '48  y  50    RESIDENCIAL  ALMENDARES', 301, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15566, 'Indeterminado', 'VEIGLEI', '20');
INSERT INTO `trabajador` VALUES (1703, 1, 58, 2, 'VICTOR', 'GONZALEZ', '59042801760', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1985, 0, 0, 'Solt.', 'SUZARTE NO.423 APTO H', 'ENTRE CEPERO Y ARZOBISPO', 310, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15568, 'Indeterminado', 'PEREZ', '270');
INSERT INTO `trabajador` VALUES (1704, 8, 58, 2, 'RENE', 'CORTINA', '62011800728', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1985, 0, 0, 'Solt.', 'CALLE GERTRUDIS NO. 576', 'E/ ANITA Y FINLAY', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15569, 'Indeterminado', 'MENA', '277');
INSERT INTO `trabajador` VALUES (1705, 8, 56, 2, 'ARIEL', 'LUGO', '70012614641', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1989, 0, 0, 'Cas.', 'CALLE 3RA NO. 23707', 'E/ 1RA Y 2DA', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15573, 'Indeterminado', 'HERN NDEZ', '38');
INSERT INTO `trabajador` VALUES (1706, 1, 56, 2, 'JUAN EMERIO', 'GIL', '46012701529', '0', 'Blanca', 'Sin Título', 'Ninguno', 0, 0, 0, 'Cas.', ' LACRET   No.171', 'OFARRILL Y HEREDIA  SANTOS  SUAREZ', 309, NULL, 'No incorporado', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15576, 'Indeterminado', 'GIL', '228');
INSERT INTO `trabajador` VALUES (1707, 6, 73, 41, 'DAYAMI', 'GARROTE', '70021926576', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 2006, 0, 0, 'Solt.', 'AVE. CIUDAD MAR NO. 3836', 'ESQ. A PASAJE MADRID', 308, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15580, 'Indeterminado', 'HERNANDEZ', '33');
INSERT INTO `trabajador` VALUES (1708, 6, 54, 4, 'PEDRO', 'MORGADO', '55071708286', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'CALLE H NO. 8013', 'E/ 3RA Y DOLORES', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15581, 'Indeterminado', 'MARTINEZ', '266');
INSERT INTO `trabajador` VALUES (1709, 5, 39, 41, 'YOANIS', 'LA CRUZ', '72011006534', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Cas.', 'AVE. 69 NO. 4605', 'E/ 46 Y 48', 315, 'R049 02.04.2012', 'No incorporado', 2419, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 15582, 'Indeterminado', 'DIAZ', '296');
INSERT INTO `trabajador` VALUES (1710, 6, 73, 41, 'LISSETTE', 'CORONADO', '71092102259', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1990, 0, 0, 'Solt.', 'EDIFICIO 67 A APTO.17', 'REPARTO ALBERRO', 315, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15584, 'Indeterminado', 'ALBELO', '120');
INSERT INTO `trabajador` VALUES (1711, 5, 73, 41, 'YAMILA', 'CRUZ', '71032801372', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'EDIFICIO 14 APTO.27', 'CUATRO CAMINOS', 315, 'R069 02.04.2012', 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15586, 'Indeterminado', 'FABRE', '128');
INSERT INTO `trabajador` VALUES (1712, 5, 15, 24, 'NIURKA', 'LA CRUZ', '70030227890', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 36 B NO. 10914', 'E/ 109 Y 111', 315, 'R100 12.04.2012', 'BPD Centro de Trabajo', 1095, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15587, 'Indeterminado', 'COBALLE', '47');
INSERT INTO `trabajador` VALUES (1713, 6, 56, 2, 'ALEJANDRO O.', 'MATOS', '62051715345', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Cas.', 'CALLE 4TA NO. 119', 'E/ B Y GUACHINANGA', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15589, 'Indeterminado', 'RODRIGUEZ', '44');
INSERT INTO `trabajador` VALUES (1714, 6, 56, 2, 'BERTO', 'HERNANDEZ', '67030302302', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Audio', 1986, 0, 0, 'Cas.', 'CALLE CALZADA DE GUINES NO. 805', 'E/ PEPE PRIETO Y MIRANDA', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15590, 'Indeterminado', 'DIAZ', '50');
INSERT INTO `trabajador` VALUES (1715, 5, 56, 41, 'LEONARDO', 'JAMERSON', '52110310684', '0', 'Negra', 'Sin Título', 'Ninguno', 0, 0, 0, 'Cas.', 'CALLE BELTRAN NO. 19313', 'REPARTO JACOMINO', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 15591, 'Indeterminado', 'RODRIGUEZ', '25');
INSERT INTO `trabajador` VALUES (1716, 5, 56, 41, 'NORBERTO', 'MILAN', '59072001722', '0', 'Negra', 'Medio', '9no Grado', 1985, 0, 0, 'Solt.', 'CALLE 5TA EDIF. 922', 'REPARTO CHIVAS', 307, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 15592, 'Indeterminado', 'VARGAS', '48');
INSERT INTO `trabajador` VALUES (1717, 5, 53, 46, 'JORGE', 'TORRES', '70041001469', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1989, 0, 0, 'Cas.', 'CALLE PASAJE MADRID NO. 3411', 'E/ RICO Y ARTOLA', 308, 'R053 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15593, 'Indeterminado', 'RUISANCHEZ', '7');
INSERT INTO `trabajador` VALUES (1718, 5, 58, 41, 'CARLOS ANDRES', 'OROPEZA', '65113004588', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Conformación de Metales', 1983, 0, 0, 'Cas.', 'CALLE C NO. 8707', 'E/ STINGER Y ACOSTABELO', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15594, 'Indeterminado', 'SANTANA', '21');
INSERT INTO `trabajador` VALUES (1719, 6, 58, 2, 'CRISTOBAL', 'CHE', '56111601806', '0', 'Negra', 'Sin Título', 'Ninguno', 0, 0, 0, 'Solt.', 'CALLE 3RA NO. 25303', 'E/ MARTI Y 2DA', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15595, 'Indeterminado', 'SOLER', '6');
INSERT INTO `trabajador` VALUES (1720, 5, 58, 41, 'UDIPY ORESTES', 'RODRIGUEZ', '63060508704', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2005, 0, 0, 'Solt.', 'CALLE 4TA NO. 24105', 'E/ CENTRAL Y 1RA', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15597, 'Indeterminado', 'GONZALEZ', '249');
INSERT INTO `trabajador` VALUES (1721, 1, 27, 43, 'ARMANDO RUFINO', 'RANZOLA', '60022802400', '0', 'Blanca', 'Medio', '9no Grado', 1982, 0, 0, 'Cas.', 'CALLE 15 NO. 369', 'E/ TEJAR Y POCITO', 309, NULL, 'FE: Formación Especial', 1633, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15602, 'Indeterminado', 'BATISTA', '218');
INSERT INTO `trabajador` VALUES (1722, 4, 73, 43, 'LIBIA', 'GONZALEZ', '67062513751', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1986, 0, 0, 'Cas.', 'CALLE 180 NO. 26313', 'E/ 255 Y 259  RIO VERDE', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15604, 'Indeterminado', 'PINO', '37');
INSERT INTO `trabajador` VALUES (1723, 1, 41, 27, 'MIDIALA', 'SACASA', '69073014297', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 1RA EDIFICIO  LENIN 1', 'D  Y 14  RPTO. ALKAZAR', 314, NULL, 'No incorporado', 2218, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15605, 'Indeterminado', 'GARCÍA', '337');
INSERT INTO `trabajador` VALUES (1724, 4, 73, 19, 'GREYTTI', 'PEREZ', '72010201018', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', 'CALLE 379  NO. 37706', '164   Y  166   MULGOBA', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15608, 'Indeterminado', 'CHIRINO', '118');
INSERT INTO `trabajador` VALUES (1725, 4, 73, 43, 'MADELYN DE LA CARIDAD', 'CORZO', '70102801912', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1989, 0, 0, 'Cas.', 'Paco No. 451 apto. 6', 'E/  3ra. y Hernán Behn Víbora Park', 314, 'R065 02.04.2012', 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15610, 'Indeterminado', 'GUEDES', '12');
INSERT INTO `trabajador` VALUES (1726, 1, 47, 5, 'JOSE  RAMÓN', 'CORRALES', '47120100745', '0', 'Blanca', 'Sin Título', 'Ninguno', 0, 0, 0, 'Cas.', 'CALLE ABRIL NO. 10412', 'E/ FLORES Y LA PASTORA', 313, 'R128 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15612, 'Indeterminado', 'CORRALES', '210');
INSERT INTO `trabajador` VALUES (1727, 1, 46, 5, 'MANUEL', 'PEDROSO', '63010103465', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE G NO. 20503', ' CALZADA DE ALDAY Y SEGUNDA', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15614, 'Indeterminado', 'ALFONSO', '211');
INSERT INTO `trabajador` VALUES (1728, 1, 46, 5, 'LEONIDES OSMARO', 'VALIENTE', '62042214722', '0', 'Mestiza', 'Medio', '9no Grado', 1976, 0, 0, 'Solt.', 'CALZADA DE REGLA NO. 204', 'E/ REYNALDO CRUZ Y JULIO GARCIA', 305, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15616, 'Indeterminado', 'OLIVA', '236');
INSERT INTO `trabajador` VALUES (1729, 1, 46, 5, 'JULIO  ANTONIO', 'PUENTES', '68022526242', '0', 'Blanca', 'Medio', '9no Grado', 1983, 0, 0, 'Cas.', 'CALLE CHURRUCA NO. 465', ' VELARDE Y WASHINTONG LAS CAÑAS', 310, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15618, 'Indeterminado', 'PEREZ', '48');
INSERT INTO `trabajador` VALUES (1730, 1, 57, 2, 'ISBERT', 'ROMERO', '70061914064', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 8VA NO. 17105', ' 1RA Y 3RA    LA FORTUNA', 313, 'RO010 02.04.201', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15619, 'Indeterminado', 'ALAMBARRI', '197');
INSERT INTO `trabajador` VALUES (1731, 4, 56, 2, 'ROGELIO', 'MIRABAL', '64012028589', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1990, 0, 0, 'Cas.', 'CALLE 190 NO. 40714', 'E/ 407 Y 409 STGO DE LAS VEGAS', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15621, 'Indeterminado', 'LOPEZ', '5');
INSERT INTO `trabajador` VALUES (1732, 4, 56, 2, 'ERNESTO', 'ORTEGA', '69081803260', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1988, 0, 0, 'Cas.', 'CALLE 6 NO. 13211', 'EMBIL Y P. OESTE', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15622, 'Indeterminado', 'GARCIA', '265');
INSERT INTO `trabajador` VALUES (1733, 4, 55, 46, 'ROBERTO', 'VAZQUEZ', '55120400624', '0', 'Blanca', 'Medio', '9no Grado', 1970, 0, 0, 'Cas.', 'CALLE 371  EDIF.23 APTO.13', '178 Y 166', 313, NULL, 'Se evacua', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15623, 'Indeterminado', 'BORGES', '248');
INSERT INTO `trabajador` VALUES (1734, 4, 58, 2, 'PEDRO', 'IZQUIERDO', '62090905123', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2004, 0, 0, 'Cas.', 'CALLE 80 NO. 4307', 'E/ 43 Y 45', 311, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15625, 'Indeterminado', 'CANO', '246');
INSERT INTO `trabajador` VALUES (1735, 1, 73, 52, 'AUDHY', 'ORIA', '72051717824', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Biología Marina', 1992, 0, 0, 'Solt.', 'PASAJE  GENERAL LEE NO.5', ' 10 DE OCTUBRE Y RABI', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15626, 'Indeterminado', 'CALVO', '108');
INSERT INTO `trabajador` VALUES (1736, 3, 56, 2, 'ALEXIS', 'MARTÍN-CARRERA', '50102701946', '0', 'Blanca', 'Medio', '9no Grado', 2006, 0, 0, 'Cas.', 'CALLE 13 NO.19825', '12  Y  14  SANTIAGO LAS VEGAS', 313, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15627, 'Indeterminado', 'VAZQUEZ', '41');
INSERT INTO `trabajador` VALUES (1737, 3, 57, 2, 'JORGE RAFAEL', 'GUILARTE', '70011002760', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CALLE 5TA NO. 11606', ' 6TA Y PASAJE ELIAS  FORTUNA', 313, 'R113 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15628, 'Indeterminado', 'ERCIA', '197');
INSERT INTO `trabajador` VALUES (1738, 4, 58, 2, 'HERIBERTO', 'CAPOTE', '68082319605', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Fundición', 1987, 0, 0, 'Solt.', 'CALLE 379 NO. 16806', ' 178 A  Y 178  MULGOBA', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15629, 'Indeterminado', 'MARTINEZ', '0');
INSERT INTO `trabajador` VALUES (1739, 3, 58, 2, 'ANGEL FLORENCIO', 'GONZALEZ', '55120222961', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Maestro Primaria', 1992, 0, 0, 'Cas.', ' 2DA  EDIFICIO B', 'B   Y   C   POEY', 314, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15632, 'Indeterminado', 'PADRÓN', '43');
INSERT INTO `trabajador` VALUES (1740, 4, 57, 2, 'REYMUNDO', 'SANCHEZ', '67071519146', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Hidraúlica', 1985, 0, 0, 'Solt.', 'CALLE 283 NO. 18804', ' 184 Y 188  BALUARTE', 313, 'R044 02.04.2012', 'FE: Formación Especial', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15633, 'Indeterminado', 'RODRIGUEZ', '42');
INSERT INTO `trabajador` VALUES (1741, 3, 56, 2, 'VICENTE', 'GRAVERÁN', '68123111368', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'PERSEVERANCIA NO.263', 'NEPTUNO Y CONCORDIA', 303, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15634, 'Indeterminado', 'PEDROSO', '1');
INSERT INTO `trabajador` VALUES (1742, 4, 55, 4, 'JAVIER LAZARO', 'CABRERA', '71070201469', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Viales', 1989, 0, 0, 'Cas.', 'CALLE 415 NO. 18422B', 'E/ 184 Y 186  LÍDICE', 313, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 15635, 'Indeterminado', 'PADILLA', '12');
INSERT INTO `trabajador` VALUES (1743, 1, 56, 2, 'SILVIO', 'PAEZ', '81110406422', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1996, 0, 0, 'Solt.', 'CALLE 37 NO. 8611 APTO. 1', '86 Y 88', 311, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15642, 'Indeterminado', 'PEDROSO', '264');
INSERT INTO `trabajador` VALUES (1744, 3, 73, 43, 'IRINA', 'CORONA', '71070110333', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1992, 0, 0, 'Solt.', 'ANTONIO MACEO EDIF.1 APTO.19', ' MARTI Y MELLA', 314, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15643, 'Indeterminado', 'RIFFÁ', '89');
INSERT INTO `trabajador` VALUES (1745, 1, 56, 2, 'HUMBERTO', 'REYES', '52032501624', '0', 'Blanca', 'Medio', '9no Grado', 1970, 0, 0, 'Cas.', '252 no3501 APTO 5', '35 Y 37 SAN AGUSTIN', 312, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15644, 'Indeterminado', 'CRESPO', '243');
INSERT INTO `trabajador` VALUES (1746, 1, 58, 2, 'YAMELL JESÚS', 'CHUFFAT', '83122528026', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 2003, 0, 0, 'Solt.', 'CALLE HORNOS NO. 12', ' PRINCIPE Y 25', 303, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15645, 'Indeterminado', 'RENSOLI', '25');
INSERT INTO `trabajador` VALUES (1747, 7, 73, 41, 'SAYLIN', 'GONZALEZ', '77103005790', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1997, 0, 0, 'Cas.', 'CALLE E NO. 56 apto 3', 'E/ LUZ Y ARMAS', 309, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15646, 'Indeterminado', 'FIGUEREDO', '111');
INSERT INTO `trabajador` VALUES (1748, 1, 48, 5, 'RAMON', 'NUÑEZ', '71112402280', '0', 'Blanca', 'Medio', '9no Grado', 2007, 0, 0, 'Solt.', ' PARQUE NO. 511', ' OFARRIL Y PATROCINIO', 309, NULL, 'No incorporado', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15648, 'Indeterminado', 'GONZALEZ', '4');
INSERT INTO `trabajador` VALUES (1749, 1, 11, 22, 'GLORIA E', 'LOPEZ', '73112912518', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones', 2004, 0, 0, 'Solt.', 'AVE,. 247 NO. 9205', 'E/ 92 Y 92 A', 308, 'R070.03.11.2015', 'No incorporado', 3152, 'CUP', 'Cuadros', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15659, 'Indeterminado', 'RAMIREZ', '35');
INSERT INTO `trabajador` VALUES (1750, 3, 56, 2, 'EUGENIO', 'ALVAREZ', '58060205426', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'CALLE 3RA NO.3 CARRETERA DEL RINCON', 'REPARTO MI RANCHO', 205, NULL, 'Se evacua', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15689, 'Indeterminado', 'SARDIÑAS', '26');
INSERT INTO `trabajador` VALUES (1751, 6, 56, 2, 'JOSE', 'NODARSE', '66020514704', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1985, 0, 0, 'Cas.', 'CALLE MAYOR NO. 22', 'E/ CALZADA DE GUINES Y FERNANDA', 308, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 15713, 'Indeterminado', 'PALOMINO', '268');
INSERT INTO `trabajador` VALUES (1752, 5, 3, 24, 'JORGE', 'ALVAREZ', '70112317907', '0', 'Mestiza', 'Medio', '9no Grado', 2007, 0, 0, 'Cas.', 'CALLE 1RA NO. 11431', 'E/ 3RA Y 8VA', 313, NULL, 'FE: Formación Especial', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15841, 'Indeterminado', 'SERRANO', '32');
INSERT INTO `trabajador` VALUES (1753, 3, 52, 46, 'YANS', ' SAN MIGUEL', '80102606360', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Mecánica de Taller', 1999, 0, 0, 'Cas.', 'CALLE 168 NO. 37931', 'E/ 379 Y 385', 313, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15858, 'Indeterminado', 'WONG', '226');
INSERT INTO `trabajador` VALUES (1754, 5, 73, 41, 'MARIO ALBERTO', 'SOSA', '85092308003', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2004, 0, 0, 'Solt.', 'VISTA ALEGRE #25 APTO 1', 'E/ SAN LÁZARO Y BUENAVENTURA, LAWTON', 309, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 15865, 'Indeterminado', 'NUÑEZ', '47');
INSERT INTO `trabajador` VALUES (1755, 3, 73, NULL, 'YADIRA', 'ALONSO', '85080405857', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2004, 0, 0, 'Solt.', ' APONTE NO. 218', ' MISION Y ARSENAL', 304, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 15869, 'Indeterminado', 'MENDEZ', '123');
INSERT INTO `trabajador` VALUES (1756, 8, 73, 41, 'ARIANNY', 'INFANTE', '84060624351', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comunicaciones', 2003, 0, 0, 'Cas.', '19 # 411 APTO.3', 'E/ F Y G', 302, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15870, 'Indeterminado', 'ANGULO', '84');
INSERT INTO `trabajador` VALUES (1757, 7, 73, 43, 'ANADEIVIS', 'JIMENEZ', '88090640650', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2007, 0, 0, 'Solt.', 'CALLE PINAR DEL RIO Edif.401 apto13', 'E/ SAN JUAN Y CERVANTES  RPTO CALLEJAS', 314, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15893, 'Indeterminado', 'OJEDA', '91');
INSERT INTO `trabajador` VALUES (1758, 1, 25, 6, 'PEDRO EMILIO', 'PUPO', '53101900609', '0', 'Negra', 'Superior', 'Ing. Textil', 1978, 0, 0, 'Cas.', 'CALLE 244 EDIF 57 APTO 13', 'E/ 247 Y 249 RPTO. ABEL STA. MARÍA', 313, 'R109 02.04.2012', 'FE: Formación Especial', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15903, 'Indeterminado', 'BRIÑAS', '272');
INSERT INTO `trabajador` VALUES (1759, 1, 62, 27, 'HILDA', 'ACOSTA', '48022110613', '0', 'Negra', 'Medio', '9no Grado', 1971, 0, 0, 'Cas.', 'LAGUERUELA   APTO 6 NO.54', 'AGUSTINA Y REVOLUCIÓN', 309, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15933, 'Indeterminado', 'AMADOR', '316');
INSERT INTO `trabajador` VALUES (1760, 1, 27, 48, 'WALFRIDO I.', 'RODRÍGUEZ', '65010715260', '0', 'Mestiza', 'Superior', 'Ing. en Telecomunicaciones', 2002, 0, 0, 'Solt.', 'LA SOLA NO.111', 'ESTRADA PALMA Y LUIS ESTEVEZ', 309, NULL, 'FE: Formación Especial', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15940, 'Indeterminado', 'VALDÉS', '31');
INSERT INTO `trabajador` VALUES (1761, 7, 73, 19, 'MAYELIN', 'COBIELLAS', '75092903172', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2007, 0, 0, 'Cas.', 'PASAJE  5  No.13', 'e/     C     y    D       LAWTON', 309, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 15943, 'Indeterminado', 'TRUJILLO', '21');
INSERT INTO `trabajador` VALUES (1762, 1, 62, 27, 'BARBARA JACQUELINE', 'PONS', '69010119096', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Cas.', 'LACRET 670 APTO 9', 'E/PASAJE OESTE Y VIA BLANCA STOS SUAREZ', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15958, 'Indeterminado', 'ARMARIO', '40');
INSERT INTO `trabajador` VALUES (1763, 1, 62, 27, 'MIRIAN', 'FERNANDEZ', '67090628297', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Cas.', 'CALLE HEREDIA # 453 APTO 4', 'E/ PATROCINIO Y CARMEN. VIBORA', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15959, 'Indeterminado', 'SOCARRÁS', '307');
INSERT INTO `trabajador` VALUES (1764, 8, 12, 37, 'ALEIDA', 'FERNANDEZ', '61060601978', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Cas.', 'CALLE REFORMA # 407 BAJOS', 'E/ MUNICIPIO Y RODRIGUEZ LUYANO', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 15971, 'Indeterminado', 'CARRERAS', '132');
INSERT INTO `trabajador` VALUES (1765, 1, 62, 27, 'DAINYS', 'MAYOL', '78121306096', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1999, 0, 0, 'Cas.', 'CALLE DUREGE # 314', 'E/ ZAPOTE Y SAN BERNANDINO SANTOS SUÁREZ', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15975, 'Indeterminado', 'REGALADO', '309');
INSERT INTO `trabajador` VALUES (1766, 1, 62, 27, 'HEIDYTH', 'PEREZ', '75041832132', '0', 'Negra', 'Medio Superior', '12mo Grado', 1993, 0, 0, 'Cas.', 'CALLE 66 B # 29F03', ' E/ 29 Y 31 BUENAVISTA', 301, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15978, 'Indeterminado', 'SAEZ', '30');
INSERT INTO `trabajador` VALUES (1767, 1, 62, 27, 'ODDEY', 'MOLA', '72072807919', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1990, 0, 0, 'Solt.', 'CALLE D No 19 APTO 7', 'E/ A Y ARELLANO RPTO LAWTON', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 15990, 'Indeterminado', 'LOPEZ', '317');
INSERT INTO `trabajador` VALUES (1768, 8, 27, 19, 'MAIRA', 'FONSECA', '61022030395', '0', 'Mestiza', 'Superior', 'Ing. Mecánico', 1985, 0, 0, 'Viud.', 'CALLE A NO 268', '/ ALAMO Y MENDOZA', 314, NULL, 'No incorporado', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 16025, 'Indeterminado', 'CEDEÑO', '32');
INSERT INTO `trabajador` VALUES (1769, 1, 62, 27, 'MERCEDES', 'REYES', '58072709070', '0', 'Negra', 'Superior', 'Lic. en Educación', 1982, 0, 0, 'Cas.', 'CALLE E NO.25', '1ERA Y 2DA', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16038, 'Indeterminado', 'RODRIGUEZ', '41');
INSERT INTO `trabajador` VALUES (1770, 1, 62, 27, 'YAMIRA', 'LINARES', '73022501415', '0', 'Negra', 'Medio Superior', '12mo Grado', 1991, 0, 0, 'Cas.', 'PORVENIR 615', 'CONCEPCIÓN Y DOLORES', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16045, 'Indeterminado', 'MACHADO', '330');
INSERT INTO `trabajador` VALUES (1771, 1, 62, 27, 'IDALMIS', 'CAMPO', '70120518533', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1989, 0, 0, 'Solt.', 'CALLE ESPERANZA No 421', 'E/ CHAPLE Y SUZARTE CERRO', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16050, 'Indeterminado', 'CARRAZANA', '41');
INSERT INTO `trabajador` VALUES (1772, 1, 62, 27, 'MAYULY', 'PEDROSO', '77012505730', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Comercio', 1997, 0, 0, 'Solt.', 'CALLE LIBERTAD 416', 'JUAN DELGADO Y D\'ESTRAMPES', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16061, 'Indeterminado', 'ORBAY', '26');
INSERT INTO `trabajador` VALUES (1773, 7, 12, 35, 'ALICIA DEL CARMEN', 'MANDADO', '74081813632', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1992, 0, 0, 'Cas.', 'CZDA  DE LUYANO NO. 105', 'ACIERTO Y ATARES   LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 16064, 'Indeterminado', 'DOMINGUEZ', '156');
INSERT INTO `trabajador` VALUES (1774, 3, 12, 29, 'MARIA ELENA', 'DELGADO', '69041211732', '0', 'Negra', 'Medio Superior', '12mo Grado', 1987, 0, 0, 'Solt.', 'CALLE E EDIF.37 NO.15063', ' 1ERA   Y 3ERA', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 16069, 'Indeterminado', 'PEREZ', '131');
INSERT INTO `trabajador` VALUES (1775, 3, 12, 29, 'MARIA CARIDAD', 'DELGADO', '68022611071', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'CALLE E NO.15808   APTO.10', ' N Y 12', 313, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 16070, 'Indeterminado', 'PEREZ', '140');
INSERT INTO `trabajador` VALUES (1776, 5, 76, 24, 'CARMEN', 'CORREA', '62121301997', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', ' EDIFICIO NO.46  apto 25', 'REPARTO   ALBERRO', 315, 'R101 13.04.2012', 'BPD Centro de Trabajo', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 16084, 'Indeterminado', 'MACHADO', '11');
INSERT INTO `trabajador` VALUES (1777, 5, 12, 31, 'YONAISA', 'BECERÁ', '78072107274', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Construcción Civil', 1997, 0, 0, 'Cas.', 'CALLE EDIFICIO NO.27   APTO.19', 'REPARTO: ALBERRO.', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 16089, 'Indeterminado', 'GARCIA', '152');
INSERT INTO `trabajador` VALUES (1778, 5, 12, 31, 'REGLA YANET', 'LEYVA', '74053024916', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Construcción Civil', 1992, 0, 0, 'Solt.', 'CALLE 30 NO.10310', '103 Y 105', 315, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 16103, 'Indeterminado', 'RODRIGUEZ', '38');
INSERT INTO `trabajador` VALUES (1779, 8, 37, 19, 'ARELYS', 'ESTRADA', '75073002959', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad y Finanzas', 2008, 0, 0, 'Solt.', 'CALLE DAOIS NO.223', 'PRENSA Y PRIMELLES.', 310, NULL, 'No incorporado', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 16289, 'Indeterminado', 'GUZMAN', '26');
INSERT INTO `trabajador` VALUES (1780, 4, 12, 39, 'AMARILYS', 'VAZQUEZ', '93113032359', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2011, 0, 0, 'Solt.', 'CALLE 166 No.37724', 'entre 377 y 385', 313, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 20244, 'Indeterminado', 'FONSECA', '115');
INSERT INTO `trabajador` VALUES (1781, 1, 62, 27, 'RAISA', 'VEGA', '65011910978', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1984, 0, 0, 'Cas.', 'GERTRUDIS 156A APTO 1', 'GELABERT Y AVELLANEDA', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16305, 'Indeterminado', 'Asín', '51');
INSERT INTO `trabajador` VALUES (1782, 1, 27, 22, 'LAURA MARIA', 'RIVAS', '76040717037', '0', 'Blanca', 'Superior', 'Ing. en Informática', 2014, 0, 0, 'Solt.', 'AVE.101 EDIF .2203   APTO.5', '22 Y 24', 315, NULL, 'Se evacua', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16357, 'Indeterminado', 'DE ARMAS', '230');
INSERT INTO `trabajador` VALUES (1783, 3, 73, 41, 'RAÚL', 'ROSABAL', '67102119881', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1984, 0, 0, 'Cas.', 'calle 247 Edif.ECOA No.7', '242  y 244 Abel Sta.María Boyeros', 313, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 16362, 'Indeterminado', 'PÉREZ', '108');
INSERT INTO `trabajador` VALUES (1784, 4, 73, 41, 'MAYELINE', 'IZQUIERDO', '71083001632', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1993, 0, 0, 'Solt.', '379 N 37706', 'APTO 4 E/ 164 Y 166  MULGOBA', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16382, 'Indeterminado', 'CEROLO', '42');
INSERT INTO `trabajador` VALUES (1785, 3, 73, 41, 'RAFAEL', 'GARCIA', '49102402668', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1987, 0, 0, 'Solt.', 'QUINTA N 606 BAJOS', '4  Y 6  VEDADO', 302, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 16383, 'Indeterminado', 'CLEOGHORN', '46');
INSERT INTO `trabajador` VALUES (1786, 1, 4, 25, 'LIUBET', 'VARONA', '74012601539', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1994, 0, 0, 'Solt.', 'CALLE 375 N 17832', '178 Y 182 MULGOBA', 313, NULL, 'Se evacua', 880, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16451, 'Indeterminado', 'SANZ', '325');
INSERT INTO `trabajador` VALUES (1787, 1, 31, 47, 'EDUARDO', 'GAMBOA', '57101412343', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Cas.', 'SISNERO VETACUR 1217', 'COTILLA Y 1ERA LOS PINOS', 314, NULL, 'FE: Formación Especial', 961, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16452, 'Indeterminado', 'DÍAZ', '287');
INSERT INTO `trabajador` VALUES (1788, 7, 76, 24, 'RENÉ LUIS', 'PAEZ', '52031002326', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electricidad', 1970, 0, 0, 'Div.', 'LUCO  No. 355 1/2', 'e/n    ARANGO Y MUNICIPIO    LUYANO', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 16457, 'Indeterminado', 'CABALLERO', '177');
INSERT INTO `trabajador` VALUES (1789, 1, 3, 47, 'VIVIANCA', 'AGUILA', '73030216456', '0', 'Blanca', 'Medio', '9no Grado', 1990, 0, 0, 'Solt.', 'RETORNO CN 131', 'RETORNO Y PASEO ALTAHABANA', 313, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16458, 'Indeterminado', 'CABALLERO', '0');
INSERT INTO `trabajador` VALUES (1790, 4, 3, 24, 'ANA LILIA', 'HERNANDEZ', '51052302033', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', 'CALLE 12 N 4707', '11 Y 13 SANTIAGO DE LAS VEGAS', 313, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16461, 'Indeterminado', 'MAZOLA', '0');
INSERT INTO `trabajador` VALUES (1791, 3, 3, 24, 'ILUMINADA ZORAIDA', 'GARCIA', '48112908057', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Solt.', '411 No.19814', '198 Y 200 SANTIAGO DE LAS VEGAS', 313, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 16466, 'Indeterminado', 'HERNANDEZ', '41');
INSERT INTO `trabajador` VALUES (1792, 4, 3, 24, 'MAYDA ROSA', 'LEÓN', '62033112238', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1987, 0, 0, 'Cas.', '134 NO 25721', '/249 Y251 RIO  VERDE', 313, NULL, 'No incorporado', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16467, 'Indeterminado', 'CARMENATE', '1');
INSERT INTO `trabajador` VALUES (1793, 4, 12, 39, 'ARIADNA', 'FERRERA', '85121108415', '0', 'Negra', 'Superior', 'Lic. en Educación Primaria', 2008, 0, 0, 'Solt.', '373 # 16621 apto 3', '166 y 178 Mulgoba', 313, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 22739, 'Indeterminado', 'SUAREZ', '1');
INSERT INTO `trabajador` VALUES (1794, 7, 3, 24, 'HILDA PATRICIA', 'LINARES', '55082500358', '0', 'Mestiza', 'Sin Título', 'Ninguno', 1970, 0, 0, 'Solt.', 'REYES  No  268', 'COLINA  Y   ALTARRIBA       LAWTON', 309, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 16469, 'Indeterminado', 'TORIZA', '21');
INSERT INTO `trabajador` VALUES (1795, 7, 3, 24, 'ADA CRISTINA', 'FERNANDEZ', '64022711914', '0', 'Blanca', 'Medio', '9no Grado', 1983, 0, 0, 'Cas.', 'REYES   No  318   apto 4a', 'LUZ   Y    ALTARRIBA        LAWTON', 309, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 16472, 'Indeterminado', 'MOENCK', '319');
INSERT INTO `trabajador` VALUES (1796, 6, 3, 24, 'ANGELA', 'DELGADO', '58021412751', '0', 'Blanca', 'Medio', '9no Grado', 1987, 0, 0, 'Solt.', 'CALZADA DE GUINES EDF. 1APTO.1', ' VERACRUZ , S.M.P', 308, NULL, 'Se evacua', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 16473, 'Indeterminado', 'RIO', '309');
INSERT INTO `trabajador` VALUES (1797, 1, 65, 47, 'LORAINE', 'PIJEIRA', '62012200159', '0', 'Blanca', 'Medio', '9no Grado', 1976, 0, 0, 'Solt.', 'SAN JULIO N 351', '/ SANTA IRENE Y SAN BERNANDINO SANTOS SU', 309, NULL, 'BPD Área Residencia', 672, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16476, 'Indeterminado', 'RODRIGUEZ', '16');
INSERT INTO `trabajador` VALUES (1798, 7, 3, 24, 'JOSEFINA', 'VALLE', '62010101391', '0', 'Blanca', 'Medio', '9no Grado', 1985, 0, 0, 'Solt.', 'BEALES    No  901', 'FONT   Y   E       LAWTON', 309, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 16481, 'Indeterminado', 'OLIVERA', '41');
INSERT INTO `trabajador` VALUES (1799, 8, 3, 24, 'CARIDAD MONTE DE', 'OCA', '71030501691', '0', 'Blanca', 'Medio', '9no Grado', 1988, 0, 0, 'Cas.', 'GENERAL LIC. N.218 /', ' SAN JULIO Y DUREGE 10 DE OCTUBRE C HABA', 309, NULL, 'No incorporado', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 16482, 'Indeterminado', 'SUAREZ', '40');
INSERT INTO `trabajador` VALUES (1800, 4, 15, 24, 'CARLOS MIGUEL', 'GARCIA', '58070500705', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 1979, 0, 0, 'Solt.', 'CALLE  180 No. 41331(altos)', 'E/ 413 Y 419, LA AURORA', 313, 'R099 02.04.2012', 'BPD Área Residencia', 1095, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16493, 'Indeterminado', 'ALBERTO', '299');
INSERT INTO `trabajador` VALUES (1801, 1, 3, 47, 'MABEL', 'MARTINEZ', '64090632574', '0', 'Blanca', 'Medio', '9no Grado', 1980, 0, 0, 'Cas.', '229 S/N e/ 210 y 214', 'FONTANAR', 313, NULL, 'BPD Área Residencia', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16496, 'Indeterminado', 'ALFONSO', '300');
INSERT INTO `trabajador` VALUES (1802, 1, 59, 47, 'ENRIQUE', 'FERNANDEZ', '52113012609', '0', 'Negra', 'Medio', '9no Grado', 2007, 0, 0, 'Cas.', '251 / 2420Y 244N 24204 APTO 27', 'ABEL SANTA   MARIA', 313, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16503, 'Indeterminado', 'NAVARRETE', '223');
INSERT INTO `trabajador` VALUES (1803, 1, 60, 47, 'ROBERTO', 'MILLARES', '61102614967', '0', 'Negra', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'MILAGRO 58', 'DELICIA Y BUENA VENTURA LAUTON 10 DE OCT', 309, 'R139 02.04.2012', 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16504, 'Indeterminado', 'LEAL', '26');
INSERT INTO `trabajador` VALUES (1804, 1, 68, 26, 'NURIS', 'GUEVARA', '69060200855', '0', 'Negra', 'Medio Superior', '12mo Grado', 1989, 0, 0, 'Cas.', 'GUAIMARO  No 20 e/  SAGUA Y TUNICU', 'RPTO    ALTURAS   VIBORA', 314, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16510, 'Indeterminado', 'TORRES', '48');
INSERT INTO `trabajador` VALUES (1805, 6, 31, 24, 'BASILIO', 'BERMUDEZ', '63052032105', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Cas.', 'CALLE CENTRALN:10CASA 48', '/ 13Y 23 LA FLORA SAN MIGUEL PADRON C HA', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Servicios', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 16511, 'Indeterminado', 'MONTESINO', '278');
INSERT INTO `trabajador` VALUES (1806, 1, 3, 47, 'MIDALIS', 'SANTANDER', '69043018130', '0', 'Blanca', 'Medio', '9no Grado', 2007, 0, 0, 'Cas.', '  CALLE 2DA', ' PACO Y QUEZEL N. 407 APTO 1 ARROYO NARA', 314, NULL, 'No incorporado', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16515, 'Indeterminado', 'PUENTE', '291');
INSERT INTO `trabajador` VALUES (1807, 1, 64, 45, 'HISBERTY', 'SUAREZ', '84080906820', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2003, 0, 0, 'Solt.', 'CALLE ARTOLA N 17912', ' AMERICA Y PRAGA REPARTO ZICH', 308, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16518, 'Indeterminado', 'HORTA', '50');
INSERT INTO `trabajador` VALUES (1808, 1, 37, 43, 'FERNANDO', 'ECHAZABAL', '58112100445', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transmisión', 1978, 0, 0, 'Cas.', 'CALLE 196 #41537', 'E/ 421 Y 413, STGO DE LAS VEGAS', 313, NULL, 'FE: Formación Especial', 2796, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16636, 'Indeterminado', 'PERDOMO', '0');
INSERT INTO `trabajador` VALUES (1809, 8, 12, 37, 'YENIMAR', 'MORFFI', '71011613675', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Teleg.', 1991, 0, 0, 'Cas.', 'DESTRAMPE 114 APTO 3', 'LUZ ESTEVEZ Y ESTRADA PALMA', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 16659, 'Indeterminado', 'MOLINA', '157');
INSERT INTO `trabajador` VALUES (1810, 1, 64, 45, 'LEONEL', 'VÁZQUEZ', '61022718545', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 1986, 0, 0, 'Solt.', 'ESCOBAR #263 PISO 2 APTO.5', 'E/ CONCORDIA Y NEPTUNO', 303, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16664, 'Indeterminado', 'OLIVA', '99');
INSERT INTO `trabajador` VALUES (1811, 7, 12, 35, 'SILVIA', 'ECHEVARRIA', '71102302454', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1989, 0, 0, 'Solt.', 'JUAN BRUNO ZAYAS  NO.564  APTO4', 'AVENIDA DE  ACOSTA  Y  OFARILL    VIBORA', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 16668, 'Indeterminado', 'BECQUER', '119');
INSERT INTO `trabajador` VALUES (1812, 8, 15, 24, 'IMARA', 'IGORRA', '71022810719', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Química Industrial', 1989, 0, 0, 'Solt.', 'REVOLUCION 51 E/', '/ LAGUERUELA Y SAN MIGUEL APTO C VIBORA', 309, 'R125 02.04.2012', 'Se evacua', 1095, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 16683, 'Indeterminado', 'SANTANA', '28');
INSERT INTO `trabajador` VALUES (1813, 6, 15, 24, 'YAMILET  DE LA CARIDAD', 'FONTES', '71042703819', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Secretariado', 1990, 0, 0, 'Solt.', 'SAN IGNACIO NO 2 APTO 107', ' ENTRE CHACON Y TEJADILLO', 304, 'R120 02.04.2012', 'Se evacua', 1095, 'CUP', 'Servicios', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 16690, 'Indeterminado', 'MUÑOZ', '291');
INSERT INTO `trabajador` VALUES (1814, 1, 6, 1, 'LUIS ALFREDO', 'REYES', '55081902248', '0', 'Blanca', 'Medio', '9no Grado', 2005, 0, 0, 'Cas.', 'CALLE 283 N. 18846', '/ 184 Y 188 RPTO BALUARTE', 313, 'R096 02.04.2012', 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16696, 'Indeterminado', 'FIGUEROA', '48');
INSERT INTO `trabajador` VALUES (1815, 1, 6, 1, 'MAGDIEL', 'REYES', '83050905900', '0', 'Blanca', 'Medio', '9no Grado', 2000, 0, 0, 'Solt.', 'CALLE 283 N.18846', 'E/ 184 Y 188 RPTO BALUARTE', 313, 'R097 02.04.2012', 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16701, 'Indeterminado', 'CASTILLO', '47');
INSERT INTO `trabajador` VALUES (1816, 1, 62, 27, 'HAYDEE', 'RODRÍGUEZ', '62071016070', '0', 'Mestiza', 'Medio', '9no Grado', 1976, 0, 0, 'Solt.', 'ACOSTA  NO. 203 APTO. 8 2DO PISO', 'E/ DAMAS Y HABANA', 304, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 16751, 'Indeterminado', 'PADRÓN', '342');
INSERT INTO `trabajador` VALUES (1817, 7, 12, 35, 'YODARKIS', 'ROJAS', '77071300456', '0', 'Negra', 'Medio Superior', '12mo Grado', 1995, 0, 0, 'Cas.', 'TERESA BLANCO NO. 74', 'e/ INFANZON Y PEDRO PERNAS    LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 16791, 'Indeterminado', 'DÌAZ', '23');
INSERT INTO `trabajador` VALUES (1818, 7, 12, 35, 'LISBETTY', 'GONZALEZ', '85092806970', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2004, 0, 0, 'Solt.', 'D´STRAMPES NO. 63   APTO 6', 'E/ LACRET Y LUIS ESTEVEZ  SANTOS SUAREZ', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 17338, 'Indeterminado', 'GONZALEZ', '140');
INSERT INTO `trabajador` VALUES (1819, 4, 12, 39, 'ANAYS BARBARA', 'VALDES', '92080829874', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Cas.', '24', 'FRANK PAIS', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23299, 'Indeterminado', 'RODRIGUEZ', '50');
INSERT INTO `trabajador` VALUES (1820, 7, 15, 24, 'MERCEDES', 'CABRERA', '53091130057', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Economía del Trabajo', 1993, 0, 0, 'Solt.', 'JUAN  ALONSO  No  511', 'JUAN  ABREU   Y    PEREZ     LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 17383, 'Indeterminado', 'PEREZ', '334');
INSERT INTO `trabajador` VALUES (1821, 5, 12, 31, 'YUDITH', 'RODRIGUEZ', '76031603792', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Química Industrial', 1994, 0, 0, 'Solt.', 'Blanco No. 10124', 'e/ Línea y Central', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 17415, 'Indeterminado', 'ROSAS', '24');
INSERT INTO `trabajador` VALUES (1822, 1, 64, 45, 'RAIMUNDO', 'DIAZ', '61012314666', '0', 'Negra', 'Medio', 'Oficio', 1978, 0, 0, 'Cas.', 'ATARÉS 570', 'E/ SANTA ANA Y CALZADA DE LUYANÓ', 309, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17434, 'Indeterminado', 'PIMIENTA', '76');
INSERT INTO `trabajador` VALUES (1823, 1, 49, 45, 'MIRTHA', 'BACALLAO', '60022409359', '0', 'Blanca', 'Medio', '9no Grado', 1975, 0, 0, 'Cas.', 'RODRÍGUEZ FUENTES #754', 'E/ 15 Y 16 LAWTON', 309, 'R089 02.04.2012', 'BPD Área Residencia', 806, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17441, 'Indeterminado', 'SUAREZ', '6');
INSERT INTO `trabajador` VALUES (1824, 1, 62, 27, 'INES', 'MONAGA', '66092900117', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 1991, 0, 0, 'Cas.', 'INDUSTRIA #269', 'E/ NEPTUNO Y VIRTUDES', 303, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17445, 'Indeterminado', 'HERNANDEZ', '8');
INSERT INTO `trabajador` VALUES (1825, 8, 44, 18, 'NAYLEEN L', 'ANSORENA', '76080703133', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comercio', 1999, 0, 0, 'Cas.', 'CALLE ENTRADA #11011 APTO 9', 'AVENIDA DE LA CEIBA Y H', 310, NULL, 'No incorporado', 1452, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 17448, 'Indeterminado', 'SUAREZ', '31');
INSERT INTO `trabajador` VALUES (1826, 4, 13, 39, 'DIOSALET', 'OLIVA', '96112520194', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2014, 0, 0, 'Solt.', '9 # 2411', '24 Y 26 BEJUCAL', 206, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 26427, 'Indeterminado', 'MARRERO', '246');
INSERT INTO `trabajador` VALUES (1827, 1, 27, 22, 'JULIÁN', 'MAURICE', '47010905427', '0', 'Blanca', 'Superior', 'Ing. en RadioComunicaciones', 1983, 0, 0, 'Solt.', 'Enamorado  N.264 altos', 'Serrano y Durege Santos Suarez', 309, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17532, 'Indeterminado', 'DICET', '19');
INSERT INTO `trabajador` VALUES (1828, 7, 31, 24, 'ORLANDO', 'MORALES', '85012312747', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Servicios Gastronómicos', 2003, 0, 0, 'Solt.', '5ta     No 358   APTO 6', 'B   y    C      VEDADO', 302, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 17536, 'Indeterminado', 'ARBOLAY', '32');
INSERT INTO `trabajador` VALUES (1829, 3, 3, 24, 'NANCY', 'MUÑOZ', '51101908073', '0', 'Blanca', 'Medio', '9no Grado', 2013, 0, 0, 'Solt.', 'ROSITA   14147', 'LILILOY   Y    ARDAY', 313, NULL, 'No incorporado', 739, NULL, 'Servicios', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 17620, 'Indeterminado', 'SUÁREZ', '289');
INSERT INTO `trabajador` VALUES (1830, 1, 30, 22, 'VICTOR FRANCISCO', 'MOISES', '53061600200', '0', 'Negra', 'Superior', 'Ing. en RadioComunicaciones', 1978, 0, 0, 'Cas.', 'Calle 25 Edif. 30, apto 12', 'Esq. 23, Ampliación de San Matías', 308, 'R134 02.04.2012', 'FE: Formación Especial', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17622, 'Indeterminado', 'MONTESINO', '153');
INSERT INTO `trabajador` VALUES (1831, 1, 49, 45, 'JULIA AIMEE', 'FERRERA', '68020700612', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Estadísticas', 1987, 0, 0, 'Cas.', 'ISABEL #65', 'E/ FERNÁNDO Y ESTELA, PÁRRAGA', 314, 'R091 02.04.2012', 'Se evacua', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17624, 'Indeterminado', 'TORRES', '1');
INSERT INTO `trabajador` VALUES (1832, 8, 58, 2, 'REINIER', 'PRIETO', '86092406800', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Enfermeria', 2004, 0, 0, 'Solt.', '24 de Febrero Edid. 10', '5ta.  y  6ta.', 308, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 17625, 'Indeterminado', 'ARGÜELLES', '28');
INSERT INTO `trabajador` VALUES (1833, 8, 13, 18, 'Roxana', 'Cruz', '83100527258', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2008, 0, 0, 'Solt.', 'Edificio SP-16B apto 37', 'Micro x  Alamar', 306, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 17632, 'Indeterminado', 'Díaz', '266');
INSERT INTO `trabajador` VALUES (1834, 1, 22, 6, 'MARIA DEL CARMEN', 'NAVIA', '64012919293', '0', 'Blanca', 'Superior', 'Lic. en Educación Primaria', 1988, 0, 0, 'Solt.', 'ALTARRIBA #7 APTO 2', 'E/ 10 DE OCTUBRE Y DELICIAS', 309, 'R111 02.04.2012', 'FE: Formación Especial', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 17789, 'Indeterminado', 'DIAZ', '48');
INSERT INTO `trabajador` VALUES (1835, 6, 76, 24, 'MAIDE EUGENIA', 'AVILES', '63111503059', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', '19 DE MAYO NO 3 APTO 3', 'AYESTERAN Y AMEZAGA', 302, NULL, 'FE: Formación Especial', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 17979, 'Indeterminado', 'ALVAREZ', '219');
INSERT INTO `trabajador` VALUES (1836, 8, 12, 18, 'DAINERYS', 'TAMAYO', '89042803376', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2008, 0, 0, 'Solt.', 'Calle 37 No.8807', '88  y 90', 311, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 18100, 'Indeterminado', 'HECHAVARRÍA', '7');
INSERT INTO `trabajador` VALUES (1837, 5, 13, 32, 'YISSELL', 'CAROLLO', '85121806770', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2004, 0, 0, 'Solt.', 'CALLE D NO 14221', 'SANTOS Y CARABALLO SAN FCO PAULA', 308, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 18144, 'Indeterminado', 'BELLO', '45');
INSERT INTO `trabajador` VALUES (1838, 5, 12, 31, 'YANET', 'VIERA', '75061025111', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1993, 0, 0, 'Solt.', 'CALLE 95  # 3818 ALTO', ' %  38 Y 40  REPARTO SANTA CLARA', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 18145, 'Indeterminado', 'CASTILLO', '159');
INSERT INTO `trabajador` VALUES (1839, 8, 12, 37, 'KENIA', 'GONZALEZ', '75092526653', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1993, 0, 0, 'Cas.', 'CALLE ALMENDRO', 'EDIFICIO 14 APTO 20 RPTO ELECTRICO', 314, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 18204, 'Indeterminado', 'CAPO', '8');
INSERT INTO `trabajador` VALUES (1840, 1, 1, 22, 'BEATRIZ', 'ARDANZA', '67042301477', '0', 'Blanca', 'Superior', 'Lic. en Derecho', 1992, 0, 0, 'Cas.', 'CALLE ALDABÓ APTO 6, EDIF. 412', '3ra y 4ta REPARTO ALTAHABANA', 313, 'R129 02.04.2012', 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 18210, 'Indeterminado', 'GONZALEZ', '26');
INSERT INTO `trabajador` VALUES (1841, 1, 52, 3, 'OMAR', 'BELTRAN', '65041526589', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1982, 0, 0, 'Cas.', 'APOSTOL NO. 71', 'E/ FINLAY Y NARANJITO', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 18449, 'Indeterminado', 'RODRIGUEZ', '257');
INSERT INTO `trabajador` VALUES (1842, 1, 67, 51, 'MAIKOL', 'LOPEZ', '89021523408', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Explot. Transp. Automotriz', 2008, 0, 0, 'Solt.', 'EDIF. 169 APTO 5', 'E/ 20 Y 22 REPARTO EL ROBLE', 307, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 18588, 'Indeterminado', 'DIAZ', '231');
INSERT INTO `trabajador` VALUES (1843, 1, 23, 21, 'MARIA TERESA', 'DEL OSO', '63011612116', '0', 'Blanca', 'Superior', 'Lic. en Contabilidad y Finanzas', 1989, 0, 0, 'Cas.', 'REYES #395 BAJOS', 'E/ LUZ Y BELLAVISTA', 309, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 18665, 'Indeterminado', 'GARCIA', '270');
INSERT INTO `trabajador` VALUES (1844, 8, 12, 18, 'WENDY', 'FERNANDEZ', '87082008976', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Bibliotecología', 2006, 0, 0, 'Cas.', 'AVE DEL ESTE #10201 APTO 31', 'E/ BLANQUITA Y 3era', 310, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 18699, 'Indeterminado', 'CASTILLO', '157');
INSERT INTO `trabajador` VALUES (1845, 4, 73, 12, 'WENDY', 'ROSSI', '72111102195', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Informática', 1993, 0, 0, 'Solt.', 'Calle 399 No 18806', '% 188 y 190. Santiago de las Vegas', 313, NULL, 'Se evacua', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 18782, 'Indeterminado', 'ALVAREZ', '44');
INSERT INTO `trabajador` VALUES (1846, 1, 71, 21, 'ANA ISABEL', 'FARIÑAS', '63102603397', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Estadística Económica', 1983, 0, 0, 'Solt.', 'LIBERTAD #458 APTO 1', 'E/ JUAN DELGADO Y GOICURÍA', 309, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 18823, 'Indeterminado', 'MORALES', '164');
INSERT INTO `trabajador` VALUES (1847, 4, 54, 4, 'JOSE ALBERTO', 'ALVAREZ', '87061906680', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2006, 0, 0, 'Solt.', 'MALECÓN No. 12', 'E   Y  F', 302, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 18838, 'Indeterminado', 'RODRIGUEZ', '2');
INSERT INTO `trabajador` VALUES (1848, 6, 12, 34, 'YANET', 'SAURA', '83082306679', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Elaboración de Alimentos', 2008, 0, 0, 'Cas.', 'CALLE  8  NO. 5703C  ESQ.  59A', 'RPTO. VEDADO', 315, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 18858, 'Indeterminado', 'ARCE', '137');
INSERT INTO `trabajador` VALUES (1849, 4, 71, 24, 'KIRENIA', 'JULIEN', '78102724633', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Economía', 1997, 0, 0, 'Solt.', 'CALLE 76 NO. 2106', 'ENTRE 21 Y 23 PLAYA', 301, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 18908, 'Indeterminado', 'MESA', '185');
INSERT INTO `trabajador` VALUES (1850, 7, 58, 2, 'ALAIN   DAGOBERTO', 'ACOSTA', '85100104820', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', 'AVENIDA   51    No. 11419', '114 y 116     LOS QUEMADOS', 311, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 18953, 'Indeterminado', 'RODRIGUEZ', '1');
INSERT INTO `trabajador` VALUES (1851, 1, 7, 47, 'NORBERTO', 'VALDES', '57112329969', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Mant. Reparac. de Automovil', 1984, 0, 0, 'Cas.', 'Calle 234, E26, #2701 apto 9', '27 y 27 A', 312, NULL, 'FE: Formación Especial', 1014.9, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 19086, 'Indeterminado', 'HERNANDEZ', '30');
INSERT INTO `trabajador` VALUES (1852, 6, 54, 46, 'DONARDY', 'GRANELA', '82030107842', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2001, 0, 0, 'Cas.', 'CALLE 6TA NO 4809 INTERIOR A', 'CENTRAL Y HERNANDEZ', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 19087, 'Indeterminado', 'FERNANDEZ', '245');
INSERT INTO `trabajador` VALUES (1853, 6, 54, 46, 'ROYLAN', 'RODRIGUEZ', '85101208643', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Instrumentación y Control', 2004, 0, 0, 'Solt.', 'CALLE MACEO NO 7', 'GOMEZ Y ROLOFF RPTO BUENOS AIRES', 314, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 19089, 'Indeterminado', 'MASSÓ', '37');
INSERT INTO `trabajador` VALUES (1854, 5, 55, 4, 'AMED', 'ABAD', '84080812429', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Servicios Gastronómicos', 2003, 0, 0, 'Solt.', 'CALLE 97 NO 3805', '38 Y 40 RPTO LA GRANADA', 315, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 19090, 'Indeterminado', 'LOZANO', '229');
INSERT INTO `trabajador` VALUES (1855, 7, 54, 46, 'YASER', 'GONZALEZ', '82011607663', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Cas.', 'SAN FRANCISCO  No.316', 'ARMAS Y PORVENIR           LAWTON', 309, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 19106, 'Indeterminado', 'RODRIGUEZ', '228');
INSERT INTO `trabajador` VALUES (1856, 1, 24, 23, 'MABEL', 'HERNANDEZ', '87050908912', '0', 'Blanca', 'Superior', 'Lic. en Contabilidad y Finanzas', 2012, 0, 0, 'Cas.', 'PÁRRAGA #16', 'E/ ESTRADA PALMA Y LUÍS ESTÉVEZ', 309, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 19107, 'Indeterminado', 'MARTINEZ', '256');
INSERT INTO `trabajador` VALUES (1857, 3, 54, 46, 'HENRY', 'GARCIA', '88082410261', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2006, 0, 0, 'Solt.', 'CALLE MARTÍ EDIF. 27 APTO', '6 ta. y 7 ma.  REPARTO ELÉCTRICO', 314, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 19189, 'Indeterminado', 'LEIVA', '236');
INSERT INTO `trabajador` VALUES (1858, 6, 55, 46, 'JORGE', 'ROJAS', '89012720263', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2005, 0, 0, 'Solt.', 'CONSULADO NO 103 1ER PISO APTO 12', 'REFUGIO Y COLON', 303, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 19215, 'Indeterminado', 'MARTINEZ', '260');
INSERT INTO `trabajador` VALUES (1859, 6, 55, 46, 'FRANK ALAIN', 'ORTEGA', '86120205823', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2005, 0, 0, 'Solt.', 'SAN MIGUEL NO 417', 'CAMPANARIO Y LEALTAD', 303, NULL, 'FE: Formación Especial', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 19216, 'Indeterminado', 'FERNANDEZ', '32');
INSERT INTO `trabajador` VALUES (1860, 8, 54, 46, 'JAVIER', 'RODRIGUEZ', '87072806649', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telef. y Datos', 2006, 0, 0, 'Solt.', 'VISTA HERMOSA # 411', 'E/ LOMBILLO Y PIÑERA', 310, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 19254, 'Indeterminado', 'MORENO', '19');
INSERT INTO `trabajador` VALUES (1861, 8, 52, 4, 'DARIEL', 'CORDERO', '88122805025', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2006, 0, 0, 'Solt.', 'SANTA CATALINA #371 BAJOS', 'E/ PIÑERA Y DOMÍNGUEZ', 310, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 19333, 'Indeterminado', 'VILLAFUERTE', '266');
INSERT INTO `trabajador` VALUES (1862, 4, 73, 41, 'EMILIO ALEJANDRO', 'SAAVEDRA', '86031205542', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 2005, 0, 0, 'Solt.', 'MILAGROS #301 APTO 6', 'JUAN BRUNO ZAYAS Y CORTINA', 309, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 19344, 'Indeterminado', 'TAMAYO', '105');
INSERT INTO `trabajador` VALUES (1863, 3, 31, 24, 'JAVIER CARLOS', 'VILA', '87080730682', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2006, 0, 0, 'Solt.', 'CALLE 4TA. NO.12927 APTO.2', 'QUINTANA  Y ALDABÓ', 313, NULL, 'No incorporado', 961, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 19379, 'Indeterminado', 'MANCHÓN', '50');
INSERT INTO `trabajador` VALUES (1864, 8, 73, 41, 'ERNESTO', 'LINARES', '92021630103', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'CALLE 24  C-5 APTO 17', 'PLAYITA Y GIRAL', 309, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 19774, 'Indeterminado', 'GONZALEZ', '33');
INSERT INTO `trabajador` VALUES (1865, 1, 27, 48, 'THAIMY', 'CARMENATE', '92071330096', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'JUAN ALONSO #855', 'E/ FONT Y BOUZA', 309, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 19776, 'Indeterminado', 'IZAGUIRRE', '2');
INSERT INTO `trabajador` VALUES (1866, 1, 73, 43, 'YANET DE LA CARIDAD', 'MACEIRA', '92022929296', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'GOICURÍA #674', 'E/ ARANGUREN Y FREIRE ANDRADE', 309, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 19777, 'Indeterminado', 'GARCIA', '39');
INSERT INTO `trabajador` VALUES (1867, 5, 12, 31, 'MIRELYS', 'RAVELO', '92050106173', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'CALLE 36 A NO 9717', '97 Y 97A', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 19785, 'Indeterminado', 'HERNANDEZ', '120');
INSERT INTO `trabajador` VALUES (1868, 5, 12, 31, 'DAYLENA', 'CID', '92092430330', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'CALLE 95 NO 3214', '32 Y 34', 315, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 19787, 'Indeterminado', 'QUINTANA', '3');
INSERT INTO `trabajador` VALUES (1869, 1, 76, 6, 'JESSICA', 'GONZÁLEZ', '91011128032', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Secretariado', 2010, 0, 0, 'Solt.', 'VENTO NO 1708 APTO 9 E/ 2DA Y ACOSTA', 'CASINO DEPORTIVO', 310, NULL, 'BPD Área Residencia', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 19901, 'Indeterminado', 'GONZÁLEZ', '1');
INSERT INTO `trabajador` VALUES (1870, 8, 73, 16, 'VIVIANA', 'GARCIA', '93062633850', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2011, 0, 0, 'Solt.', '10 DE OCTUBRE #1375 APTO 8', 'E/ ACOSTA Y O´FARRILL', 309, NULL, 'Asignado a Unid. MTT', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 20168, 'Indeterminado', 'SOLANO', '98');
INSERT INTO `trabajador` VALUES (1871, 4, 12, 39, 'DAYLYS', 'ORBERA', '96111109610', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'CALLE 297 #13210 INTERIOR', 'E/ 134 Y 132', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 24670, 'Determinado x S.Soc.', 'SALAZAR', '132');
INSERT INTO `trabajador` VALUES (1872, 5, 54, 4, 'YAN LUIS', 'RAMIREZ', '93050505627', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2011, 0, 0, 'Solt.', 'CALLE 61 EDIFICIO C2 NO 5', 'E/ 24 Y 26 RPTO TORRIENTE', 315, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 20252, 'Indeterminado', 'SANCHEZ', '259');
INSERT INTO `trabajador` VALUES (1873, 6, 13, 33, 'GRETTE ELENA', 'DOMINGUEZ', '81112605098', '0', 'Blanca', 'Superior', 'Lic. en Educación', 2004, 0, 0, 'Solt.', 'CALLE 12 NO 6712', 'ENTRE 67 Y 69 RPTO AMOR', 315, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Msc.', 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 20364, 'Indeterminado', 'CHAO', '239');
INSERT INTO `trabajador` VALUES (1874, 5, 73, 7, 'ISLADYS', 'LEYVA', '85121008932', '0', 'Blanca', 'Superior', 'Lic. en Educación', 2008, 0, 0, 'Cas.', 'EDIFICIO 70 APTO 23', 'RPTO ALBERRO', 315, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Cotorro: Ave.101# 1623 / 16 y 18', 20365, 'Indeterminado', 'GARCÍA', '2');
INSERT INTO `trabajador` VALUES (1875, 3, 54, 46, 'ANTONIO', 'HERNANDEZ', '89092023560', '0', 'Blanca', 'Medio', '9no Grado', 2010, 0, 0, 'Solt.', 'SAN FRANCISCO  N.23304', '4TA Y 6TA', 308, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 20575, 'Indeterminado', 'FOMBELLIDA', '254');
INSERT INTO `trabajador` VALUES (1876, 1, 56, 2, 'JOSÉ ÁNGEL', 'GONZÁLEZ', '64042934524', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Sistema Eléctrico Indust.', 1993, 0, 0, 'Solt.', 'SAN JOSÉ #3', 'E/ CERVANTES Y ESTRELLA, PÁRRAGA', 314, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 20940, 'Indeterminado', 'ARRUE', '2');
INSERT INTO `trabajador` VALUES (1877, 1, 58, 2, 'JORDACHY', 'HERRERA', '83020827944', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 2001, 0, 0, 'Solt.', 'SALUD #319', 'E/ GERVASIO Y ESCOBAR, CENTRO HABANA', 303, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 20951, 'Indeterminado', 'ALFONSO', '22');
INSERT INTO `trabajador` VALUES (1878, 1, 46, 5, 'CARLOS OSCAR', 'GARCÍA', '87060210086', '0', 'Blanca', 'Medio', '9no Grado', 2002, 0, 0, 'Solt.', '4TA #17105', 'E/ 1era y 3ra, LA FORTUNA', 313, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21116, 'Indeterminado', 'ARRIETE', '21');
INSERT INTO `trabajador` VALUES (1879, 1, 56, 2, 'ALEXIS FAUSTO', 'DE LA NOVAL', '67063003644', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2002, 0, 0, 'Solt.', 'SAN MIGUEL #307', 'E/ JORGE Y D´STRAMPES, SEVILLANO', 309, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21117, 'Indeterminado', 'ALBERDI', '45');
INSERT INTO `trabajador` VALUES (1880, 1, 6, 2, 'CARLOS RAFAEL', 'RODRÍGUEZ', '86120906720', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2003, 0, 0, 'Cas.', '3ra No 18725', 'e/ E y F. LUYANÓ MODERNO', 308, NULL, 'No incorporado', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21118, 'Indeterminado', 'MARCOS', '188');
INSERT INTO `trabajador` VALUES (1881, 1, 27, 43, 'DAVID', 'NUÑEZ', '88101222343', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones y Electrónica', 2012, 0, 0, 'Solt.', 'PORVENIR E 1476 APTO 10', 'GEORGIA Y SAN GREGORIO', 314, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21119, 'Indeterminado', 'CUADRADO', '38');
INSERT INTO `trabajador` VALUES (1882, 4, 56, 2, 'ANTONIO', 'ORTIZ', '67030319503', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Cas.', 'AVE.379 No.17836 e/ 178 y 184 Mulgoba', 'e/ 178 y 184 Mulgoba  Boyeros', 313, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 21219, 'Indeterminado', 'TORRES', '230');
INSERT INTO `trabajador` VALUES (1883, 5, 12, 31, 'ARIALYS LAZÁRA', 'MARTÍNEZ', '89080532977', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2012, 0, 0, 'Cas.', ' CALLE 50  #  9124  APTO 3', ' % 91 Y 97', 315, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 21221, 'Indeterminado', 'POYO', '145');
INSERT INTO `trabajador` VALUES (1884, 7, 12, 35, 'YESENIA', 'GARCÍA', '94072330819', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'CALLE B #210', 'E/   9 Y 10       LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 21381, 'Indeterminado', 'GONZÁLEZ', '151');
INSERT INTO `trabajador` VALUES (1885, 1, 70, 25, 'YORDANY OTACHY', 'GARCÍA', '94111430746', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2012, 0, 0, 'Solt.', 'NUESTRA SRA DE LOS ÁNGELES #107 APTO 2', 'E/ QUIROGA Y TRES PALACIOS', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21384, 'Indeterminado', 'GÓMEZ', '37');
INSERT INTO `trabajador` VALUES (1886, 8, 12, 37, 'CARLA DE LA CARIDAD', 'MAURO', '94013130896', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'MARTÍNEZ #24', 'E/ C Y D, LAWTON', 309, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 21388, 'Indeterminado', 'MENA', '6');
INSERT INTO `trabajador` VALUES (1887, 6, 12, 33, 'GABRIELA DE LA CARIDAD', 'GÓMEZ', '94091828732', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'PEPE SAN MARTÍN #11411', 'E/ PASAJE F Y CENTRAL, ALTURAS DE SMP', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 21390, 'Indeterminado', 'COELLO', '159');
INSERT INTO `trabajador` VALUES (1888, 1, 73, 19, 'LIANA', 'CABRERA', '94053130250', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'CALLE 6 #12517', 'E/ PARAISO Y FINAL', 315, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21392, 'Indeterminado', 'ROCHE', '35');
INSERT INTO `trabajador` VALUES (1889, 3, 12, 30, 'DAILEY', 'DÍAZ', '94032930433', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'CALLE D #60', 'E/ 2DA Y 3RA, RPTO POEY', 314, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 21395, 'Indeterminado', 'LEYVA', '151');
INSERT INTO `trabajador` VALUES (1890, 5, 12, 31, 'YENI BEATRIZ', 'CHALAS', '94111030732', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'CALLE 32 A #10710 ALTO', 'E/ 107 Y 109, LA PURÍSIMA', 315, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 21397, 'Indeterminado', 'PÉREZ', '152');
INSERT INTO `trabajador` VALUES (1891, 6, 53, 4, 'NÉSTOR', 'PÉREZ', '93062033864', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'ESTELA #662', 'E/ MORRIS Y CONCORDIA, FRATERNIDAD', 314, 'R046 28.09.2016', 'BPD Área Residencia', 1297, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 21402, 'Indeterminado', 'AUDIA', '33');
INSERT INTO `trabajador` VALUES (1892, 7, 54, 46, 'ALEJANDRO MIGUEL', 'MOLINA', '94062730902', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2012, 0, 0, 'Solt.', 'SAN MARIANO #210 ALTO', 'E/ LUZ CABALLERO Y JOSÉ A SACO, VÍBORA', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 21470, 'Indeterminado', 'ALABET', '44');
INSERT INTO `trabajador` VALUES (1893, 1, 59, 47, 'GUSTAVO', 'RABELO', '67091529666', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1985, 0, 0, 'Cas.', 'CALLE 67 #4404', 'E/ 44 Y 46, REPARTO MODELO', 315, NULL, 'BPD Área Residencia', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21472, 'Indeterminado', 'VÁZQUEZ', '19');
INSERT INTO `trabajador` VALUES (1894, 5, 71, 24, 'ARELIS', 'MOREJON', '94041929295', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2012, 0, 0, 'Solt.', 'CALLE 3RA NO. 24313', 'E/ G Y H', 308, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 21484, 'Indeterminado', 'LEIVA', '0');
INSERT INTO `trabajador` VALUES (1895, 3, 56, 2, 'GEOVANIS', 'JIMÉNEZ', '83021329428', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2001, 0, 0, 'Solt.', 'CALLE 3RA #23715', 'E/ 4TA Y LINDERO REPARTO CUERVO', 313, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 21522, 'Indeterminado', 'HERNÁNDEZ', '256');
INSERT INTO `trabajador` VALUES (1896, 1, 19, 49, 'LAURENT', 'SANTA CRUZ', '89101420518', '0', 'Blanca', 'Superior', 'Ing. en Informática', 2014, 0, 0, 'Solt.', 'CALLE A #85 APTO 9', 'E/ SEGUNDA Y TERCERA RPTO CALIFORNIA', 308, NULL, 'No incorporado', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21609, 'Indeterminado', 'AUYIÓN', '278');
INSERT INTO `trabajador` VALUES (1897, 1, 5, 5, 'MISAEL ANTONIO', 'JIMENEZ', '71121309083', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 1994, 0, 0, 'Cas.', '250 NO. 64 APTO 16', 'ENTRE 35 C Y 37', 312, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21793, 'Indeterminado', 'GOMEZ', '287');
INSERT INTO `trabajador` VALUES (1898, 1, 66, 22, 'MIRTHA', 'FRÍAS', '63021008238', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Explot. Transp. Automotriz', 1987, 0, 0, 'Cas.', 'CALLE MANAGUA NO:15', 'E/ RENTE Y LUCERO', 314, NULL, 'Se evacua', 880, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21798, 'Indeterminado', 'LABRADA', '190');
INSERT INTO `trabajador` VALUES (1899, 8, 12, 18, 'AIMEE', 'BATISTA', '89072321778', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'LACRET # 462', 'ENTRE JUAN DELGADO Y DESTRAMPES', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 21805, 'Indeterminado', 'GARRIDO', '6');
INSERT INTO `trabajador` VALUES (1900, 4, 31, 24, 'IVAN', 'TOLEDO', '76092626567', '0', 'Blanca', 'Superior', 'Lic. en Derecho', 1999, 0, 0, 'Cas.', 'CALLE 116 NO.28113', 'E/ 281 Y 283', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Servicios', 'Modulo 1', 'Lic.', 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 21811, 'Indeterminado', 'RODRÍGUEZ', '37');
INSERT INTO `trabajador` VALUES (1901, 1, 38, 51, 'CARLOS ANTONIO', 'GOMEZ', '63011703666', '0', 'Blanca', 'Superior', 'Ing. en Electrocomunic. Automáticas', 1986, 0, 0, 'Solt.', '11 NO:157 ALTOS', 'E/ C Y D. LAWTON', 309, NULL, 'Asignado a Unid. MTT', 2621, 'CUP', 'Servicios', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21834, 'Indeterminado', 'SEGREDO', '45');
INSERT INTO `trabajador` VALUES (1902, 3, 71, 24, 'XIOMARA CARIDAD', 'GONZÁLEZ', '69060101912', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Finanzas', 1988, 0, 0, 'Cas.', 'DOLORES #20', 'E/ MIGUEL Y AVE. SANTA AMALIA', 309, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 21899, 'Indeterminado', 'GAVILÁN', '175');
INSERT INTO `trabajador` VALUES (1903, 7, 12, 35, 'LISET', 'BRITO', '78112607477', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Termoenergética', 1998, 0, 0, 'Solt.', 'TERESA BLANCO NO. 154  e/n', 'CALZADA DE LUYANO Y JARDIN  LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 21936, 'Indeterminado', 'OLIVA', '149');
INSERT INTO `trabajador` VALUES (1904, 8, 12, 18, 'ISLANIS', 'MARTINEZ', '91110527315', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad y Finanzas', 2009, 0, 0, 'Solt.', 'calle 315 No 7213', 'entre 72 y 74  el GLOBO', 313, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 21952, 'Indeterminado', 'LINARES', '152');
INSERT INTO `trabajador` VALUES (1905, 6, 3, 24, 'ILEANA', 'CRUZ', '70080614958', '0', 'Blanca', 'Medio', '9no Grado', 1985, 0, 0, 'Cas.', 'CALLE A EDIFICIO 15 APTO 8', 'ENTRE 1ERA Y 2DA RPTO VERACRUZ', 308, NULL, 'Se evacua', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 22048, 'Indeterminado', 'PEÑA', '34');
INSERT INTO `trabajador` VALUES (1906, 6, 12, 33, 'YAILIN', 'AVILA', '87020727776', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2005, 0, 0, 'Solt.', 'CALLE 60 NO 2514', 'ENTRE 25 Y 27, BUENAVISTA', 301, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 22065, 'Indeterminado', 'PROENZA', '125');
INSERT INTO `trabajador` VALUES (1907, 4, 58, 2, 'ALBERTO', 'LÓPEZ', '65042318442', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Montaje y Rep. Equipos Ind.', 1984, 0, 0, 'Cas.', '212 Y 214', 'LA CATALINA BOYEROS', 313, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 22247, 'Indeterminado', 'VALDÉS', '269');
INSERT INTO `trabajador` VALUES (1908, 1, 19, 49, 'DARIEL', 'OLIVA', '89102621727', '0', 'Blanca', 'Superior', 'Ing. Automático', 2013, 0, 0, 'Solt.', '178 #39505', 'E/ 395 Y 397. BOYEROS', 313, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22274, 'Indeterminado', 'DOMINGUEZ', '45');
INSERT INTO `trabajador` VALUES (1909, 1, 20, 25, 'ARIANCHY', 'LA O', '86111229129', '0', 'Negra', 'Superior', 'Ing. en Informática', 2013, 0, 0, 'Solt.', 'COLISEO #36', 'E/ GEORGIA Y YARA', 314, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22304, 'Indeterminado', 'GRAVERAN', '330');
INSERT INTO `trabajador` VALUES (1910, 4, 54, 46, 'JACINTO', 'HERNÁNDEZ', '73011412564', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1992, 0, 0, 'Cas.', '401 # 20011', 'e/ 200 y 202 Stgo de las Vegas', 313, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 22420, 'Indeterminado', 'RODRIGUEZ', '13');
INSERT INTO `trabajador` VALUES (1911, 6, 73, 9, 'ONIEL RAFAEL', 'MATO', '87122508446', '0', 'Blanca', 'Superior', 'Ing. en Ciencias Informáticas', 2011, 0, 0, 'Solt.', 'BALEAR NO 17912', 'CALZADA SAN MIGUEL Y LEONOR PEREZ', 308, NULL, 'FE: Formación Especial', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 22460, 'Indeterminado', 'RUIZ', '105');
INSERT INTO `trabajador` VALUES (1912, 1, 62, 27, 'YISEL', 'LÓPEZ', '76022303319', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2006, 0, 0, 'Solt.', 'JUAN BRUNO ZAYAS #232 APTO 7', 'E/ MILAGROS Y LIBERTAD', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22492, 'Indeterminado', 'FERRER', '311');
INSERT INTO `trabajador` VALUES (1913, 5, 31, 24, 'LEONEL', 'BELTRADES', '74022612401', '0', 'Mestiza', 'Superior', 'Lic. en Cultura Física', 2002, 0, 0, 'Solt.', '67 # 602', '% 6 Y 8', 315, NULL, 'Asignado a UMR', 961, 'CUP', 'Servicios', 'Modulo 1', 'Lic.', 'Cotorro: Calle 101 #1623 / 14 y16', 22590, 'Indeterminado', 'NARANJO', '279');
INSERT INTO `trabajador` VALUES (1914, 5, 12, 31, 'MIRELYS', 'ULLOA', '85100107056', '0', 'Blanca', 'Superior', 'Licenciatura en Informática', 2010, 0, 0, 'Solt.', 'CALLE SANTA CATALINA # 266 APTO B', '% ARMAS Y PORVENIR LAWTON', 309, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Cotorro: Ave.101# 1623 / 16 y 18', 22608, 'Indeterminado', 'FERNANDEZ', '119');
INSERT INTO `trabajador` VALUES (1915, 1, 56, 2, 'LUÍS', 'BONACHEA', '76091701827', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telefónicos', 1996, 0, 0, 'Solt.', 'SANTA CATALINA NO 403 APTO 2', 'LOMBILLO Y PIÑERA CERRO', 310, NULL, 'Asignado a Unid. MTT', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22627, 'Indeterminado', 'MARTÍN', '25');
INSERT INTO `trabajador` VALUES (1916, 3, 12, 29, 'ANAY', 'ALFONSO', '90081637696', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Solt.', 'EDIFICIO 4 APTO.18', 'E/1RA Y 3RA. LAS GUASIMAS', 314, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 22714, 'Indeterminado', 'HERNANDEZ', '43');
INSERT INTO `trabajador` VALUES (1917, 8, 12, 37, 'MAITÉ', 'FONSECA', '89012817696', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2007, 0, 0, 'Solt.', 'Conuco No 9', '/ Jorge e Ingles Sevillano', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 22715, 'Indeterminado', 'YERA', '24');
INSERT INTO `trabajador` VALUES (1918, 8, 13, 38, 'MARIELA', 'FONSECA', '80102105275', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1999, 0, 0, 'Solt.', 'CALLE 22 APT 4 ALTO', '% CONCEPCION Y BARAGUA', 309, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 22718, 'Indeterminado', 'GONZALEZ', '255');
INSERT INTO `trabajador` VALUES (1919, 7, 71, 24, 'ALICIA', 'FERNANDEZ', '72121821018', '0', 'Blanca', 'Superior', 'Lic. en Economía', 2011, 0, 0, 'Solt.', 'QUIROGA  NO. 314 A', 'E/ TRES PALACIOS Y NTRA SRA REGLA LAWTON', 309, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 22724, 'Indeterminado', 'MANRESA', '25');
INSERT INTO `trabajador` VALUES (1920, 1, 29, 47, 'YASMINA', 'TAPIA', '85090308659', '0', 'Blanca', 'Superior', 'Lic. en Ciencias Sociales', 2009, 0, 0, 'Div.', 'CALLE: 1ra No:53 Int.e/ PASEO Y POCITO', 'Arroyo Naranjo', 313, NULL, 'Se evacua', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22738, 'Indeterminado', 'GONZALEZ', '144');
INSERT INTO `trabajador` VALUES (1921, 4, 12, 40, 'NOELIA', 'GALINDO', '81011807159', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Servicios Gastronómicos', 1998, 0, 0, 'Solt.', '1RA #11200', 'E H Y Y', 308, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 12275, 'Indeterminado', 'ALFONSO', '129');
INSERT INTO `trabajador` VALUES (1922, 4, 12, 40, 'EMILIA CARIDAD', 'DÍAZ', '64042914778', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2009, 0, 0, 'Solt.', 'CASA 7 MANZANA 3', 'SECCION B. FRANK PAIS', 314, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14347, 'Indeterminado', 'IBAÑEZ', '38');
INSERT INTO `trabajador` VALUES (1923, 1, 12, 32, 'HELEN', 'OBEDIENTE', '95100340597', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'SAN ANDRES #1636', 'LOMA MIRABAL Y FINAL', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22821, 'Indeterminado', 'RODRIGUEZ', '21');
INSERT INTO `trabajador` VALUES (1924, 7, 73, 41, 'DEVORA', 'ROJAS', '95081918013', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', '4TA.  S/N', 'MELLA Y CARRETERA 8 VIAS', 314, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 22822, 'Indeterminado', 'MATOS', '6');
INSERT INTO `trabajador` VALUES (1925, 6, 55, 4, 'ROWER', 'JORRIN', '95122329460', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Telecomunic.', 2013, 0, 0, 'Solt.', 'FINCA MARIA SANTISIMA', 'LAS LAJAS', 314, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 22828, 'Indeterminado', 'SARDIÑAS', '28');
INSERT INTO `trabajador` VALUES (1926, 3, 12, 30, 'YANET AIMARA', 'LOBAINA', '95062516014', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema de Telecomunic.', 2013, 0, 0, 'Solt.', 'LINDERO # 18580', '4TA Y 6TA', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 22830, 'Indeterminado', 'FLORES', '122');
INSERT INTO `trabajador` VALUES (1927, 1, 62, 28, 'ZENIA ILUMINADA', 'VÁZQUEZ', '95110729612', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'REMEDIOS #109', 'E/ SAN JOSÉ Y SAN LUÍS, LAWTON', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22831, 'Indeterminado', 'MARQUEZ', '11');
INSERT INTO `trabajador` VALUES (1928, 3, 61, 41, 'ELIANYS DE LA CARIDAD', 'ALEMÁN', '95111428332', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'SILVIA #764', 'CZADA DE SAN AGUSTÍN Y CONCORDIA, PÁRRAG', 314, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 22832, 'Indeterminado', 'PÉREZ', '111');
INSERT INTO `trabajador` VALUES (1929, 5, 12, 32, 'RACHEL DE LA CARIDAD', 'SUAREZ', '95110629537', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2013, 0, 0, 'Solt.', 'EDIFICIO 8 APTO 28', 'ALBERRO', 315, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Calle 8 s/n Esq. a 77', 22836, 'Indeterminado', 'AVILA', '141');
INSERT INTO `trabajador` VALUES (1930, 1, 54, 50, 'ARTURO RAFAEL', 'SERRANO', '95063028187', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'CENTRAL #353-A ALTO', 'E/ RONDA DEL NORTE Y C, MENDOZA', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22838, 'Indeterminado', 'GIRÓN', '33');
INSERT INTO `trabajador` VALUES (1931, 8, 55, 4, 'DALVI ALBERTO', 'CASTILLO', '95110128905', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Telecomunic.', 2013, 0, 0, 'Solt.', 'CALZADA PRIMELLES  #356', 'SANTA TERESA Y DAOIZ', 310, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 22840, 'Indeterminado', 'TUERO', '41');
INSERT INTO `trabajador` VALUES (1932, 8, 12, 38, 'CARLOS ALBERTO', 'FERNÁNDEZ', '95082629463', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'AMÉRICA #11601', 'E/ LINDERO Y ASÍS, REPARTO MIRTA', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 22841, 'Indeterminado', 'LORENCES', '8');
INSERT INTO `trabajador` VALUES (1933, 8, 12, 38, 'LEYDI LAURA', 'MARIÑO', '95033129458', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Telecomunic.', 2013, 0, 0, 'Solt.', '4TA     #24117', 'JOSE MARTI Y 1RA.', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 22842, 'Indeterminado', 'FRANQUIZ', '137');
INSERT INTO `trabajador` VALUES (1934, 7, 55, 4, 'RAYDELL', 'BARANI', '95122729547', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'PASTRANA #71 APTO 1', 'E/ TERESA BLANCO Y CONCHA, LAWTON', 309, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 22843, 'Indeterminado', 'MENESES', '23');
INSERT INTO `trabajador` VALUES (1935, 7, 12, 32, 'BEATRIZ', 'PAEZ', '95060129536', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'MATADERO     No.57', 'MONTE Y LINDERO', 310, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 22864, 'Indeterminado', 'GUILLEN', '9');
INSERT INTO `trabajador` VALUES (1936, 8, 12, 38, 'YAMILKA', 'FERNÁNDEZ', '87100808977', '0', 'Mestiza', 'Superior', 'Lic. en Comunicación Social', 2011, 0, 0, 'Solt.', 'C Y ALTARRIBA', '10 DE OCTUBRE', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 23011, 'Indeterminado', 'CISNERO', '29');
INSERT INTO `trabajador` VALUES (1937, 1, 59, 47, 'LUÍS', 'CALA', '58122607180', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Mecanización Agrícola', 1979, 0, 0, 'Cas.', 'JACKSON No:2 e/ Rivera y Arnao', 'RPTO: BARRIO AZUL,  ARROYO NARANJO', 314, 'R002 01.02.2014', 'BPD Centro de Trabajo', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23039, 'Indeterminado', 'RODRÍGUEZ', '218');
INSERT INTO `trabajador` VALUES (1938, 7, 54, 46, 'ANTONIO', 'NUÑEZ', '78102407524', '0', 'Negra', 'Medio Superior', '12mo Grado', 1996, 0, 0, 'Solt.', 'LAWTON No. 1414  apto 6', 'e/n MILAGROS Y SANTA CATALINA  LAWTON', 309, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 23053, 'Indeterminado', 'PORTUONDO', '235');
INSERT INTO `trabajador` VALUES (1939, 6, 71, 24, 'ISRAEL', 'DÍAZ', '64020911966', '0', 'Blanca', 'Superior', 'Lic. en Economía', 2011, 0, 0, 'Solt.', 'CALLE A #14609', 'E/ CARABALLO Y BOULEVAR RPTO SAN FRANCIS', 308, NULL, 'FE: Formación Especial', 961, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 23057, 'Indeterminado', 'CONCEPCIÓN', '159');
INSERT INTO `trabajador` VALUES (1940, 1, 36, 50, 'YUNIOR MANUEL', 'FERNÁNDEZ', '85120926941', '0', 'Mestiza', 'Superior', 'Ing. Radioelectrónico', 2008, 0, 0, 'Cas.', 'CALLE 20 NO.39715', 'E/ 107 Y 109. SIERRA MAESTRA', 313, 'R017 01.11.2015', 'No incorporado', 2903, 'CUP', 'Cuadros', 'Modulo 2', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23067, 'Indeterminado', 'PÉREZ', '26');
INSERT INTO `trabajador` VALUES (1941, 1, 62, 28, 'ADRIANA', 'MARQUÉZ', '95071830491', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Secretariado', 2013, 0, 0, 'Solt.', '204 NO 5146', '/ 51 Y 59', 312, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23124, 'Indeterminado', 'RODRÍGUEZ', '41');
INSERT INTO `trabajador` VALUES (1942, 4, 55, 4, 'RAFAEL', 'RODRIGUEZ', '90012848107', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2008, 0, 0, 'Solt.', 'FINAL   S/N', 'RPTO FRANK PAIS', 314, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23162, 'Indeterminado', 'DIP', '43');
INSERT INTO `trabajador` VALUES (1943, 1, 58, 2, 'ARIEL', 'MARTINEZ', '89082621764', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', '2DA NO.17128', 'ENTRE 1RA Y 3RA', 313, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23196, 'Indeterminado', 'RODRIGUEZ', '283');
INSERT INTO `trabajador` VALUES (1944, 3, 54, 46, 'YOEL', 'SERRANO', '90111428484', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Electricidad', 2009, 0, 0, 'Solt.', 'CARMELINA #36 APTO 6 EFIF 2', 'E/ ALDAY Y FINAL, VIEJA LINDA', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 23197, 'Indeterminado', 'IZQUIERDO', '227');
INSERT INTO `trabajador` VALUES (1945, 1, 54, 3, 'YUNIEL', 'ALVAREZ', '85111508906', '0', 'Blanca', 'Medio', '9no Grado', 2000, 0, 0, 'Solt.', 'BEALES #90', 'E/ FONTS Y E, LAWTON', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23199, 'Indeterminado', 'VALLE', '4');
INSERT INTO `trabajador` VALUES (1946, 1, 54, 3, 'MIGUEL ALEJANDRO', 'GARCIA', '92090730988', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2013, 0, 0, 'Solt.', 'SECCION H NO.10', '64 Y 60', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23201, 'Indeterminado', 'LAZO', '262');
INSERT INTO `trabajador` VALUES (1947, 1, 58, 2, 'YUNIOR', 'CASTELLANOS', '80013022984', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1998, 0, 0, 'Cas.', 'CARMEN 8408', 'SANTA TERESA Y MEIRELES', 314, NULL, 'Asignado a Unid. MTT', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23204, 'Indeterminado', 'ROMERO', '244');
INSERT INTO `trabajador` VALUES (1948, 1, 54, 3, 'DOUGLAS', 'ROSARIO', '87113007302', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Servicios Gastronómicos', 2007, 0, 0, 'Solt.', 'VILLOLDO EDIF. 344 APTO 10', 'ESQ. SAN GREGORIO, VÍBORA PARK', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23205, 'Indeterminado', 'GONZÁLEZ', '33');
INSERT INTO `trabajador` VALUES (1949, 1, 54, 3, 'CRISTOBAL', 'GLAZE', '85112808480', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Instrumentación y Control', 2004, 0, 0, 'Cas.', 'NACIONAL 13506', 'CORTA Y LILILOY', 313, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23206, 'Indeterminado', 'ROMERO', '269');
INSERT INTO `trabajador` VALUES (1950, 1, 54, 3, 'FRANCISCO RAIDEL', 'GARCÍA', '80100306087', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', 'POCITO #203 APTO 6', 'BELLAVISTA Y LAWTÓN', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23207, 'Indeterminado', 'GRAS', '267');
INSERT INTO `trabajador` VALUES (1951, 4, 58, 2, 'EDUARDO ARIEL', 'ROSALES', '92112629609', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2010, 0, 0, 'Solt.', '225 NO. 21011', '210 Y 214', 313, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23208, 'Indeterminado', 'MARTINEZ', '40');
INSERT INTO `trabajador` VALUES (1952, 1, 54, 3, 'MOISES ARMANDO', 'BOO', '95011028181', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2012, 0, 0, 'Solt.', 'LIRA NO.17', 'CALZADA DE MANAGUA Y MESTRE', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23219, 'Indeterminado', 'DE LA NUEZ', '12');
INSERT INTO `trabajador` VALUES (1953, 6, 55, 46, 'JOSE LEON', 'PERDOMO', '92100830189', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2010, 0, 0, 'Solt.', 'CALLE 24 # 7111A', 'e/ 71 Y 99 LOCALIDAD LA CARIDAD', 315, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 23221, 'Indeterminado', 'LOPEZ', '262');
INSERT INTO `trabajador` VALUES (1954, 5, 54, 46, 'KLEBER', 'RODRIGUEZ', '78041907285', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2001, 0, 0, 'Solt.', '50', ' # 7128  % 71 Y 97', 315, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 23222, 'Indeterminado', 'LEON', '261');
INSERT INTO `trabajador` VALUES (1955, 1, 54, 3, 'CARLOS', 'GONZALEZ', '89011820905', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telefónicos', 2007, 0, 0, 'Solt.', 'ACACIA NO. 2151', 'CENTRAL Y MARTI', 310, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23223, 'Indeterminado', 'VALDIVIA', '267');
INSERT INTO `trabajador` VALUES (1956, 6, 54, 46, 'JULIO', 'GARCIA', '87121908986', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electricidad', 2006, 0, 0, 'Cas.', 'CALLE 59B #606 e/ 6 Y 8 VEDADO COTORRO', 'e/ 6 Y 8 VEDADO COTORRO', 315, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 23225, 'Indeterminado', 'ALFAJARRIN', '5');
INSERT INTO `trabajador` VALUES (1957, 4, 55, 4, 'JESUS', 'PEREZ', '93031832405', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2011, 0, 0, 'Solt.', '409 A No 18420', '184 Y 186', 313, NULL, 'Asignado a UMR', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23229, 'Indeterminado', 'LOPEZ', '25');
INSERT INTO `trabajador` VALUES (1958, 7, 54, 46, 'OSVALDO', 'BETANCOURT', '81092903768', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2005, 0, 0, 'Solt.', ' CALLE  B    NO.210', 'E/N 9  Y 10    LAWTON', 309, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 23238, 'Indeterminado', 'GARCIA', '230');
INSERT INTO `trabajador` VALUES (1959, 3, 58, 2, 'JUAN LUÍS', 'BACALLAO', '90100627229', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', '10 DE OCTUBRE #5566', 'E/ SAN JOSÉ Y SAN LUÍS', 309, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 23242, 'Indeterminado', 'AGUIRRE', '23');
INSERT INTO `trabajador` VALUES (1960, 7, 73, 14, 'ANDRES   FIDEL', 'ADAY', '63112902921', '0', 'Negra', 'Superior', 'Lic. en Derecho', 2012, 0, 0, 'Solt.', 'CALLE  62  No. 1912', 'E/N  19  Y  21    BUENAVISTA', 301, NULL, 'Asignado a UMR', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 23293, 'Indeterminado', 'AGUIRRE', '99');
INSERT INTO `trabajador` VALUES (1961, 4, 42, 40, 'MARIA ELENA', 'SÀNCHEZ', '62020814530', '0', 'Negra', 'Medio Superior', '12mo Grado', 1980, 0, 0, 'Solt.', 'CALLE 221 NO. 20010', '200  Y  206 FONTANAR', 313, NULL, 'FE: Formación Especial', 2036, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 14369, 'Indeterminado', 'PEÑA', '50');
INSERT INTO `trabajador` VALUES (1962, 1, 36, 6, 'LUIS MANUEL', 'BETANCOURT', '47082616060', '0', 'Mestiza', 'Superior', 'Mando y Estado Mayor Táctico Operativo', 1976, 0, 0, 'Cas.', 'CALLE 23 NO. 1256', 'ENTRE 14 Y 16', 302, 'R07 01.09.2015', 'FE: Formación Especial', 2983, 'CUP', 'Cuadros', 'Modulo 1', 'Msc.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23306, 'Indeterminado', 'MEJIA', '36');
INSERT INTO `trabajador` VALUES (1963, 1, 71, 21, 'MAYRELIS', 'LÓPEZ', '83083004092', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. Contador', 2006, 0, 0, 'Div.', '5TA  NO.12930 APTO 17', 'E/ CARLOS NUÑEZ Y QUINTANA ALDABO', 313, NULL, 'Se evacua', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23321, 'Indeterminado', 'RODRIGUEZ', '162');
INSERT INTO `trabajador` VALUES (1964, 3, 55, 4, 'EDUARDO', 'GUERRA', '76060103143', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1995, 0, 0, 'Div.', '397 NO.18215.RPTO.VILLANUEVA', 'E/ 182 Y 184', 313, NULL, 'No incorporado', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 23330, 'Indeterminado', 'CUELLAR', '17');
INSERT INTO `trabajador` VALUES (1965, 8, 58, 2, 'LUIS ERNESTO', 'PONS', '89072947388', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', 'CONCEPCION No 11', '/10 DE OCTUBRE Y DELICIAS', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 23332, 'Indeterminado', 'MARTINEZ', '284');
INSERT INTO `trabajador` VALUES (1966, 7, 12, 35, 'YALILE DE LA CARIDAD', 'RIVERO', '91071228494', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2011, 0, 0, 'Solt.', 'FONT No. 111', 'BEALES  Y RAFAEL DE CARDENAS  LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 23357, 'Indeterminado', 'CHAO', '6');
INSERT INTO `trabajador` VALUES (1967, 6, 58, 2, 'RAYKO FELIPE', 'CIUDAD', '88031810264', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Sistema Telefónicos', 2007, 0, 0, 'Solt.', 'CALLE MONTE  APARTAMENTO 10', 'MUNICIPIO CERRO ATARE', 310, NULL, 'FE: Formación Especial', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 23426, 'Indeterminado', 'VIDEA', '17');
INSERT INTO `trabajador` VALUES (1968, 1, 22, 6, 'MABEL', 'HERRERA', '75070223912', '0', 'Blanca', 'Superior', 'Lic. en Psicología', 1999, 0, 0, 'Solt.', 'SANTA CLARA NO:10', 'e/ HATUEY Y CALIXTO GARCÍA', 314, NULL, 'BPD Centro de Trabajo', 1532, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23535, 'Indeterminado', 'GÓMEZ', '5');
INSERT INTO `trabajador` VALUES (1969, 1, 48, 5, 'YASMANY', 'RIOS', '91052327467', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electricidad', 2009, 0, 0, 'Solt.', 'PROGRESO NO.113', 'ENTRE 4TA Y 5TA', 314, NULL, 'Asignado a Unid. MTT', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 23703, 'Indeterminado', 'DIAZ', '31');
INSERT INTO `trabajador` VALUES (1970, 5, 3, 24, 'MARIA LUISA', 'SOTO', '56082512011', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1983, 0, 0, 'Solt.', '10   #  11703  % 1RA Y 3RA  RPTO PARAISO COTORRO', 'COTORRO', 315, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 23704, 'Indeterminado', 'PEDROSO', '2');
INSERT INTO `trabajador` VALUES (1971, 5, 12, 31, 'BETZY', 'QUINTERO', '94110944530', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2012, 0, 0, 'Solt.', '69 C  % 20 Y 22  # 2020', 'RPTO LA CARIDAD     COTORRO', 315, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 23708, 'Indeterminado', 'OSORIO', '30');
INSERT INTO `trabajador` VALUES (1972, 7, 2, 27, 'IDAISY', 'ALTUNA', '79112804214', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Servicios Gastronómicos', 1998, 0, 0, 'Div.', 'REINA # 61 APTO 5', 'E/ ANGELES Y AGUILA', 303, NULL, 'Se evacua', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 23720, 'Indeterminado', 'ISAAC', '44');
INSERT INTO `trabajador` VALUES (1973, 3, 55, 4, 'DAVID', 'GENER', '70032218287', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Hidraúlica', 1990, 0, 0, 'Cas.', 'MATILDE. 17 INT', 'ANGELITA Y BERENGUER. RPTO.VIEJA LINDA', 314, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 23782, 'Indeterminado', 'RAMOS', '244');
INSERT INTO `trabajador` VALUES (1974, 1, 71, 21, 'MILEYDIS', 'SOSA', '83022806619', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2002, 0, 0, 'Solt.', 'Porvernir Edif. 1476 apto: 2', 'e/ Georgia y San Gregorio', 314, NULL, 'No incorporado', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24006, 'Indeterminado', 'CHAVIANO', '11');
INSERT INTO `trabajador` VALUES (1975, 3, 15, 24, 'LAZARO LEONARDO', 'ABREU', '57110612586', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electricidad', 1981, 0, 0, 'Cas.', 'HATUEY 469', 'E/ GUASIMAL Y NUEVA GERONA. PARRAGA', 314, NULL, 'BPD Centro de Trabajo', 1095, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 24048, 'Indeterminado', 'LEIVA', '336');
INSERT INTO `trabajador` VALUES (1976, 1, 27, 48, 'Daniel', 'Comas', '88101710223', '0', 'Blanca', 'Superior', 'Ing. en Informática', 2014, 0, 0, 'Solt.', 'Calle 6ta. Edificio 16 Apto. 17', 'Camilo Cienfuegos y José Martí', 314, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24069, 'Indeterminado', 'Campoamor', '255');
INSERT INTO `trabajador` VALUES (1977, 1, 59, 47, 'IVÁN', 'RAMÍREZ', '62082315500', '0', 'Negra', 'Medio Superior', '12mo Grado', 1994, 0, 0, 'Cas.', 'GEORGIA No. 69 APTO: 18 e/ S. GREGORIO', ' Y ATAQUE MANBÍ. V. PARK. ARROYO NARANJO', 314, NULL, 'Asignado a Unid. MTT', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24138, 'Indeterminado', 'MONTALVO', '18');
INSERT INTO `trabajador` VALUES (1978, 1, 8, 45, 'ONIDER', 'VELAZQUEZ', '55021202905', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Org. Trabajo y los Salarios', 1980, 0, 0, 'Cas.', 'CALLE A NO. 19 A APTO 16', '2DA Y 5TA', 314, NULL, 'No incorporado', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24141, 'Indeterminado', 'REYES', '307');
INSERT INTO `trabajador` VALUES (1979, 1, 69, 49, 'FRANK OSCAR', 'CRUZ', '87042025085', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2006, 0, 0, 'Solt.', '247 No: 8620 e/ 86 Y 88', 'RPTO: LA CUMBRE, SAN M. DEL PADRÓN', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24142, 'Indeterminado', 'MARRERO', '281');
INSERT INTO `trabajador` VALUES (1980, 1, 19, 49, 'YORDANKA', 'URRETA', '89041923377', '0', 'Blanca', 'Superior', 'Ing. en Informática', 2014, 0, 0, 'Solt.', '33 No: 2635 e/ 26 Y FINAL', 'RPTO: SANTA Ma. DEL ROSARIO, COTORRO', 315, NULL, 'BPD Área Residencia', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24149, 'Indeterminado', 'MEDINA', '265');
INSERT INTO `trabajador` VALUES (1981, 7, 12, 36, 'ISIS', 'FERNANDEZ', '85121606976', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2004, 0, 0, 'Solt.', 'TERESA BLANCO NO. 55', 'E/N  PEDRO PERNA  E INFANZON   LUYANO', 309, NULL, 'Se evacua', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 24276, 'Indeterminado', 'GONZALEZ', '122');
INSERT INTO `trabajador` VALUES (1982, 5, 3, 24, 'MILEYDI', 'MARTINEZ', '72051627370', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Mantenimiento Eléctrico', 1991, 0, 0, 'Cas.', 'CALZADA SAN MIGUEL  # 1605 INTERIOR', '% BALEAR Y SANTA FRANCISCA  SMP', 308, NULL, 'BPD Centro de Trabajo', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 24309, 'Indeterminado', 'ALARCON', '49');
INSERT INTO `trabajador` VALUES (1983, 1, 18, 26, 'MARIA MILITZA', 'WOOD', '62011911715', '0', 'Blanca', 'Superior', 'Ing. Electromecánico Naval', 1986, 0, 0, 'Cas.', 'LIBERTAD No.272 ALTOS', 'CORTINA Y JUAN BRUNO ZAYAS. STOS SUÁREZ', 309, NULL, 'BPD Área Residencia', 1502, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24403, 'Indeterminado', 'RODRÍGUEZ', '42');
INSERT INTO `trabajador` VALUES (1984, 5, 52, 46, 'OSMEL', 'GONZALEZ', '71071328549', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1989, 0, 0, 'Cas.', 'AVE 65', '# 2036  % 20B Y 20C  REPTO LA CARIDAD', 315, NULL, 'No incorporado', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Ave.101# 1623 / 16 y 18', 24406, 'Indeterminado', 'GARCIA', '7');
INSERT INTO `trabajador` VALUES (1985, 3, 54, 46, 'ANGEL ALEXEI', 'OLIVERA', '75082115206', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Solt.', 'NUEVA GERONA NO.451', 'ALTURA MONTEJO Y LINDERO. PARRAGA', 314, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 24419, 'Indeterminado', 'BERITAN', '255');
INSERT INTO `trabajador` VALUES (1986, 1, 46, 5, 'EDUARDO', 'HERNANDEZ', '84102608821', '0', 'Blanca', 'Medio Superior', '12mo Grado', 2011, 0, 0, 'Solt.', 'CALLE 112 NO. 28508', 'ENTRE 285 Y 287', 313, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24841, 'Indeterminado', 'MENA', '235');
INSERT INTO `trabajador` VALUES (1987, 8, 56, 2, 'MICHEL', 'GARCIA', '86080705206', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema Telefónicos', 2007, 0, 0, 'Solt.', 'BELLAVISTA EDIF 669 APTO 6', 'ENTRE  CALLE COLÓN Y LOMBILLO', 302, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 24925, 'Indeterminado', 'MUNERO', '229');
INSERT INTO `trabajador` VALUES (1988, 7, 13, 35, 'KATHERIN', 'GOÑI', '91012628653', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2008, 0, 0, 'Solt.', 'JOSEFINA  NO. 107', 'E/N  3RA   Y  2DA    LAWTON', 309, NULL, 'BPD Centro de Trabajo', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 25054, 'Indeterminado', 'TORRES', '42');
INSERT INTO `trabajador` VALUES (1989, 7, 54, 46, 'ANDY', 'GARCÍA', '94071030505', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2012, 0, 0, 'Solt.', 'EDIFICIO B 19  Apto: 29', 'ZONA 5', 306, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 25069, 'Indeterminado', 'ORTEGA', '10');
INSERT INTO `trabajador` VALUES (1990, 1, 72, 22, 'AYME', 'RODRÍGUEZ', '91073129939', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Impresión', 2009, 0, 0, 'Solt.', 'CERVANTES No: 70 1/2 E/ D¨STRAMPE Y GOICURIA', ',RPTO: VÍBORA, 10 DE OCTUBRE', 309, NULL, 'BPD Área Residencia', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25187, 'Indeterminado', 'HERNÁDEZ', '134');
INSERT INTO `trabajador` VALUES (1991, 1, 23, 21, 'ANIELKA', 'CHAPPOTIN', '89010220259', '0', 'Negra', 'Superior', 'Lic. en Contabilidad y Finanzas', 2011, 0, 0, 'Solt.', 'EDIFIC. 57 APTO:2, HABANA VIEJA.', 'LAMPARILLA No: 456, HABANA VIEJA', 304, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 2', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25227, 'Indeterminado', 'HERNÁNDEZ', '22');
INSERT INTO `trabajador` VALUES (1992, 4, 54, 46, 'YANKIEL', 'BORREGO', '92061629304', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comercio', 2013, 0, 0, 'Solt.', '194 # 42316', '421 Y FINAL RPTO JOSE MARIA PEREZ', 313, NULL, 'Asignado a UMR', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 25520, 'Indeterminado', 'PUJOL', '24');
INSERT INTO `trabajador` VALUES (1993, 8, 58, 2, 'RIGOBERTO', 'PERDOMO', '88100910228', '0', 'Blanca', 'Medio Superior', '12mo Grado', 309, 0, 0, 'Solt.', 'SANTA FELICIA No426 APTO 5', 'MELONES Y R ENRIQUE LUYANO', 309, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 25579, 'Indeterminado', 'PINIELLA', '278');
INSERT INTO `trabajador` VALUES (1994, 3, 37, 41, 'RENE LORENZO', 'CALZADILLA', '61101015909', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comunicaciones', 1982, 0, 0, 'Cas.', 'EDIFICIO NO.3 APTO.5', 'SECCION H. REPARTO FRANK PAIS. ARROYO N', 314, NULL, 'No incorporado', 2796, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 25646, 'Indeterminado', 'TAPIA', '230');
INSERT INTO `trabajador` VALUES (1995, 1, 64, 45, 'ARLEY', 'TELLES', '68082831089', '0', 'Blanca', 'Medio Superior', '12mo Grado', 1992, 0, 0, 'Solt.', 'REYES 372', 'ENTRE POCITO Y LUZ APTO 1', 309, NULL, 'BPD Área Residencia', 806, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25667, 'Indeterminado', 'MARRERO', '85');
INSERT INTO `trabajador` VALUES (1996, 1, 46, 5, 'YOANYS', 'MORA', '80110622647', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1996, 0, 0, 'Solt.', '8VA NO. 14412', 'ENTRE 3RA Y 5TA ALTURA MIRADOR DIEZMERO', 308, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25832, 'Indeterminado', 'CARDERO', '200');
INSERT INTO `trabajador` VALUES (1997, 1, 31, 25, 'JUAN ANDRÉS', 'DUQUESNE', '87100706905', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. Contador', 2006, 0, 0, 'Solt.', 'AVE. 78 MÓDULO: B, EDIF. 28 APTO: 8', 'VILLA PANAMERICANA , HABANA DEL ESTE.', 306, NULL, 'FE: Formación Especial', 961, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25848, 'Indeterminado', 'ALVAREZ', '1');
INSERT INTO `trabajador` VALUES (1998, 6, 55, 4, 'MICHEL', 'ÁLVAREZ', '95113028942', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', '247 #8615', 'E/ 86 Y 88, LA CUMBRE', 308, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 25914, 'Indeterminado', 'NAVIA', '26');
INSERT INTO `trabajador` VALUES (1999, 6, 55, 4, 'LUIS', 'SANDELIS', '95011529488', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'SAN JOSÉ #441 BAJO', 'E/ LUZ Y POCITO', 309, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 25917, 'Indeterminado', 'RODRÍGUEZ', '13');
INSERT INTO `trabajador` VALUES (2000, 1, 69, 49, 'LUÍS NIVALDO', 'PRENDES', '90082245264', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2015, 0, 0, 'Solt.', '6ta NO: 10716', 'E/ 107 Y  FINAL, LA TORRE, COTORRO', 315, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25996, 'Indeterminado', 'FERNÁNDEZ', '19');
INSERT INTO `trabajador` VALUES (2001, 1, 71, 23, 'HORACIO ARMANDO', 'MEZQUIA', '88052608185', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2007, 0, 0, 'Solt.', 'CALLE: ROSA SERRA No. 53', 'e/ NAZARENO Y CORONA. D´BECHE. GUANABACO', 307, NULL, 'BPD Área Residencia', 961, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26066, 'Indeterminado', 'MERALLA', '159');
INSERT INTO `trabajador` VALUES (2002, 1, 26, 22, 'ANTONIO GABRIEL', 'PUPO', '51071100505', '0', 'Blanca', 'Superior', 'Lic. en Ciencias Políticas', 1984, 0, 0, 'Cas.', 'PASAJE G, EDIFIC: 406 APTO:3', 'E/ 3RA Y 4TA. ALTAHABANA, BOYEROS', 313, NULL, 'FE: Formación Especial', 1532, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26071, 'Indeterminado', 'PALMA', '319');
INSERT INTO `trabajador` VALUES (2003, 7, 61, 41, 'BELKYS  AIMEE', 'MESA', '68102012559', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Div.', 'CALLE   E  NO.221', 'E/N  9  Y  10   LAWTON', 309, NULL, 'BPD Centro de Trabajo', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 26073, 'Indeterminado', 'CAPOTE', '145');
INSERT INTO `trabajador` VALUES (2004, 1, 15, 1, 'KEVIN', 'NIEBLA', '83081830706', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Radio', 2003, 0, 0, 'Solt.', 'ARENAL No: 13411', 'E/ VARELA Y LÍNEA. SAN FCO DE PAULA. S M', 308, NULL, 'FE: Formación Especial', 1095, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26092, 'Indeterminado', 'RODRÍGUEZ', '0');
INSERT INTO `trabajador` VALUES (2005, 1, 27, 50, 'Alejandro', 'Veitía', '89110521169', '0', 'Blanca', 'Superior', 'Ing. en Sistemas de Computación', 2013, 0, 0, 'Solt.', 'Calle 101 No 12807 entre 128 b y final', 'El Palmar', 311, NULL, 'Asignado a UMR', 1633, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26148, 'Indeterminado', 'Ramos', '9');
INSERT INTO `trabajador` VALUES (2006, 1, 17, 26, 'XENIA', 'MEDEL', '69012211111', '0', 'Blanca', 'Superior', 'Arquitecto', 1997, 0, 0, 'Cas.', 'CALLE: AMARGURA No: 115 e/ CALVARIO', 'Y ÁNGELES. RPTO:CALVARIO, ARROYO NARANJO', 314, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Arq.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26158, 'Indeterminado', 'CUELLAR', '16');
INSERT INTO `trabajador` VALUES (2007, 1, 43, 1, 'SILVIA MARIA', 'MONZÓN', '65062202776', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 1988, 0, 0, 'Cas.', 'CALLE: ANTILLA No:424 APTO: E', 'E/ GUSIMAL Y NUEVA GERONA, RPTO: PARRAGA', 314, NULL, 'BPD Área Residencia', 1841, 'CUP', 'Servicios', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26192, 'Indeterminado', 'CEDRÉ', '301');
INSERT INTO `trabajador` VALUES (2008, 1, 16, 51, 'JORGE LUÍS', 'RAMIREZ', '62040603844', '0', 'Blanca', 'Superior', 'Lic. en Derecho', 2012, 0, 0, 'Cas.', 'CALLE:8 No. 562', 'E/  23 Y 25. PLAZA', 302, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26231, 'Indeterminado', 'IBARRA', '130');
INSERT INTO `trabajador` VALUES (2009, 1, 73, 43, 'JUAN CARLOS', 'GONZALEZ', '68032730885', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Industria Electrónica', 1991, 0, 0, 'Cas.', 'SAN RAFAEL NO.121', 'ENTRE POCITO Y ESPERANZA', 314, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26412, 'Indeterminado', 'HERNANDEZ', '19');
INSERT INTO `trabajador` VALUES (2010, 1, 52, 3, 'IRAM', 'VIDAL', '78040810320', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Transporte Automotor', 1997, 0, 0, 'Solt.', 'SERPENTINA N.11811 INT', 'LINDERO Y ALDAY EL TRIGAL', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26425, 'Indeterminado', 'HERNÁNDEZ', '243');
INSERT INTO `trabajador` VALUES (2011, 4, 12, 40, 'MARÍA MAGDALENA', 'BROWN', '63112732237', '0', 'Negra', 'Medio Superior', '12mo Grado', 1982, 0, 0, 'Solt.', 'SECCION H EDIF 5  APTO 1', 'REPARTO: FRANK PAIS', 314, NULL, 'No incorporado', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 16294, 'Indeterminado', 'BROWN', '158');
INSERT INTO `trabajador` VALUES (2012, 1, 58, 2, 'LAZARO', 'HERNANDEZ', '65111200722', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Explotación Transporte Ferr', 1986, 0, 0, 'Cas.', 'CALLE 4TA NO. 415', 'ENTRE FINLAY Y ANITA', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26656, 'Indeterminado', 'MELO', '26');
INSERT INTO `trabajador` VALUES (2013, 3, 58, 2, 'LUIS LEDIAN', 'GARCIA', '89041335029', '0', 'Mestiza', 'Medio Superior', '12mo Grado', 2007, 0, 0, 'Solt.', 'AVE. 1RA NO.50 INT.', 'EL VOLCAN. SAN ANTONIO DE LAS VEGAS', 2402, NULL, 'No incorporado', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 26669, 'Indeterminado', 'TAMAYO', '11');
INSERT INTO `trabajador` VALUES (2014, 3, 3, 24, 'MARIZBEL CLARA', 'GAMBOA', '61081202658', '0', 'Blanca', 'Medio', '9no Grado', 2007, 0, 0, 'Viud.', 'CISNEROS BETANCOURT NO.219', 'COTILLA Y 1RA', 314, NULL, 'Se evacua', 739, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 26670, 'Indeterminado', 'DIAZ', '38');
INSERT INTO `trabajador` VALUES (2015, 1, 38, 25, 'RUBEN', 'RIZO', '65013102042', '0', 'Blanca', 'Superior', 'Lic. en Aritmética y Matemática', 1987, 0, 0, 'Cas.', 'CALLE 4 # 329', 'ENTRE KESSELL Y SAN LEONARDO', 314, NULL, 'BPD Centro de Trabajo', 2621, 'CUP', 'Servicios', 'Modulo 1', 'Lic.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 27066, 'Indeterminado', 'PEREZ', '32');
INSERT INTO `trabajador` VALUES (2016, 2, 62, 27, 'ISABEL CRISTINA', 'CAÑELLAS', '94020434293', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2012, 0, 0, 'Solt.', 'MARÍA AUXILIADORA #304', 'E/ LOURDES Y ALEGRÍA, VÍBORA PARK', 314, NULL, 'BPD Área Residencia', 961, 'CUP', 'Operario', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 21396, 'Determinado x S.Soc.', 'PALACIO', '40');
INSERT INTO `trabajador` VALUES (2017, 6, 75, 6, 'LISET BEATRIZ', 'CONCEPCION', '95060720219', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2013, 0, 0, 'Solt.', 'L  # 8526', 'R  Y  C', 308, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 22833, 'Determinado x S.Soc.', 'GARCIA', '112');
INSERT INTO `trabajador` VALUES (2018, 4, 12, 40, 'YARA LIS', 'PEREZ', '95121128578', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Sistema de Telecomunic.', 2013, 0, 0, 'Solt.', '261 S/N', '136 Y 152', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 22817, 'Indeterminado', 'BAUTA', '22');
INSERT INTO `trabajador` VALUES (2019, 6, 55, 4, 'RODOLFO FRANKLIN', 'FERRER', '95050629403', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'DOLORES  #307', 'e/ PORVENIR  Y ARMAS', 309, NULL, 'Se evacua', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 23141, 'Determinado x S.Soc.', 'RODRIGUEZ', '11');
INSERT INTO `trabajador` VALUES (2020, 5, 12, 31, 'WILBER', 'SANTOS', '95081822903', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'Central', 'e/ Perkin y Mayor', 308, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24066, 'Determinado x S.Soc.', 'BRAVO', '17');
INSERT INTO `trabajador` VALUES (2021, 6, 28, 41, 'ADDIS RAQUEL', 'AGUILERA', '91052042499', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones y Electrónica', 2014, 0, 0, 'Solt.', '223', '1ra y 101. Cruz Verde', 315, NULL, 'BPD Área Residencia', 1841, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 24067, 'Determinado x S.Soc.', 'GONZÁLEZ', '277');
INSERT INTO `trabajador` VALUES (2022, 5, 12, 31, 'CLAUDIA', 'AMIGO', '96080207696', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'ALDABÓ NO.12301 APTO 3', 'ENTRE 10 Y11', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24656, 'Determinado x S.Soc.', 'TORRES', '131');
INSERT INTO `trabajador` VALUES (2023, 8, 12, 18, 'OLIVIA', 'CHONGO', '96090508036', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2014, 0, 0, 'Solt.', 'PALMAR #12241 ALTO', 'E/ INDEPENDENCIA Y AMÉRICA', 310, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 24657, 'Determinado x S.Soc.', 'ENRIQUEZ', '8');
INSERT INTO `trabajador` VALUES (2024, 8, 55, 4, 'OSNIEL', 'IZQUIERDO', '96082509963', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'POCITO #373', 'E/ 8VA Y 9NA, LAWTON', 309, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 24661, 'Determinado x S.Soc.', 'MEDRANO', '16');
INSERT INTO `trabajador` VALUES (2025, 7, 73, 41, 'DOREMIS LEONOR', 'MANZANET', '96010307230', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'CALIXTO GARCÍA NO. 56', 'PINAR DEL RIO Y SANTA CLARA', 314, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 24662, 'Determinado x S.Soc.', 'CARBÓ', '82');
INSERT INTO `trabajador` VALUES (2026, 3, 12, 30, 'DAYANIS', 'RODRIGUEZ', '96052613017', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'CALLE 5', 'E/ 3 PALMAS Y LINDERO', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Nacional # 14125 / Lililoy y Arday. Aldabo', 24669, 'Determinado x S.Soc.', 'PONCE', '117');
INSERT INTO `trabajador` VALUES (2027, 4, 12, 40, 'ZULEIKA', 'CORTINA', '95020228170', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2013, 0, 0, 'Solt.', 'CALLE  A # 195   apto 5', 'e/ 3RA Y GÜINERA  RPTO ROSARIO', 314, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23140, 'Determinado x S.Soc.', 'MIRO', '42');
INSERT INTO `trabajador` VALUES (2028, 8, 13, 18, 'YUMITSEY', 'MARTÍNEZ', '96100908598', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'PANIAGUA', 'E/ EMPRESA Y REYES', 310, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 24740, 'Determinado x S.Soc.', 'MONGEOTTI', '47');
INSERT INTO `trabajador` VALUES (2029, 7, 55, 4, 'RAYDEL ALEJANDRO', 'GALLEGO', '96111108664', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2014, 0, 0, 'Solt.', 'SANTA ANA #206', 'E/ JUSTICIA Y LUCO, LUYANÓ', 309, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 24771, 'Determinado x S.Soc.', 'DÍAZ', '257');
INSERT INTO `trabajador` VALUES (2030, 1, 73, 20, 'ARIANNA', 'GE', '96062210015', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', '230', 'E/ 25 A Y 25', 312, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 24856, 'Determinado x S.Soc.', 'CHIRINO', '113');
INSERT INTO `trabajador` VALUES (2031, 8, 71, 24, 'LORENA', 'RECIO', '96102017173', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2014, 0, 0, 'Solt.', 'CALZADA DE SAN MIGUEL #1605', 'E/BALEAR Y SANTA FRANCISCA,RPTO ROCAFORT', 308, NULL, 'BPD Área Residencia', 961, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 25708, 'Determinado x S.Soc.', 'MARTÍNEZ', '195');
INSERT INTO `trabajador` VALUES (2032, 8, 32, NULL, 'DANAYLI', 'GONZÁLEZ', '97103106796', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', '172 EDIF 17811, APTO 17', 'E/ CENTRAL Y FINAL', 313, NULL, 'BPD Área Residencia', 0, NULL, 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 25905, 'Determinado x S.Soc.', 'SERPA', '155');
INSERT INTO `trabajador` VALUES (2033, 8, 12, 18, 'JAYLIN', 'CAREAGA', '97112107458', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'AVE. RANCHO BOYEROS  Km 3   1/2', 'e/ LÍNEA FERROCARRIL Y CRUCERO ARMADA', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 25907, 'Determinado x S.Soc.', 'MORENO', '139');
INSERT INTO `trabajador` VALUES (2034, 5, 75, 6, 'CLAUDIA', 'HERNÁNDEZ', '97032506095', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'CALLE 20 #6146', 'E/ 61 Y 63, REPARTO VISTA ALEGRE', 315, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25908, 'Determinado x S.Soc.', 'ESTRADA', '144');
INSERT INTO `trabajador` VALUES (2035, 8, 12, 38, 'VERONIKA MARIA', 'MIRANDA', '97110107371', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2015, 0, 0, 'Solt.', 'CONCEPCION NO 14', 'ENTRE DELICIAS Y CALZADA DE 10 DE OCT', 309, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 25912, 'Determinado x S.Soc.', 'VERGARA', '31');
INSERT INTO `trabajador` VALUES (2036, 3, 12, 30, 'CLAUDIA', 'GONZALEZ', '97122306656', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Informática', 2015, 0, 0, 'Solt.', 'CALLE104 NO. 28312', 'ENTRE CALLE 283 Y CALLE 285 RPTO CALABAZ', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25916, 'Determinado x S.Soc.', 'MARTI', '154');
INSERT INTO `trabajador` VALUES (2037, 3, 75, 6, 'DEMISLEYDIS', 'PLANA', '97110406652', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'JESÚS NAZARENO #26320', 'E/ BOHEMIA Y MÁXIMO GÓMEZ, LAS CAÑAS', 313, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25920, 'Determinado x S.Soc.', 'NOBLET', '25');
INSERT INTO `trabajador` VALUES (2038, 2, 75, 6, 'LAURA DE LA CARIDAD', 'NAPOLES', '97090606778', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'CALLE12 EDIF18600 APTO19', 'ENTRE CALLE BEATRÍZ Y CALLE LINDERO', 313, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25921, 'Determinado x S.Soc.', 'GOMEZ', '112');
INSERT INTO `trabajador` VALUES (2039, 4, 75, 6, 'RAQUEL', 'CALDERIN', '97122306834', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', '18033 #26129', 'E/ 184 Y 255, RIO VERDE', 313, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25922, 'Determinado x S.Soc.', 'PEÑA', '126');
INSERT INTO `trabajador` VALUES (2040, 3, 75, 6, 'MAYLIN', 'BANCRAFF', '97120906492', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'CALLE E #222', 'E/ 5TA Y 6TA, REPARTO POEY', 314, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25923, 'Determinado x S.Soc.', 'LAFERTE', '130');
INSERT INTO `trabajador` VALUES (2041, 5, 55, 4, 'DAYRON', 'TAMAYO', '97092107322', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Electrónica', 2015, 0, 0, 'Solt.', 'CALLE 7MA #4193 B', 'E/ A Y B, REBOLEDO', 308, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Cotorro: Calle 101 #1623 / 14 y16', 25925, 'Determinado x S.Soc.', 'AJETE', '8');
INSERT INTO `trabajador` VALUES (2042, 6, 55, 4, 'RANDY', 'PEREZ', '97102107406', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2015, 0, 0, 'Solt.', '2DA EDIF19 APTO1', 'ENTRE B Y A', 308, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'San Miguel del Padrón: Calzada de Guines s/n Esq. a la Flora', 25927, 'Determinado x S.Soc.', 'ROSS', '21');
INSERT INTO `trabajador` VALUES (2043, 7, 55, 4, 'RUBÉN ORLANDO', 'ORTIZ', '97100907567', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2015, 0, 0, 'Solt.', 'CALLE 4TA #9', 'E/ ACOSTA Y LAGUERUELA', 309, NULL, 'BPD Área Residencia', 880, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 25928, 'Determinado x S.Soc.', 'VASALLO', '229');
INSERT INTO `trabajador` VALUES (2044, 1, 73, 44, 'HENRY', 'RABELO', '97092207546', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 0, 0, 0, 'Solt.', 'CALLE 67 #4404', 'E/ 44 Y 46, REPARTO MODELO', 315, NULL, 'BPD Área Residencia', 1297, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 25929, 'Determinado x S.Soc.', 'RODRÍGUEZ', '28');
INSERT INTO `trabajador` VALUES (2045, 1, 9, 1, 'JARVIS', 'ESPINOSA', '95082928744', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Comercio', 2013, 0, 0, 'Solt.', 'CALLE:184 No:27317 e/ CALLE:273', 'Y CALLE: 279. RPTO: BALUARTE, BOYEROS', 313, NULL, 'BPD Centro de Trabajo', 806, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26139, 'Determinado x S.Soc.', 'ALFARO', '49');
INSERT INTO `trabajador` VALUES (2046, 8, 32, NULL, 'YURAIMA SONIA', 'COLÁS', '97112906991', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2015, 0, 0, 'Solt.', 'Calle 4ta. No. 13623', 'e/ 5ta y San Francisco', 308, NULL, 'BPD Área Residencia', 0, NULL, 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 26348, 'Determinado x S.Soc.', 'DUVERGEL', '150');
INSERT INTO `trabajador` VALUES (2047, 8, 54, 46, 'YONIEL ALEJANDRO', 'GARCÍA', '96110509964', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'REMEDIOSS #221 1ER PISO', 'LOURDES Y ALEGRÍA, VÍBORA PARK', 314, NULL, 'BPD Centro de Trabajo', 961, 'CUP', 'Operario', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 26559, 'Determinado x S.Soc.', 'RODRÍGUEZ', '9');
INSERT INTO `trabajador` VALUES (2048, 5, 75, 6, 'REINIER', 'CASTRO', '95082627623', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Recursos Humanos', 2013, 0, 0, 'Solt.', 'EDIFICIO 46 APTO 4, MICRO', 'SAN JOSÉ MAYABEQUE', 207, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26677, 'Determinado x S.Soc.', 'TOLEDO', '9');
INSERT INTO `trabajador` VALUES (2049, 1, 75, 6, 'DIANELYS', 'LEDEA', '97102307535', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Contabilidad y Finanzas', 2015, 0, 0, 'Solt.', 'Calle B', 'Calle 3 y Calle 4', 308, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26736, 'Determinado x S.Soc.', 'OTERO', '19');
INSERT INTO `trabajador` VALUES (2050, 3, 75, 6, 'ALEJANDRO', 'RODRÍGUEZ', '98111306341', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 2016, 0, 0, 'Solt.', 'CALLE PRIMERA No. 111', 'E/ POCITO Y ESPERANZA', 314, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26959, 'Determinado x S.Soc.', 'TORRES', '23');
INSERT INTO `trabajador` VALUES (2051, 1, 75, 6, 'NEIBIS', 'SAUMELL', '98062608575', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2016, 0, 0, 'Solt.', 'LIBERTAD No. 414 APTO 3', 'E/ JUAN DELGADO Y D¨STRAMPES, SNTOS SUÁR', 309, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26962, 'Determinado x S.Soc.', 'CAO', '49');
INSERT INTO `trabajador` VALUES (2052, 1, 75, 6, 'IVAN CARLOS', 'SANTANA', '96051407243', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'YUMURI NO. 361', 'ENTRE CALLE NORTE Y CALLE JOAQUIN DELGAD', 314, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26963, 'Determinado x S.Soc.', 'SANCHEZ', '29');
INSERT INTO `trabajador` VALUES (2053, 3, 75, 6, 'LIVAN D\' WILIAM', 'CHACON', '98032906367', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Electrónica', 2016, 0, 0, 'Solt.', 'CALZADA DE BEJUCAL NO. 61 B', 'CALLE LINCON Y CALLE AGRAMONTE', 314, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26969, 'Determinado x S.Soc.', 'ESTRADA', '41');
INSERT INTO `trabajador` VALUES (2054, 7, 75, 6, 'PAULA', 'PEREZ', '98121807331', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2016, 0, 0, 'Solt.', 'BEALES NO. 61 INTERIOR', 'ENTRE 8 Y 9', 309, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26972, 'Determinado x S.Soc.', 'MONTERO', '135');
INSERT INTO `trabajador` VALUES (2055, 7, 75, 6, 'ROXANA', 'PÉREZ', '98111307478', '0', 'Blanca', 'Técnico Medio', 'Tec. Med. en Gestión de Capital Humano', 2016, 0, 0, 'Solt.', 'VISTA HERMOSA No 2625', 'PAULA Y OTERO   SMP', 308, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26982, 'Determinado x S.Soc.', 'RAMÍREZ', '137');
INSERT INTO `trabajador` VALUES (2056, 1, 75, 6, 'NAYLEN', 'PONCE', '98111007638', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Recursos Humanos', 2016, 0, 0, 'Solt.', 'AVE. 247 NO.9202', 'E/ CALLE 92 Y CALLE 94 RPTO LA CUMBRE', 308, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26984, 'Determinado x S.Soc.', 'ARTILES', '45');
INSERT INTO `trabajador` VALUES (2057, 8, 75, 6, 'JOHNNY', 'JOHN', '96112708425', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'TRES PALACIOS', 'ENTRE JUAN ALONSO Y TERESA BLANCO', 309, NULL, 'BPD Área Residencia', 739, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 27047, 'Determinado x S.Soc.', 'PENA', '139');
INSERT INTO `trabajador` VALUES (2058, 1, 75, 6, 'ODALMIS MERCEDES', 'NAVARRO', '98011807053', '0', 'Negra', 'Técnico Medio', 'Téc. Med. en Contabilidad', 2016, 0, 0, 'Solt.', 'INDIO #106', 'E/ CORRALES Y GLORIA', 304, NULL, NULL, 739, 'CUP', 'Técnico', NULL, NULL, 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 27079, 'Determinado x S.Soc.', 'VALDÉS', '126');
INSERT INTO `trabajador` VALUES (2059, 7, 12, 36, 'NILZA    LEUMARIS', 'LÓPEZ', '96113007610', '0', 'Mestiza', 'Técnico Medio', 'Téc. Med. en Telecomunicaciones', 2014, 0, 0, 'Solt.', 'CALLE 7   # 58    Apto. 3', 'E/ CALLE A y CALLE B    RPTO    POEY', 314, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 2', NULL, 'Diez de Octubre: Diez de Octubre # 1251 / V. Alegre y Carmen', 25052, 'Determinado x S.Soc.', 'DOMÍNGUEZ', '118');
INSERT INTO `trabajador` VALUES (2060, 1, 21, 22, 'ELAINE', 'CUBILLAS', '90100228978', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones', 2016, 0, 0, 'Cas.', 'CALLE 50 # 3112', 'ENTRE AVE. 31 Y AVE. 33', 301, NULL, 'BPD Área Residencia', 1452, 'CUP', 'Técnico', 'Modulo 1', 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 27061, 'Determ.  x P Prueba', 'HERNANDEZ', '228');
INSERT INTO `trabajador` VALUES (2061, 4, 12, 40, 'GRETTEL', 'FERRO', '92010106010', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Informática', 2009, 0, 0, 'Solt.', '182 # 41103', '411 Y 413 SANTIAGO VEGAS', 313, NULL, 'BPD Área Residencia', 1095, 'CUP', 'Técnico', 'Modulo 1', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 23166, 'Determinado x Sust.', 'PÉREZ', '136');
INSERT INTO `trabajador` VALUES (2062, 5, 73, 8, 'SUSET', 'CASTELLANO', '85112806739', '0', 'Blanca', 'Superior', 'Lic. en Psicología', 2009, 0, 0, 'Cas.', 'CALLE 113 # 3408 ALTOS  % 34 Y 36', 'RPTO AGUILA HATUEY COTORRO', 315, NULL, 'No incorporado', 1297, 'CUP', 'Técnico', 'Modulo 1', 'Lic.', 'Cotorro: Ave.101# 1623 / 16 y 18', 25871, 'Determinado x Sust.', 'BETANCOURT', '109');
INSERT INTO `trabajador` VALUES (2063, 4, 32, NULL, 'BÁRBARA', 'RIVERO', '59031202937', '0', 'Negra', 'Medio Superior', '12mo Grado', 2008, 0, 0, 'Solt.', 'CALLE 281 NO.11412', '114  Y  116  CALABAZAR', 313, NULL, 'No incorporado', 0, NULL, 'Servicios', 'Modulo 2', NULL, 'Boyeros: Ave. 407 # 40704 Esq. a 196. Sgto. Vegas', 18226, 'Determinado x ETE.', 'GONZÁLEZ', '153');
INSERT INTO `trabajador` VALUES (2064, 8, 32, NULL, 'ROSA MARIA', 'SEGURA', '61062303136', '0', 'Negra', 'Medio Superior', '12mo Grado', 1986, 0, 0, 'Cas.', 'LUIS ESTEVES No 509', 'JUAN DELGADO Y GOICURIA STOS SUAREZ 10 D', 309, NULL, 'Se evacua', 0, 'CUP', 'Servicios', 'Modulo 2', NULL, 'Diez de Octubre: Luis Estevez #369/ J. Delgado y D¨Strampes', 26343, 'Determinado x ETE.', 'HERRERA', '143');
INSERT INTO `trabajador` VALUES (2065, 1, 32, NULL, 'ANDRO MANUEL', 'REY', '75082102986', '0', 'Blanca', 'Superior', 'Ing. en Telecomunicaciones y Electrónica', 2008, 0, 0, 'Solt.', 'CALLE 160 A # 28940A', 'ENTRE 289 Y LINEA DE FERROCARRIL', 313, NULL, NULL, 0, NULL, 'Operario', NULL, 'Ing.', 'Diez de Octubre: Goicuría #101 esq. Luis Estévez', 26928, 'Determinado x ETE.', 'DOMÍNGUEZ', '167');
INSERT INTO `trabajador` VALUES (2066, 7, 32, NULL, 'RAIHAM HUMBERTO', 'JAUMA', '77040207900', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Electrónica', 1996, 0, 0, 'Solt.', 'CALLE 164 #30708', 'ENTRE 307 Y 309', 313, NULL, NULL, 0, NULL, 'Operario', NULL, NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 26931, 'Determinado x ETE.', 'ALFONSO', '41');
INSERT INTO `trabajador` VALUES (2067, 7, 32, NULL, 'ANDRÉS ADRIÁN', 'CÁRDENAS', '87100107224', '0', 'Blanca', 'Técnico Medio', 'Téc. Med. en Construcción Civil', 2006, 0, 0, 'Cas.', 'CALLE 246 EDIF 24736 APTO 10', 'ENTRE 247 Y 249', 313, NULL, NULL, 0, NULL, 'Operario', NULL, NULL, 'Diez de Octubre: Luz # 151 / Reyes y Arellano', 26932, 'Determinado x ETE.', 'SÁNCHEZ', '148');

-- ----------------------------
-- Table structure for traza
-- ----------------------------
DROP TABLE IF EXISTS `traza`;
CREATE TABLE `traza`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NULL DEFAULT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `fecha` datetime(0) NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_AD36B8A0FCF8192D`(`id_usuario`) USING BTREE,
  CONSTRAINT `FK_AD36B8A0FCF8192D` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of traza
-- ----------------------------
INSERT INTO `traza` VALUES (4, 10, 'Vista Trabajador', '2020-01-09 05:45:23', '');
INSERT INTO `traza` VALUES (5, 10, 'Vista Unidad Organizativa', '2020-01-09 05:52:43', '');
INSERT INTO `traza` VALUES (6, 10, 'Vista Usuario', '2020-01-09 05:53:00', '');
INSERT INTO `traza` VALUES (7, 10, 'Vista Trabajador', '2020-01-11 08:21:10', '');
INSERT INTO `traza` VALUES (8, 10, 'Vista Usuario', '2020-01-13 04:36:24', '');
INSERT INTO `traza` VALUES (9, 10, 'Crear Usuario', '2020-01-13 04:36:59', '');
INSERT INTO `traza` VALUES (10, 10, 'Vista Usuario', '2020-01-13 04:37:53', '');
INSERT INTO `traza` VALUES (11, 10, 'Vista Usuario', '2020-01-13 04:38:23', '');
INSERT INTO `traza` VALUES (12, 10, 'Crear Usuario', '2020-01-13 04:38:41', '');
INSERT INTO `traza` VALUES (13, 10, 'Modificar Usuario', '2020-01-13 04:38:59', '');
INSERT INTO `traza` VALUES (14, 10, 'Vista Usuario', '2020-01-13 04:39:00', '');
INSERT INTO `traza` VALUES (15, 10, 'Vista Usuario', '2020-01-13 21:10:57', '');
INSERT INTO `traza` VALUES (16, 10, 'Vista Unidad Organizativa', '2020-01-14 19:59:18', '');
INSERT INTO `traza` VALUES (17, 10, 'Vista Usuario', '2020-01-14 21:51:05', '');
INSERT INTO `traza` VALUES (18, 10, 'Crear Usuario', '2020-01-14 21:51:39', '');
INSERT INTO `traza` VALUES (19, 13, 'Vista Trabajador', '2020-01-15 20:15:02', '');
INSERT INTO `traza` VALUES (20, 10, 'Vista Usuario', '2020-01-16 15:27:27', '');
INSERT INTO `traza` VALUES (21, 10, 'Vista Usuario', '2020-01-16 15:28:01', '');
INSERT INTO `traza` VALUES (22, 10, 'Vista Usuario', '2020-01-16 15:31:28', '');
INSERT INTO `traza` VALUES (23, 10, 'Vista Usuario', '2020-01-16 15:33:52', '');
INSERT INTO `traza` VALUES (24, 10, 'Vista Usuario', '2020-01-16 15:34:06', '');
INSERT INTO `traza` VALUES (25, 10, 'Vista Usuario', '2020-01-16 15:58:27', '');
INSERT INTO `traza` VALUES (26, 10, 'Vista Usuario', '2020-01-16 15:59:10', '');
INSERT INTO `traza` VALUES (27, 10, 'Vista Usuario', '2020-01-16 16:00:14', '');
INSERT INTO `traza` VALUES (28, 10, 'Vista Usuario', '2020-01-16 16:00:52', '');
INSERT INTO `traza` VALUES (29, 10, 'Vista Usuario', '2020-01-16 16:00:54', '');
INSERT INTO `traza` VALUES (30, 10, 'Vista Usuario', '2020-01-16 16:01:52', '');
INSERT INTO `traza` VALUES (31, 10, 'Vista Usuario', '2020-01-16 16:01:55', '');
INSERT INTO `traza` VALUES (32, 10, 'Vista Usuario', '2020-01-16 16:04:03', '');
INSERT INTO `traza` VALUES (33, 10, 'Vista Usuario', '2020-01-16 16:13:41', '');
INSERT INTO `traza` VALUES (34, 10, 'Vista Usuario', '2020-01-16 16:14:22', '');
INSERT INTO `traza` VALUES (35, 10, 'Vista Usuario', '2020-01-16 16:15:27', '');
INSERT INTO `traza` VALUES (36, 10, 'Vista Usuario', '2020-01-16 16:15:46', '');
INSERT INTO `traza` VALUES (37, 10, 'Vista Usuario', '2020-01-16 16:16:14', '');
INSERT INTO `traza` VALUES (38, 10, 'Vista Usuario', '2020-01-16 16:17:01', '');
INSERT INTO `traza` VALUES (39, 10, 'Vista Trabajador', '2020-01-18 14:12:23', '');
INSERT INTO `traza` VALUES (40, 10, 'Vista Usuario', '2020-01-18 14:24:37', '');
INSERT INTO `traza` VALUES (41, 10, 'Vista Unidad Organizativa', '2020-01-19 00:33:18', '');
INSERT INTO `traza` VALUES (42, 10, 'Vista Usuario', '2020-01-19 00:35:28', '');
INSERT INTO `traza` VALUES (43, 10, 'Vista Trabajador', '2020-01-19 00:41:51', '');
INSERT INTO `traza` VALUES (44, 10, 'Vista Usuario', '2020-01-19 04:14:17', '');
INSERT INTO `traza` VALUES (45, 10, 'Vista Usuario', '2020-01-19 04:14:35', '');
INSERT INTO `traza` VALUES (46, 10, 'Vista Usuario', '2020-01-19 04:14:41', '');
INSERT INTO `traza` VALUES (47, 10, 'Vista Usuario', '2020-01-19 04:14:47', '');
INSERT INTO `traza` VALUES (48, 10, 'Vista Usuario', '2020-01-19 04:14:51', '');
INSERT INTO `traza` VALUES (49, 10, 'Crear Usuario', '2020-01-19 04:16:26', '');
INSERT INTO `traza` VALUES (50, 10, 'Vista Usuario', '2020-01-19 05:35:05', '');
INSERT INTO `traza` VALUES (51, 10, 'Vista Usuario', '2020-01-19 05:35:59', '');
INSERT INTO `traza` VALUES (52, 10, 'Vista Usuario', '2020-01-19 05:37:19', '');
INSERT INTO `traza` VALUES (53, 10, 'Vista Usuario', '2020-01-19 05:38:06', '');
INSERT INTO `traza` VALUES (54, 10, 'Modificar Usuario', '2020-01-19 05:38:54', '');
INSERT INTO `traza` VALUES (55, 10, 'Vista Usuario', '2020-01-19 05:38:54', '');
INSERT INTO `traza` VALUES (56, 10, 'Vista Usuario', '2020-01-20 00:07:16', '');
INSERT INTO `traza` VALUES (57, 13, 'Vista Unidad Organizativa', '2020-01-20 00:09:39', '');

-- ----------------------------
-- Table structure for unidad_organizativa
-- ----------------------------
DROP TABLE IF EXISTS `unidad_organizativa`;
CREATE TABLE `unidad_organizativa`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unidad_organizativa
-- ----------------------------
INSERT INTO `unidad_organizativa` VALUES (1, 'ALMACEN CENTRAL');
INSERT INTO `unidad_organizativa` VALUES (2, 'BRIGADA DE CABLE');
INSERT INTO `unidad_organizativa` VALUES (3, 'BRIGADA DE RECONSTRUCCION DE BAJANTES');
INSERT INTO `unidad_organizativa` VALUES (4, 'BRIGADA TELEFONIA PUBLICA');
INSERT INTO `unidad_organizativa` VALUES (5, 'BRIGADAS DE LINEA');
INSERT INTO `unidad_organizativa` VALUES (6, 'CAPITAL HUMANO');
INSERT INTO `unidad_organizativa` VALUES (7, 'CENTRO DE TELECOM PPAL COTORRO(7 776 LI)');
INSERT INTO `unidad_organizativa` VALUES (8, 'CENTRO DE TELECOM PPAL COTORRO(8 191 LI)');
INSERT INTO `unidad_organizativa` VALUES (9, 'CENTRO DE TELECOM PPAL CUMBRE(12 620 LI)');
INSERT INTO `unidad_organizativa` VALUES (10, 'CENTRO DE TELECOM PPAL CUMBRE(13 696 LI)');
INSERT INTO `unidad_organizativa` VALUES (11, 'CENTRO DE TELECOM. PPAL ALDABO(26 072 LI)');
INSERT INTO `unidad_organizativa` VALUES (12, 'CENTRO DE TELECOM. PPAL BOYEROS(16038 LI');
INSERT INTO `unidad_organizativa` VALUES (13, 'CENTRO DE TELECOM. PPAL BOYEROS(20 250 LI)');
INSERT INTO `unidad_organizativa` VALUES (14, 'CENTRO DE TELECOM. PPAL LUZ  (21 825 LI)');
INSERT INTO `unidad_organizativa` VALUES (15, 'CENTRO DE TELECOM. PPAL LUZ  (24 504 LI)');
INSERT INTO `unidad_organizativa` VALUES (16, 'CENTRO DE TELECOM. PPAL MONTE(33 972 LI)');
INSERT INTO `unidad_organizativa` VALUES (17, 'CENTRO DE TELECOM. PPAL MONTE(34 700 LI)');
INSERT INTO `unidad_organizativa` VALUES (18, 'CENTRO MULTISERVICIOS CASINO DEPORTIVO');
INSERT INTO `unidad_organizativa` VALUES (19, 'COMERCIAL');
INSERT INTO `unidad_organizativa` VALUES (20, 'COMERCIALIZACIÓN');
INSERT INTO `unidad_organizativa` VALUES (21, 'CONTABILIDAD');
INSERT INTO `unidad_organizativa` VALUES (22, 'DIVISION TERRITORIAL SUR');
INSERT INTO `unidad_organizativa` VALUES (23, 'ECONOMIA');
INSERT INTO `unidad_organizativa` VALUES (24, 'ECONOMICO ADMINISTRATIVO');
INSERT INTO `unidad_organizativa` VALUES (25, 'LOGISTICA');
INSERT INTO `unidad_organizativa` VALUES (26, 'LOGISTICA Y SERVICIO');
INSERT INTO `unidad_organizativa` VALUES (27, 'MESA DE PRUEBA TERRITORIAL(109 881 LS)');
INSERT INTO `unidad_organizativa` VALUES (28, 'MESA DE PRUEBA TERRITORIAL(114 883 LS)');
INSERT INTO `unidad_organizativa` VALUES (29, 'OFICINA COMERCIAL ALDABO (20 546 LS)');
INSERT INTO `unidad_organizativa` VALUES (30, 'OFICINA COMERCIAL ALDABO (24 541 LS)');
INSERT INTO `unidad_organizativa` VALUES (31, 'OFICINA COMERCIAL COTORRO ( 6 247 LS)');
INSERT INTO `unidad_organizativa` VALUES (32, 'OFICINA COMERCIAL COTORRO ( 6 836 LS)');
INSERT INTO `unidad_organizativa` VALUES (33, 'OFICINA COMERCIAL CUMBRE(11 377 LS)');
INSERT INTO `unidad_organizativa` VALUES (34, 'OFICINA COMERCIAL CUMBRE(12 933 LS)');
INSERT INTO `unidad_organizativa` VALUES (35, 'OFICINA COMERCIAL LUZ (18 562 LS)');
INSERT INTO `unidad_organizativa` VALUES (36, 'OFICINA COMERCIAL LUZ (19 814 LS)');
INSERT INTO `unidad_organizativa` VALUES (37, 'OFICINA COMERCIAL MONTE (27 674 LS)');
INSERT INTO `unidad_organizativa` VALUES (38, 'OFICINA COMERCIAL MONTE (29 069 LS)');
INSERT INTO `unidad_organizativa` VALUES (39, 'OFICINA COMERCIAL STGO DE LA VEGAS(10552)');
INSERT INTO `unidad_organizativa` VALUES (40, 'OFICINA COMERCIAL STGO DE LA VEGAS(13197)');
INSERT INTO `unidad_organizativa` VALUES (41, 'OPERACION Y MANTENIMIENTO');
INSERT INTO `unidad_organizativa` VALUES (42, 'OPERACIONES DE LA RED');
INSERT INTO `unidad_organizativa` VALUES (43, 'PLANTA EXTERIOR');
INSERT INTO `unidad_organizativa` VALUES (44, 'PLANTA INTERIOR');
INSERT INTO `unidad_organizativa` VALUES (45, 'RECAUDACION');
INSERT INTO `unidad_organizativa` VALUES (46, 'RED DE ABONADOS');
INSERT INTO `unidad_organizativa` VALUES (47, 'SERVICIOS GENERALES');
INSERT INTO `unidad_organizativa` VALUES (48, 'SOPORTE A LA OPERACION');
INSERT INTO `unidad_organizativa` VALUES (49, 'TECNOLOGIAS DE LA INFORMACION');
INSERT INTO `unidad_organizativa` VALUES (50, 'TELEFONIA PUBLICA');
INSERT INTO `unidad_organizativa` VALUES (51, 'TRANSPORTE');
INSERT INTO `unidad_organizativa` VALUES (52, 'UNIDAD OPERATIVA');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) NULL DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_2265B05D5CB4216A`(`id_area`) USING BTREE,
  CONSTRAINT `FK_2265B05D5CB4216A` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (10, 1, 'alejandro.veitia', '$2y$13$fj3QErwkttwz.F5Ha4zyxOPHb.H8jTTMqarky2bxnxF2Bam6FEpYi', 'alejandro.veitia@etecsa.cu', 'Alejandro Veitia Ramos', 'Administrador');
INSERT INTO `usuario` VALUES (13, 1, 'especialista', '$2y$13$3yuiGg7lpKoP3gnpEZIhVunHRUZcmwzQr83.z4G0Xi2lBHmJUJ2fG', 'especialista@etecsa.cu', 'Especialista', 'Especialista');
INSERT INTO `usuario` VALUES (14, 6, 'tecnico', '$2y$13$m7z3xGwgON0rLOuoAsmExuwhDOai455c0t28ULBTCd1tpiXTqgpeq', 'tecnico@etecsa.cu', 'Tecnico', 'Técnico');
INSERT INTO `usuario` VALUES (15, 2, 'usuario', '$2y$13$xsKgSXXej9E3jVIJ6wcg6eMnRYEYC22soK4I.jK5Ip6i32v3mlv52', 'usuario@etecsa.cu', 'Usuario', 'Usuario');
INSERT INTO `usuario` VALUES (16, 8, 'vanessa', '$2y$13$pdoEipEK9MCLLounXMyRd.FELgBopd9LJP05bCpqP9XN3Qswww/oy', 'vanessa@etecsa.cu', 'Vanessa Veitia Vázquez', 'Jefe Brigada');

-- ----------------------------
-- Table structure for vacuna
-- ----------------------------
DROP TABLE IF EXISTS `vacuna`;
CREATE TABLE `vacuna`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_vacuna` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacuna
-- ----------------------------
INSERT INTO `vacuna` VALUES (1, 'Leptospirosis');

-- ----------------------------
-- Table structure for vacuna_trabajador
-- ----------------------------
DROP TABLE IF EXISTS `vacuna_trabajador`;
CREATE TABLE `vacuna_trabajador`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vacuna` int(11) NULL DEFAULT NULL,
  `id_trabajador` int(11) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_cargo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_ADF2ADA054BE41DE`(`id_vacuna`) USING BTREE,
  INDEX `IDX_ADF2ADA0E79FFC08`(`id_trabajador`) USING BTREE,
  INDEX `IDX_ADF2ADA0D56B1641`(`id_cargo`) USING BTREE,
  CONSTRAINT `FK_ADF2ADA054BE41DE` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ADF2ADA0D56B1641` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ADF2ADA0E79FFC08` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajador` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacuna_trabajador
-- ----------------------------
INSERT INTO `vacuna_trabajador` VALUES (1, 1, 1379, '2020-01-08', NULL, NULL, NULL);
INSERT INTO `vacuna_trabajador` VALUES (3, 1, 1380, '2020-01-08', NULL, NULL, NULL);
INSERT INTO `vacuna_trabajador` VALUES (4, 1, 2005, '2020-01-17', NULL, NULL, 27);
INSERT INTO `vacuna_trabajador` VALUES (5, 1, 1940, '2020-01-17', NULL, NULL, 36);
INSERT INTO `vacuna_trabajador` VALUES (6, 1, 2005, '2020-01-31', NULL, NULL, 27);

SET FOREIGN_KEY_CHECKS = 1;
