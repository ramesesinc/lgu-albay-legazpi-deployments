/*
 Navicat Premium Data Transfer

 Source Server         : etracs-mysql
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : dev_obo

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 23/01/2020 08:51:50
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for occupancy_permit
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit`;
CREATE TABLE `occupancy_permit` (
  `objid` varchar(50) NOT NULL,
  `appno` varchar(50) DEFAULT NULL,
  `apptype` varchar(50) DEFAULT NULL,
  `orgcode` varchar(50) DEFAULT NULL,
  `trackingno` varchar(50) DEFAULT NULL,
  `permitno` varchar(50) DEFAULT NULL,
  `dtissued` date DEFAULT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_detail` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_mobileno` varchar(50) DEFAULT NULL,
  `dtfiled` datetime DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  `bldgpermitid` varchar(50) DEFAULT NULL,
  `applicantid` varchar(50) DEFAULT NULL,
  `txnmode` varchar(50) DEFAULT NULL,
  `totalmaterialcost` decimal(16,2) DEFAULT NULL,
  `totaldirectlaborcost` decimal(16,2) DEFAULT NULL,
  `totalequipmentcost` decimal(16,2) DEFAULT NULL,
  `totalothercost` decimal(16,2) DEFAULT NULL,
  `occupancytypeid` varchar(50) DEFAULT NULL,
  `actualnumunits` smallint(3) DEFAULT NULL,
  `fixedcost` decimal(16,2) DEFAULT NULL,
  `actualtotalfloorarea` decimal(16,2) DEFAULT NULL,
  `actualheight` decimal(16,2) DEFAULT NULL,
  `actualnumfloors` smallint(255) DEFAULT NULL,
  `dtactualstarted` date DEFAULT NULL,
  `dtactualcompleted` date DEFAULT NULL,
  `inspectionschedule` datetime DEFAULT NULL,
  `profarchitectid` varchar(50) DEFAULT NULL,
  `profcivilid` varchar(50) DEFAULT NULL,
  `profelectricalid` varchar(50) DEFAULT NULL,
  `profmechanicalid` varchar(50) DEFAULT NULL,
  `profsanitaryid` varchar(50) DEFAULT NULL,
  `profplumbingid` varchar(50) DEFAULT NULL,
  `profelectronicid` varchar(50) DEFAULT NULL,
  `profinteriorid` varchar(50) DEFAULT NULL,
  `supervisorelectricalid` varchar(50) DEFAULT NULL,
  `supervisormechanicalid` varchar(50) DEFAULT NULL,
  `supervisorsanitaryid` varchar(50) DEFAULT NULL,
  `supervisorplumbingid` varchar(50) DEFAULT NULL,
  `supervisorelectronicid` varchar(50) DEFAULT NULL,
  `supervisorinteriorid` varchar(50) DEFAULT NULL,
  `supervisorid` varchar(50) DEFAULT NULL,
  `contractorid` varchar(50) DEFAULT NULL,
  `firealarmcost` decimal(16,2) DEFAULT NULL,
  `sprinklercost` decimal(16,2) DEFAULT NULL,
  `lpgpipingcost` decimal(16,2) DEFAULT NULL,
  `firesuppcost` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  UNIQUE KEY `uix_occupancy_permit_appno` (`appno`) USING BTREE,
  UNIQUE KEY `uix_occupancy_permitno` (`permitno`) USING BTREE,
  KEY `occupancy_permit_taskid` (`taskid`) USING BTREE,
  KEY `occupancy_permit_permitid` (`bldgpermitid`) USING BTREE,
  KEY `fk_occupancy_permit_applicantid` (`applicantid`),
  CONSTRAINT `fk_occupancy_permit_applicantid` FOREIGN KEY (`applicantid`) REFERENCES `occupancy_permit_entity` (`objid`),
  CONSTRAINT `fk_occupancy_permit_permitid` FOREIGN KEY (`bldgpermitid`) REFERENCES `building_permit` (`objid`),
  CONSTRAINT `fk_occupancy_permit_taskid` FOREIGN KEY (`taskid`) REFERENCES `occupancy_permit_task` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_entity
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_entity`;
CREATE TABLE `occupancy_permit_entity` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `appid` varchar(50) DEFAULT NULL,
  `profileid` varchar(50) DEFAULT NULL,
  `entitytype` varchar(50) DEFAULT NULL,
  `profileno` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `resident` int(255) DEFAULT NULL,
  `address_objid` varchar(50) DEFAULT NULL,
  `address_text` varchar(255) DEFAULT NULL,
  `address_unitno` varchar(50) DEFAULT NULL,
  `address_bldgno` varchar(50) DEFAULT NULL,
  `address_bldgname` varchar(100) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `address_subdivision` varchar(255) DEFAULT NULL,
  `address_barangay_objid` varchar(50) DEFAULT NULL,
  `address_barangay_name` varchar(50) DEFAULT NULL,
  `address_citymunicipality` varchar(50) DEFAULT NULL,
  `address_province` varchar(50) DEFAULT NULL,
  `tin` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `phoneno` varchar(50) DEFAULT NULL,
  `id` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fx_building_application_entity_appid_role` (`appid`) USING BTREE,
  CONSTRAINT `fk_occupancy_permit_entity_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_fee
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_fee`;
CREATE TABLE `occupancy_permit_fee` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `sectionid` varchar(50) DEFAULT NULL,
  `itemid` varchar(50) DEFAULT NULL,
  `amount` decimal(16,4) DEFAULT NULL,
  `amtpaid` decimal(16,4) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_appid` (`appid`),
  KEY `fk_building_permit_fee_itemid` (`itemid`),
  CONSTRAINT `fk_occupancy_permit_fee_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`),
  CONSTRAINT `fk_occupancy_permit_fee_itemid` FOREIGN KEY (`itemid`) REFERENCES `obo_itemaccount` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_finding
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_finding`;
CREATE TABLE `occupancy_permit_finding` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `rootid` varchar(50) DEFAULT NULL,
  `particulars` mediumtext,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(255) DEFAULT NULL,
  `state` int(50) DEFAULT NULL,
  `supersederid` varchar(50) DEFAULT NULL,
  `transmittalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_building_permit_finding_appid` (`appid`),
  KEY `fk_building_permit_finding_parentid` (`parentid`),
  KEY `fk_building_permit_finding_supersederid` (`supersederid`),
  CONSTRAINT `fk_occupancy_permit_finding_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`),
  CONSTRAINT `fk_occupancy_permit_finding_parentid` FOREIGN KEY (`parentid`) REFERENCES `occupancy_permit_section` (`objid`),
  CONSTRAINT `fk_occupancy_permit_finding_supersederid` FOREIGN KEY (`supersederid`) REFERENCES `occupancy_permit_finding` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_payment
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_payment`;
CREATE TABLE `occupancy_permit_payment` (
  `objid` varchar(50) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `refno` varchar(50) DEFAULT NULL,
  `refdate` date DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `reftype` varchar(50) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `voided` smallint(1) DEFAULT NULL,
  KEY `fk_building_permit_payment_appid` (`appid`),
  CONSTRAINT `fk_occupancy_permit_payment_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_professional
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_professional`;
CREATE TABLE `occupancy_permit_professional` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `appid` varchar(50) DEFAULT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `ptr` mediumtext,
  `prc` mediumtext,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fx_building_application_entity_appid_role` (`appid`) USING BTREE,
  KEY `online_building_permit_professional_entityid` (`entityid`) USING BTREE,
  CONSTRAINT `fk_occupancy_permit_professional_entityid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`),
  CONSTRAINT `occupancy_permit_professional_ibfk_2` FOREIGN KEY (`entityid`) REFERENCES `occupancy_permit_entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_requirement
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_requirement`;
CREATE TABLE `occupancy_permit_requirement` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `parentid` varchar(50) DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `state` int(10) DEFAULT NULL,
  `remarks` mediumtext,
  `reviewer_objid` varchar(50) DEFAULT NULL,
  `reviewer_name` varchar(255) DEFAULT NULL,
  `dtreviewed` datetime DEFAULT NULL,
  `supersederid` varchar(50) DEFAULT NULL,
  `transmittalid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`) USING BTREE,
  KEY `fk_req_appid` (`appid`) USING BTREE,
  KEY `fk_req_typeid` (`typeid`) USING BTREE,
  KEY `fk_building_permit_requirement_parentid` (`parentid`) USING BTREE,
  KEY `fk_building_permit_requirement_supersederid` (`supersederid`),
  KEY `fk_occupancy_permit_requirement_transmittalid` (`transmittalid`),
  CONSTRAINT `fk_occupancy_permit_requirement_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`),
  CONSTRAINT `fk_occupancy_permit_requirement_supersederid` FOREIGN KEY (`supersederid`) REFERENCES `occupancy_permit_requirement` (`objid`),
  CONSTRAINT `fk_occupancy_permit_requirement_transmittalid` FOREIGN KEY (`transmittalid`) REFERENCES `occupancy_permit_transmittal` (`objid`),
  CONSTRAINT `fk_occupancy_permit_requirement_typeid` FOREIGN KEY (`typeid`) REFERENCES `obo_requirement_type` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_rpu
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_rpu`;
CREATE TABLE `occupancy_permit_rpu` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `faasid` varchar(50) DEFAULT NULL,
  `tdno` varchar(50) DEFAULT NULL,
  `rputype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_section
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_section`;
CREATE TABLE `occupancy_permit_section` (
  `objid` varchar(50) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `taskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`),
  KEY `fk_building_permit_evaluation_appid` (`appid`),
  KEY `fk_building_permit_evaluation_typeid` (`typeid`),
  KEY `fk_building_permit_evaluation_taskid` (`taskid`),
  CONSTRAINT `occupancy_permit_evaluation_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`),
  CONSTRAINT `occupancy_permit_evaluation_taskid` FOREIGN KEY (`taskid`) REFERENCES `occupancy_permit_section_task` (`taskid`),
  CONSTRAINT `occupancy_permit_evaluation_typeid` FOREIGN KEY (`typeid`) REFERENCES `obo_section` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_section_task
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_section_task`;
CREATE TABLE `occupancy_permit_section_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_prevtaskid` (`prevtaskid`),
  CONSTRAINT `occupancy_permit_evaluation_task_refid` FOREIGN KEY (`refid`) REFERENCES `occupancy_permit_section` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_task
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_task`;
CREATE TABLE `occupancy_permit_task` (
  `taskid` varchar(50) NOT NULL,
  `refid` varchar(50) DEFAULT NULL,
  `parentprocessid` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `assignee_objid` varchar(50) DEFAULT NULL,
  `assignee_name` varchar(100) DEFAULT NULL,
  `actor_objid` varchar(50) DEFAULT NULL,
  `actor_name` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `prevtaskid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`taskid`),
  KEY `FK_obo_subproc_task_refid` (`refid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_prevtaskid` (`prevtaskid`),
  CONSTRAINT `occupancy_permit_task_ibfk_1` FOREIGN KEY (`refid`) REFERENCES `occupancy_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for occupancy_permit_transmittal
-- ----------------------------
DROP TABLE IF EXISTS `occupancy_permit_transmittal`;
CREATE TABLE `occupancy_permit_transmittal` (
  `objid` varchar(50) CHARACTER SET utf8 NOT NULL,
  `appid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `taskid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `dtcreated` datetime DEFAULT NULL,
  `createdby_objid` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `createdby_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  UNIQUE KEY `uix_building_permit_transmittal_taskid` (`taskid`) USING BTREE,
  KEY `fk_building_permit_transmittal_appid` (`appid`),
  KEY `objid` (`objid`),
  CONSTRAINT `fk_occupancy_permit_transmittal_appid` FOREIGN KEY (`appid`) REFERENCES `occupancy_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- View structure for vw_occupancy_permit
-- ----------------------------
DROP VIEW IF EXISTS `vw_occupancy_permit`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_occupancy_permit` AS select `op`.`objid` AS `objid`,`op`.`appno` AS `appno`,`op`.`apptype` AS `apptype`,`op`.`orgcode` AS `orgcode`,`op`.`trackingno` AS `trackingno`,`op`.`permitno` AS `permitno`,`op`.`dtissued` AS `dtissued`,`op`.`contact_name` AS `contact_name`,`op`.`contact_detail` AS `contact_detail`,`op`.`contact_email` AS `contact_email`,`op`.`contact_mobileno` AS `contact_mobileno`,`op`.`dtfiled` AS `dtfiled`,`op`.`taskid` AS `taskid`,`op`.`bldgpermitid` AS `bldgpermitid`,`op`.`applicantid` AS `applicantid`,`op`.`txnmode` AS `txnmode`,`op`.`totalmaterialcost` AS `totalmaterialcost`,`op`.`totaldirectlaborcost` AS `totaldirectlaborcost`,`op`.`totalequipmentcost` AS `totalequipmentcost`,`op`.`totalothercost` AS `totalothercost`,`op`.`occupancytypeid` AS `occupancytypeid`,`op`.`actualnumunits` AS `actualnumunits`,`op`.`fixedcost` AS `fixedcost`,`op`.`actualtotalfloorarea` AS `actualtotalfloorarea`,`op`.`actualheight` AS `actualheight`,`op`.`actualnumfloors` AS `actualnumfloors`,`op`.`dtactualstarted` AS `dtactualstarted`,`op`.`dtactualcompleted` AS `dtactualcompleted`,`op`.`inspectionschedule` AS `inspectionschedule`,`op`.`profarchitectid` AS `profarchitectid`,`op`.`profcivilid` AS `profcivilid`,`op`.`profelectricalid` AS `profelectricalid`,`op`.`profmechanicalid` AS `profmechanicalid`,`op`.`profsanitaryid` AS `profsanitaryid`,`op`.`profplumbingid` AS `profplumbingid`,`op`.`profelectronicid` AS `profelectronicid`,`op`.`profinteriorid` AS `profinteriorid`,`op`.`supervisorelectricalid` AS `supervisorelectricalid`,`op`.`supervisormechanicalid` AS `supervisormechanicalid`,`op`.`supervisorsanitaryid` AS `supervisorsanitaryid`,`op`.`supervisorplumbingid` AS `supervisorplumbingid`,`op`.`supervisorelectronicid` AS `supervisorelectronicid`,`op`.`supervisorinteriorid` AS `supervisorinteriorid`,`op`.`supervisorid` AS `supervisorid`,`op`.`contractorid` AS `contractorid`,`op`.`firealarmcost` AS `firealarmcost`,`op`.`sprinklercost` AS `sprinklercost`,`op`.`lpgpipingcost` AS `lpgpipingcost`,`op`.`firesuppcost` AS `firesuppcost`,`bp`.`title` AS `title`,`bp`.`location_barangay_name` AS `location_text`,`t`.`state` AS `task_state`,`t`.`startdate` AS `task_startdate`,`t`.`enddate` AS `task_enddate`,`t`.`assignee_objid` AS `task_assignee_objid`,`t`.`assignee_name` AS `task_assignee_name`,`t`.`actor_objid` AS `task_actor_objid`,`t`.`actor_name` AS `task_actor_name`,(select `sys_wf_node`.`title` from `sys_wf_node` where ((`sys_wf_node`.`processname` = 'occupancy_permit') and (`sys_wf_node`.`name` = `t`.`state`))) AS `task_title`,(((`op`.`totalmaterialcost` + `op`.`totaldirectlaborcost`) + `op`.`totalequipmentcost`) + `op`.`totalothercost`) AS `totalprojectcost` from ((`occupancy_permit` `op` join `occupancy_permit_task` `t` on((`op`.`taskid` = `t`.`taskid`))) join `building_permit` `bp` on((`op`.`bldgpermitid` = `bp`.`objid`)));

SET FOREIGN_KEY_CHECKS = 1;
