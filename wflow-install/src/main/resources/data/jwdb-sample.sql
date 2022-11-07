
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivities` (
  `Id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivitySetDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Process` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) DEFAULT NULL,
  `PDefName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessId` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `BlockActivityId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Performer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsPerformerAsynchronous` smallint(6) DEFAULT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Activated` bigint(20) NOT NULL,
  `ActivatedTZO` bigint(20) NOT NULL,
  `Accepted` bigint(20) DEFAULT NULL,
  `AcceptedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivities` (`Id`),
  KEY `SHKActivities_TheResource` (`TheResource`),
  KEY `SHKActivities_State` (`State`),
  KEY `I2_SHKActivities` (`Process`,`ActivitySetDefinitionId`,`ActivityDefinitionId`),
  KEY `I3_SHKActivities` (`Process`,`State`),
  CONSTRAINT `SHKActivities_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`),
  CONSTRAINT `SHKActivities_State` FOREIGN KEY (`State`) REFERENCES `SHKActivityStates` (`oid`),
  CONSTRAINT `SHKActivities_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivities` WRITE;
/*!40000 ALTER TABLE `SHKActivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityData` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityData` (`CNT`),
  UNIQUE KEY `I2_SHKActivityData` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityData_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivityData` WRITE;
/*!40000 ALTER TABLE `SHKActivityData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataBLOBs` (
  `ActivityDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataBLOBs` (`ActivityDataWOB`,`OrdNo`),
  CONSTRAINT `SHKActivityDataBLOBs_ActivityDataWOB` FOREIGN KEY (`ActivityDataWOB`) REFERENCES `SHKActivityDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivityDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityDataWOB` (
  `Activity` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `IsResult` smallint(6) NOT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKActivityDataWOB` (`Activity`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKActivityDataWOB_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivityDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKActivityDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityDataWOB` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStateEventAudits` (
  `KeyValue` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivityStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKActivityStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKActivityStates` (
  `KeyValue` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKActivityStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKActivityStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKActivityStates` WRITE;
/*!40000 ALTER TABLE `SHKActivityStates` DISABLE KEYS */;
INSERT INTO `SHKActivityStates` VALUES
('open.running','open.running',1000001,0),
('open.not_running.not_started','open.not_running.not_started',1000003,0),
('open.not_running.suspended','open.not_running.suspended',1000005,0),
('closed.completed','closed.completed',1000007,0),
('closed.terminated','closed.terminated',1000009,0),
('closed.aborted','closed.aborted',1000011,0);
/*!40000 ALTER TABLE `SHKActivityStates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAndJoinTable` (
  `Process` decimal(19,0) NOT NULL,
  `BlockActivity` decimal(19,0) DEFAULT NULL,
  `ActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAndJoinTable` (`CNT`),
  KEY `SHKAndJoinTable_BlockActivity` (`BlockActivity`),
  KEY `I2_SHKAndJoinTable` (`Process`,`BlockActivity`,`ActivityDefinitionId`),
  KEY `I3_SHKAndJoinTable` (`Activity`),
  CONSTRAINT `SHKAndJoinTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_BlockActivity` FOREIGN KEY (`BlockActivity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAndJoinTable_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKAndJoinTable` WRITE;
/*!40000 ALTER TABLE `SHKAndJoinTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAndJoinTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int(11) NOT NULL,
  `ProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OldResourceUsername` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OldResourceName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NewResourceUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NewResourceName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentEventAudits` (`CNT`),
  KEY `SHKAssignmentEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKAssignmentEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKAssignmentEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKAssignmentsTable` (
  `Activity` decimal(19,0) NOT NULL,
  `TheResource` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityProcessId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityProcessDefName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ResourceId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsAccepted` smallint(6) NOT NULL,
  `IsValid` smallint(6) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKAssignmentsTable` (`CNT`),
  UNIQUE KEY `I2_SHKAssignmentsTable` (`Activity`,`TheResource`),
  KEY `I3_SHKAssignmentsTable` (`TheResource`,`IsValid`),
  KEY `I4_SHKAssignmentsTable` (`ActivityId`),
  KEY `I5_SHKAssignmentsTable` (`ResourceId`),
  KEY `FK_rnb6mhntls567xpifcfvygkuu` (`ActivityProcessId`),
  CONSTRAINT `FK_183e6adufsi558hl5p4dqkqsx` FOREIGN KEY (`ActivityId`) REFERENCES `SHKActivities` (`Id`),
  CONSTRAINT `FK_rnb6mhntls567xpifcfvygkuu` FOREIGN KEY (`ActivityProcessId`) REFERENCES `SHKProcesses` (`Id`),
  CONSTRAINT `SHKAssignmentsTable_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKAssignmentsTable_TheResource` FOREIGN KEY (`TheResource`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKAssignmentsTable` WRITE;
/*!40000 ALTER TABLE `SHKAssignmentsTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKAssignmentsTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCounters` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `the_number` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCounters` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKCounters` WRITE;
/*!40000 ALTER TABLE `SHKCounters` DISABLE KEYS */;
INSERT INTO `SHKCounters` VALUES
('_xpdldata_',101,1000204,0);
/*!40000 ALTER TABLE `SHKCounters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKCreateProcessEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ProcessId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PActivityId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessFactoryName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessFactoryVersion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PActivityDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PProcessDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PPackageId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKCreateProcessEventAudits` (`CNT`),
  KEY `SHKCreateProcessEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKCreateProcessEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKCreateProcessEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKCreateProcessEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDataEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDataEventAudits` (`CNT`),
  KEY `SHKDataEventAudits_TheType` (`TheType`),
  CONSTRAINT `SHKDataEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKDataEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKDataEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDataEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKDeadlines` (
  `Process` decimal(19,0) NOT NULL,
  `Activity` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `TimeLimit` bigint(20) NOT NULL,
  `TimeLimitTZO` bigint(20) NOT NULL,
  `ExceptionName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsSynchronous` smallint(6) NOT NULL,
  `IsExecuted` smallint(6) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKDeadlines` (`CNT`),
  KEY `I2_SHKDeadlines` (`Process`,`TimeLimit`),
  KEY `I3_SHKDeadlines` (`Activity`,`TimeLimit`),
  CONSTRAINT `SHKDeadlines_Activity` FOREIGN KEY (`Activity`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKDeadlines_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKDeadlines` WRITE;
/*!40000 ALTER TABLE `SHKDeadlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKDeadlines` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKEventTypes` (
  `KeyValue` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKEventTypes` (`KeyValue`),
  UNIQUE KEY `I2_SHKEventTypes` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKEventTypes` WRITE;
/*!40000 ALTER TABLE `SHKEventTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKEventTypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupGroupTable` (
  `sub_gid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupGroupTable` (`sub_gid`,`groupid`),
  KEY `I2_SHKGroupGroupTable` (`groupid`),
  CONSTRAINT `SHKGroupGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKGroupGroupTable_sub_gid` FOREIGN KEY (`sub_gid`) REFERENCES `SHKGroupTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKGroupGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupGroupTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupTable` (
  `groupid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupTable` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUser` (
  `USERNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKGroupUser` WRITE;
/*!40000 ALTER TABLE `SHKGroupUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKGroupUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKGroupUserProcLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKGroupUserProcLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKGroupUserProcLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKGroupUserProcLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKGroupUserProcLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKGroupUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKGroupUserProcLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKGroupUserProcLevelPart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKNewEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataBLOBs` (
  `NewEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataBLOBs` (`NewEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataBLOBs_NewEventAuditDataWOB` FOREIGN KEY (`NewEventAuditDataWOB`) REFERENCES `SHKNewEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKNewEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNewEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNewEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKNewEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKNewEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKNewEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNewEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNextXPDLVersions` (
  `XPDLId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNextXPDLVersions` (`XPDLId`,`NextVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKNextXPDLVersions` WRITE;
/*!40000 ALTER TABLE `SHKNextXPDLVersions` DISABLE KEYS */;
INSERT INTO `SHKNextXPDLVersions` VALUES
('crm_community','2',1000201,0);
/*!40000 ALTER TABLE `SHKNextXPDLVersions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKNormalUser` (
  `USERNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKNormalUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKNormalUser` WRITE;
/*!40000 ALTER TABLE `SHKNormalUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKNormalUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditData` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditData` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditData` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditData_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKOldEventAuditData` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataBLOBs` (
  `OldEventAuditDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataBLOBs` (`OldEventAuditDataWOB`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataBLOBs_OldEventAuditDataWOB` FOREIGN KEY (`OldEventAuditDataWOB`) REFERENCES `SHKOldEventAuditDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKOldEventAuditDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKOldEventAuditDataWOB` (
  `DataEventAudit` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` float DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKOldEventAuditDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKOldEventAuditDataWOB` (`DataEventAudit`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKOldEventAuditDataWOB_DataEventAudit` FOREIGN KEY (`DataEventAudit`) REFERENCES `SHKDataEventAudits` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKOldEventAuditDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKOldEventAuditDataWOB` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelParticipant` (`PARTICIPANT_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelParticipant_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelParticipant_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLApp` (`APPLICATION_ID`,`PACKAGEOID`),
  KEY `SHKPackLevelXPDLApp_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKPackLevelXPDLApp_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKPackLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKPackLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKPackLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKPackLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKPackLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKPackLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelParticipant` (
  `PARTICIPANT_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelParticipant` (`PARTICIPANT_ID`,`PROCESSOID`),
  KEY `SHKProcLevelParticipant_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelParticipant_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLParticipantProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLApp` (
  `APPLICATION_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROCESSOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLApp` (`APPLICATION_ID`,`PROCESSOID`),
  KEY `SHKProcLevelXPDLApp_PROCESSOID` (`PROCESSOID`),
  CONSTRAINT `SHKProcLevelXPDLApp_PROCESSOID` FOREIGN KEY (`PROCESSOID`) REFERENCES `SHKXPDLApplicationProcess` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelXPDLApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLApp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetUsr` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetUsr` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetailUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetUsr_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetUsr` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetUsr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppDetail` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppDetail` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppDetail_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelXPDLAppTAAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppDetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppTAAppUser` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppTAAppUser` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentAppUser` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppTAAppUser_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelXPDLAppTAAppUser` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppTAAppUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcLevelXPDLAppToolAgntApp` (
  `XPDL_APPOID` decimal(19,0) NOT NULL,
  `TOOLAGENTOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcLevelXPDLAppToolAgntApp` (`XPDL_APPOID`,`TOOLAGENTOID`),
  KEY `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` (`TOOLAGENTOID`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_TOOLAGENTOID` FOREIGN KEY (`TOOLAGENTOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKProcLevelXPDLAppToolAgntApp_XPDL_APPOID` FOREIGN KEY (`XPDL_APPOID`) REFERENCES `SHKProcLevelXPDLApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcLevelXPDLAppToolAgntApp` WRITE;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcLevelXPDLAppToolAgntApp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessData` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessData` (`CNT`),
  UNIQUE KEY `I2_SHKProcessData` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessData_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessData` WRITE;
/*!40000 ALTER TABLE `SHKProcessData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataBLOBs` (
  `ProcessDataWOB` decimal(19,0) NOT NULL,
  `VariableValue` mediumblob DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataBLOBs` (`ProcessDataWOB`,`OrdNo`),
  CONSTRAINT `SHKProcessDataBLOBs_ProcessDataWOB` FOREIGN KEY (`ProcessDataWOB`) REFERENCES `SHKProcessDataWOB` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessDataBLOBs` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataBLOBs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDataWOB` (
  `Process` decimal(19,0) NOT NULL,
  `VariableDefinitionId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VariableType` int(11) NOT NULL,
  `VariableValueXML` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueVCHAR` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VariableValueDBL` double DEFAULT NULL,
  `VariableValueLONG` bigint(20) DEFAULT NULL,
  `VariableValueDATE` datetime DEFAULT NULL,
  `VariableValueBOOL` smallint(6) DEFAULT NULL,
  `OrdNo` int(11) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDataWOB` (`CNT`),
  UNIQUE KEY `I2_SHKProcessDataWOB` (`Process`,`VariableDefinitionId`,`OrdNo`),
  CONSTRAINT `SHKProcessDataWOB_Process` FOREIGN KEY (`Process`) REFERENCES `SHKProcesses` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessDataWOB` WRITE;
/*!40000 ALTER TABLE `SHKProcessDataWOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessDataWOB` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessDefinitions` (
  `Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PackageId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionCreated` bigint(20) NOT NULL,
  `ProcessDefinitionVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessDefinitions` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessDefinitions` WRITE;
/*!40000 ALTER TABLE `SHKProcessDefinitions` DISABLE KEYS */;
INSERT INTO `SHKProcessDefinitions` VALUES
('crm_community#1#process1','crm_community','process1',1667793196620,'1',0,1000205,0);
/*!40000 ALTER TABLE `SHKProcessDefinitions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessRequesters` (
  `Id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityRequester` decimal(19,0) DEFAULT NULL,
  `ResourceRequester` decimal(19,0) DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessRequesters` (`Id`),
  KEY `I2_SHKProcessRequesters` (`ActivityRequester`),
  KEY `I3_SHKProcessRequesters` (`ResourceRequester`),
  CONSTRAINT `SHKProcessRequesters_ActivityRequester` FOREIGN KEY (`ActivityRequester`) REFERENCES `SHKActivities` (`oid`),
  CONSTRAINT `SHKProcessRequesters_ResourceRequester` FOREIGN KEY (`ResourceRequester`) REFERENCES `SHKResourcesTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessRequesters` WRITE;
/*!40000 ALTER TABLE `SHKProcessRequesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessRequesters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStateEventAudits` (
  `KeyValue` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStateEventAudits` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStateEventAudits` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcessStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcessStates` (
  `KeyValue` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcessStates` (`KeyValue`),
  UNIQUE KEY `I2_SHKProcessStates` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcessStates` WRITE;
/*!40000 ALTER TABLE `SHKProcessStates` DISABLE KEYS */;
INSERT INTO `SHKProcessStates` VALUES
('open.running','open.running',1000000,0),
('open.not_running.not_started','open.not_running.not_started',1000002,0),
('open.not_running.suspended','open.not_running.suspended',1000004,0),
('closed.completed','closed.completed',1000006,0),
('closed.terminated','closed.terminated',1000008,0),
('closed.aborted','closed.aborted',1000010,0);
/*!40000 ALTER TABLE `SHKProcessStates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKProcesses` (
  `SyncVersion` bigint(20) NOT NULL,
  `Id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinition` decimal(19,0) NOT NULL,
  `PDefName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityRequesterId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityRequesterProcessId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ResourceRequesterId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ExternalRequesterClassName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` decimal(19,0) NOT NULL,
  `Priority` int(11) DEFAULT NULL,
  `Name` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Created` bigint(20) NOT NULL,
  `CreatedTZO` bigint(20) NOT NULL,
  `Started` bigint(20) DEFAULT NULL,
  `StartedTZO` bigint(20) DEFAULT NULL,
  `LastStateTime` bigint(20) NOT NULL,
  `LastStateTimeTZO` bigint(20) NOT NULL,
  `LimitTime` bigint(20) NOT NULL,
  `LimitTimeTZO` bigint(20) NOT NULL,
  `Description` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKProcesses` (`Id`),
  KEY `I2_SHKProcesses` (`ProcessDefinition`),
  KEY `I3_SHKProcesses` (`State`),
  KEY `I4_SHKProcesses` (`ActivityRequesterId`),
  KEY `I5_SHKProcesses` (`ResourceRequesterId`),
  CONSTRAINT `SHKProcesses_ProcessDefinition` FOREIGN KEY (`ProcessDefinition`) REFERENCES `SHKProcessDefinitions` (`oid`),
  CONSTRAINT `SHKProcesses_State` FOREIGN KEY (`State`) REFERENCES `SHKProcessStates` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKProcesses` WRITE;
/*!40000 ALTER TABLE `SHKProcesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKProcesses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKResourcesTable` (
  `Username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKResourcesTable` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKResourcesTable` WRITE;
/*!40000 ALTER TABLE `SHKResourcesTable` DISABLE KEYS */;
INSERT INTO `SHKResourcesTable` VALUES
('roleAnonymous',NULL,1000200,0);
/*!40000 ALTER TABLE `SHKResourcesTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKStateEventAudits` (
  `RecordedTime` bigint(20) NOT NULL,
  `RecordedTimeTZO` bigint(20) NOT NULL,
  `TheUsername` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TheType` decimal(19,0) NOT NULL,
  `ActivityId` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessId` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessName` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ProcessFactoryName` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessFactoryVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivityDefinitionType` int(11) DEFAULT NULL,
  `ProcessDefinitionId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProcessDefinitionName` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PackageId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OldProcessState` decimal(19,0) DEFAULT NULL,
  `NewProcessState` decimal(19,0) DEFAULT NULL,
  `OldActivityState` decimal(19,0) DEFAULT NULL,
  `NewActivityState` decimal(19,0) DEFAULT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKStateEventAudits` (`CNT`),
  KEY `SHKStateEventAudits_TheType` (`TheType`),
  KEY `SHKStateEventAudits_OldProcessState` (`OldProcessState`),
  KEY `SHKStateEventAudits_NewProcessState` (`NewProcessState`),
  KEY `SHKStateEventAudits_OldActivityState` (`OldActivityState`),
  KEY `SHKStateEventAudits_NewActivityState` (`NewActivityState`),
  CONSTRAINT `SHKStateEventAudits_NewActivityState` FOREIGN KEY (`NewActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_NewProcessState` FOREIGN KEY (`NewProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldActivityState` FOREIGN KEY (`OldActivityState`) REFERENCES `SHKActivityStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_OldProcessState` FOREIGN KEY (`OldProcessState`) REFERENCES `SHKProcessStateEventAudits` (`oid`),
  CONSTRAINT `SHKStateEventAudits_TheType` FOREIGN KEY (`TheType`) REFERENCES `SHKEventTypes` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKStateEventAudits` WRITE;
/*!40000 ALTER TABLE `SHKStateEventAudits` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKStateEventAudits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentApp` (
  `TOOL_AGENT_NAME` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `APP_NAME` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentApp` (`TOOL_AGENT_NAME`,`APP_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKToolAgentApp` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentApp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetail` (
  `APP_MODE` decimal(10,0) NOT NULL,
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetail` (`APP_MODE`,`TOOLAGENT_APPOID`),
  KEY `SHKToolAgentAppDetail_TOOLAGENT_APPOID` (`TOOLAGENT_APPOID`),
  CONSTRAINT `SHKToolAgentAppDetail_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKToolAgentAppDetail` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppDetailUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppDetailUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppDetailUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppDetailUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentAppDetail` (`oid`),
  CONSTRAINT `SHKToolAgentAppDetailUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKToolAgentAppDetailUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppDetailUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentAppUser` (
  `TOOLAGENT_APPOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentAppUser` (`TOOLAGENT_APPOID`,`USEROID`),
  KEY `SHKToolAgentAppUser_USEROID` (`USEROID`),
  CONSTRAINT `SHKToolAgentAppUser_TOOLAGENT_APPOID` FOREIGN KEY (`TOOLAGENT_APPOID`) REFERENCES `SHKToolAgentApp` (`oid`),
  CONSTRAINT `SHKToolAgentAppUser_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKToolAgentUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKToolAgentAppUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentAppUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKToolAgentUser` (
  `USERNAME` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PWD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKToolAgentUser` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKToolAgentUser` WRITE;
/*!40000 ALTER TABLE `SHKToolAgentUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKToolAgentUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserGroupTable` (
  `userid` decimal(19,0) NOT NULL,
  `groupid` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserGroupTable` (`userid`,`groupid`),
  KEY `SHKUserGroupTable_groupid` (`groupid`),
  CONSTRAINT `SHKUserGroupTable_groupid` FOREIGN KEY (`groupid`) REFERENCES `SHKGroupTable` (`oid`),
  CONSTRAINT `SHKUserGroupTable_userid` FOREIGN KEY (`userid`) REFERENCES `SHKUserTable` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKUserGroupTable` WRITE;
/*!40000 ALTER TABLE `SHKUserGroupTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserGroupTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserPackLevelPart` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserPackLevelPart` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserPackLevelPart_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserPackLevelPart_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKPackLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserPackLevelPart_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKUserPackLevelPart` WRITE;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserPackLevelPart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserProcLevelParticipant` (
  `PARTICIPANTOID` decimal(19,0) NOT NULL,
  `USEROID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserProcLevelParticipant` (`PARTICIPANTOID`,`USEROID`),
  KEY `SHKUserProcLevelParticipant_USEROID` (`USEROID`),
  CONSTRAINT `SHKUserProcLevelParticipant_PARTICIPANTOID` FOREIGN KEY (`PARTICIPANTOID`) REFERENCES `SHKProcLevelParticipant` (`oid`),
  CONSTRAINT `SHKUserProcLevelParticipant_USEROID` FOREIGN KEY (`USEROID`) REFERENCES `SHKNormalUser` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKUserProcLevelParticipant` WRITE;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserProcLevelParticipant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKUserTable` (
  `userid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKUserTable` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKUserTable` WRITE;
/*!40000 ALTER TABLE `SHKUserTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKUserTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationPackage` (
  `PACKAGE_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLApplicationPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationPackage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLApplicationProcess` (
  `PROCESS_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLApplicationProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLApplicationProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLApplicationProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLApplicationPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLApplicationProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLApplicationProcess` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLData` (
  `XPDLContent` longblob DEFAULT NULL,
  `XPDLClassContent` longblob DEFAULT NULL,
  `XPDL` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLData` (`CNT`),
  UNIQUE KEY `I2_SHKXPDLData` (`XPDL`),
  CONSTRAINT `SHKXPDLData_XPDL` FOREIGN KEY (`XPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLData` DISABLE KEYS */;
INSERT INTO `SHKXPDLData` VALUES
('<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<Package xmlns=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xpdl=\"http://www.wfmc.org/2002/XPDL1.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" Id=\"crm_community\" Name=\"CRM Community\" xsi:schemaLocation=\"http://www.wfmc.org/2002/XPDL1.0 http://wfmc.org/standards/docs/TC-1025_schema_10_xpdl.xsd\">\n    <PackageHeader>\n        <XPDLVersion>1.0</XPDLVersion>\n        <Vendor/>\n        <Created/>\n    </PackageHeader>\n    <Script Type=\"text/javascript\"/>\n    <Participants>\n        <Participant Id=\"requester\" Name=\"Requester\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n        <Participant Id=\"approver\" Name=\"Approver\">\n            <ParticipantType Type=\"ROLE\"/>\n        </Participant>\n    </Participants>\n    <Applications>\n        <Application Id=\"default_application\"/>\n    </Applications>\n    <WorkflowProcesses>\n        <WorkflowProcess Id=\"process1\" Name=\"Proposal Approval Process\">\n            <ProcessHeader DurationUnit=\"h\"/>\n            <DataFields>\n                <DataField Id=\"status\" IsArray=\"FALSE\">\n                    <DataType>\n                        <BasicType Type=\"STRING\"/>\n                    </DataType>\n                </DataField>\n            </DataFields>\n            <Activities>\n                <Activity Id=\"approve_proposal\" Name=\"Approve Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Join Type=\"XOR\"/>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"205.0000228881836,56.76666259765625\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"approval\" Name=\"Approval\">\n                    <Route/>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"XOR\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition3\"/>\n                                    <TransitionRef Id=\"transition6\"/>\n                                    <TransitionRef Id=\"transition5\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"430,62.79999084472655\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"activity1\" Name=\"Resubmit Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"397,20.787493896484378\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"send_proposal\" Name=\"Send Proposal\">\n                    <Implementation>\n                        <No/>\n                    </Implementation>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"681.0000381469727,99.78333282470703\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"parallel\" Name=\"Parallel\">\n                    <Route/>\n                    <Performer>approver</Performer>\n                    <TransitionRestrictions>\n                        <TransitionRestriction>\n                            <Split Type=\"AND\">\n                                <TransitionRefs>\n                                    <TransitionRef Id=\"transition7\"/>\n                                    <TransitionRef Id=\"transition8\"/>\n                                </TransitionRefs>\n                            </Split>\n                        </TransitionRestriction>\n                    </TransitionRestrictions>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"588,61.599993896484364\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool1\" Name=\"Send Approval Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"735,63.974993896484364\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"tool2\" Name=\"Send Reject Notification\">\n                    <Implementation>\n                        <Tool Id=\"default_application\"/>\n                    </Implementation>\n                    <Performer>approver</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"approver\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"394,168.39999694824218\"/>\n                    </ExtendedAttributes>\n                </Activity>\n                <Activity Id=\"route1\" Name=\"Route 1\">\n                    <Route/>\n                    <Performer>requester</Performer>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_PARTICIPANT_ID\" Value=\"requester\"/>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_OFFSET\" Value=\"228.0000228881836,22\"/>\n                    </ExtendedAttributes>\n                </Activity>\n            </Activities>\n            <Transitions>\n                <Transition From=\"approve_proposal\" Id=\"transition2\" To=\"approval\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition3\" To=\"activity1\">\n                    <Condition Type=\"CONDITION\">status===\'resubmit\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"activity1\" Id=\"transition4\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition6\" Name=\"approved\" To=\"parallel\">\n                    <Condition Type=\"OTHERWISE\"/>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition7\" To=\"send_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"parallel\" Id=\"transition8\" To=\"tool1\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"approval\" Id=\"transition5\" To=\"tool2\">\n                    <Condition Type=\"CONDITION\">status===\'rejected\'</Condition>\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n                <Transition From=\"route1\" Id=\"transition1\" To=\"approve_proposal\">\n                    <ExtendedAttributes>\n                        <ExtendedAttribute Name=\"JaWE_GRAPH_TRANSITION_STYLE\" Value=\"NO_ROUTING_ORTHOGONAL\"/>\n                    </ExtendedAttributes>\n                </Transition>\n            </Transitions>\n            <ExtendedAttributes>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDER\" Value=\"requester;approver\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_START_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=901,Y_OFFSET=74,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=849,Y_OFFSET=110,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n                <ExtendedAttribute Name=\"JaWE_GRAPH_END_OF_WORKFLOW\" Value=\"JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=579,Y_OFFSET=180,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULT\"/>\n            </ExtendedAttributes>\n        </WorkflowProcess>\n    </WorkflowProcesses>\n    <ExtendedAttributes>\n        <ExtendedAttribute Name=\"EDITING_TOOL\" Value=\"Web Workflow Designer\"/>\n        <ExtendedAttribute Name=\"EDITING_TOOL_VERSION\" Value=\"5.0-pre-alpha\"/>\n    </ExtendedAttributes>\n</Package>\n','��\0sr\0\'org.enhydra.shark.xpdl.elements.Package~+Vmŀ~�\0Z\0isTransientL\0extPkgRefsToIdst\0.Lorg/enhydra/shark/utilities/SequencedHashMap;L\0internalVersiont\0Ljava/lang/String;L\0\nnamespacest\0,Lorg/enhydra/shark/xpdl/elements/Namespaces;xr\0(org.enhydra.shark.xpdl.XMLComplexElement>����(��\0\0xr\05org.enhydra.shark.xpdl.XMLBaseForCollectionAndComplex������2\0L\0\nelementMapq\0~\0L\0elementst\0Ljava/util/ArrayList;xr\0!org.enhydra.shark.xpdl.XMLElement#+B�#���\0Z\0\nisReadOnlyZ\0\nisRequiredL\0nameq\0~\0L\0originalElementHashCodet\0Ljava/lang/Integer;L\0parentt\0#Lorg/enhydra/shark/xpdl/XMLElement;L\0valueq\0~\0xpt\0Packagesr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp�zxpt\0\0sr\0,org.enhydra.shark.utilities.SequencedHashMap.�\"��\"&\0\0xpw\0\0\0\rt\0Idsr\0#org.enhydra.shark.xpdl.XMLAttribute#c݀��M;\0L\0choicesq\0~\0xq\0~\0q\0~\0sq\0~\0(Of4q\0~\0\nt\0\rcrm_communitypt\0Namesq\0~\0\0q\0~\0sq\0~\0\Zq��q\0~\0\nt\0\rCRM Communitypt\0\rPackageHeadersr\0-org.enhydra.shark.xpdl.elements.PackageHeaderv�,��\0\0xq\0~\0\0q\0~\0sq\0~\0o*�Tq\0~\0\nt\0\0sq\0~\0w\0\0\0t\0XPDLVersionsr\0+org.enhydra.shark.xpdl.elements.XPDLVersion�\"}�Y.�w\0\0xr\0\'org.enhydra.shark.xpdl.XMLSimpleElement�m����\0\0xq\0~\0q\0~\0!sq\0~\0SwQ�q\0~\0t\01.0t\0Vendorsr\0&org.enhydra.shark.xpdl.elements.Vendor t��E�:\0\0xq\0~\0#q\0~\0\'sq\0~\0M���q\0~\0t\0\0t\0Createdsr\0\'org.enhydra.shark.xpdl.elements.Createdz��dK�|[\0\0xq\0~\0#q\0~\0,sq\0~\0nhoq\0~\0t\0\0t\0Descriptionsr\0+org.enhydra.shark.xpdl.elements.Description۰73�8�\0\0xq\0~\0#\0q\0~\01sq\0~\0j�|�q\0~\0t\0\0t\0\rDocumentationsr\0-org.enhydra.shark.xpdl.elements.Documentation`�9��y�\0\0xq\0~\0#\0q\0~\06sq\0~\0T���q\0~\0t\0\0t\0PriorityUnitsr\0,org.enhydra.shark.xpdl.elements.PriorityUnit�������\0\0xq\0~\0#\0q\0~\0;sq\0~\016\\q\0~\0t\0\0t\0CostUnitsr\0(org.enhydra.shark.xpdl.elements.CostUnit܎�=H�\0\0xq\0~\0#\0q\0~\0@sq\0~\0RH\r�q\0~\0t\0\0xsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0w\0\0\0q\0~\0$q\0~\0)q\0~\0.q\0~\03q\0~\08q\0~\0=q\0~\0Bxt\0RedefinableHeadersr\01org.enhydra.shark.xpdl.elements.RedefinableHeader��M�Ϫ\'H\0\0xq\0~\0\0q\0~\0Gsq\0~\0m<q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0PublicationStatussq\0~\0\0q\0~\0Msq\0~\0%���q\0~\0It\0\0sq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0UNDER_REVISIONt\0RELEASEDt\0\nUNDER_TESTxt\0Authorsr\0&org.enhydra.shark.xpdl.elements.Author5��fᧆ\0\0xq\0~\0#\0q\0~\0Usq\0~\0�&q\0~\0It\0\0t\0Versionsr\0\'org.enhydra.shark.xpdl.elements.Version9=3�~�JQ\0\0xq\0~\0#\0q\0~\0Zsq\0~\0`/�q\0~\0It\0\0t\0Codepagesr\0(org.enhydra.shark.xpdl.elements.Codepage9$m�e�\rG\0\0xq\0~\0#\0q\0~\0_sq\0~\0u0�q\0~\0It\0\0t\0\nCountrykeysr\0*org.enhydra.shark.xpdl.elements.Countrykey��.����\0\0xq\0~\0#\0q\0~\0dsq\0~\0{=5�q\0~\0It\0\0t\0Responsiblessr\0,org.enhydra.shark.xpdl.elements.Responsibles$��{S�\0\0xr\0$org.enhydra.shark.xpdl.XMLCollection�jċm��\0\0xq\0~\0\0q\0~\0isq\0~\03ħ�q\0~\0It\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~\0Nq\0~\0Wq\0~\0\\q\0~\0aq\0~\0fq\0~\0lxt\0ConformanceClasssr\00org.enhydra.shark.xpdl.elements.ConformanceClass��y0|k��\0\0xq\0~\0\0q\0~\0rsq\0~\0WG�@q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0GraphConformancesq\0~\0\0q\0~\0xsq\0~\0:ܙq\0~\0tq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0FULL_BLOCKEDt\0LOOP_BLOCKEDt\0NON_BLOCKEDxxsq\0~\0E\0\0\0w\0\0\0q\0~\0yxt\0Scriptsr\0&org.enhydra.shark.xpdl.elements.ScriptQ�j�S�8\0\0xq\0~\0\0q\0~\0�sq\0~\0t�7�q\0~\0\nt\0\0sq\0~\0w\0\0\0t\0Typesq\0~\0q\0~\0�sq\0~\0̽q\0~\0�t\0text/javascriptpt\0Versionsq\0~\0\0q\0~\0�sq\0~\0b�7�q\0~\0�t\0\0pt\0Grammarsq\0~\0\0q\0~\0�sq\0~\0d6��q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�xt\0ExternalPackagessr\00org.enhydra.shark.xpdl.elements.ExternalPackagesw�\"+Ũ��\0\0xq\0~\0k\0q\0~\0�sq\0~\0�;\\q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0TypeDeclarationssr\00org.enhydra.shark.xpdl.elements.TypeDeclarations\r��Ox5�\0\0xq\0~\0k\0q\0~\0�sq\0~\0ei-q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Participantssr\0,org.enhydra.shark.xpdl.elements.Participantsh`��g8J\0\0xq\0~\0k\0q\0~\0�sq\0~\09�}�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0+org.enhydra.shark.xpdl.elements.Participanto$��rc��\0\0xr\0+org.enhydra.shark.xpdl.XMLCollectionElementC�x�v�r\0\0xq\0~\0t\0Participantsq\0~\0S��xq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0^JK�q\0~\0�t\0	requesterpq\0~\0sq\0~\0\0q\0~\0sq\0~\0G��Hq\0~\0�t\0	Requesterpt\0ParticipantTypesr\0/org.enhydra.shark.xpdl.elements.ParticipantType>�n�݅��\0\0xq\0~\0q\0~\0�sq\0~\0K:�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0��{q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0t\0RESOURCE_SETt\0RESOURCEt\0ROLEt\0ORGANIZATIONAL_UNITt\0HUMANt\0SYSTEMxxsq\0~\0E\0\0\0w\0\0\0q\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\09�q\0~\0�t\0\0t\0ExternalReferencesr\01org.enhydra.shark.xpdl.elements.ExternalReference�b��Q�\0\0xq\0~\0\0q\0~\0�sq\0~\0S�Zq\0~\0�t\0\0sq\0~\0w\0\0\0t\0xrefsq\0~\0\0q\0~\0�sq\0~\0���q\0~\0�t\0\0pt\0locationsq\0~\0q\0~\0�sq\0~\03��q\0~\0�t\0\0pt\0	namespacesq\0~\0\0q\0~\0�sq\0~\0aͶq\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�xt\0ExtendedAttributessr\02org.enhydra.shark.xpdl.elements.ExtendedAttributes�O���UF\0L\0extAttribsStringq\0~\0xq\0~\0k\0q\0~\0�sq\0~\0\"�$q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xsq\0~\0�t\0Participantsq\0~\0q\n\"�q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0?�MNq\0~\0�t\0approverpq\0~\0sq\0~\0\0q\0~\0sq\0~\0&�*q\0~\0�t\0Approverpt\0ParticipantTypesq\0~\0�q\0~\0�sq\0~\0m���q\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0a;��q\0~\0�t\0ROLEsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�xxsq\0~\0E\0\0\0w\0\0\0q\0~\0�xt\0Descriptionsq\0~\02\0q\0~\0�sq\0~\0A��vq\0~\0�t\0\0t\0ExternalReferencesq\0~\0�\0q\0~\0�sq\0~\0V�Aeq\0~\0�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0=CNq\0~\0�t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0pw�q\0~\0�t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0v�7�q\0~\0�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~q\0~	xt\0ExtendedAttributessq\0~\0�\0q\0~\rsq\0~\0\Z��4q\0~\0�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~xxt\0Applicationssr\0,org.enhydra.shark.xpdl.elements.Applications����\0\0xq\0~\0k\0q\0~sq\0~\0q/�q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0+org.enhydra.shark.xpdl.elements.Applicationv	�R��S\0\0xq\0~\0�t\0Applicationsq\0~\0`��q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0j�Eq\0~t\0default_applicationpq\0~\0sq\0~\0\0q\0~\0sq\0~\0Hu�eq\0~t\0\0pt\0Descriptionsq\0~\02\0q\0~\'sq\0~\0u_q\0~t\0\0t\0Choicesr\00org.enhydra.shark.xpdl.elements.ApplicationTypes�?�!���\0\0xr\0\'org.enhydra.shark.xpdl.XMLComplexChoice�|��\"��\0L\0choicesq\0~\0L\0choosenq\0~\0	xq\0~\0q\0~+sq\0~\0_c�q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sr\00org.enhydra.shark.xpdl.elements.FormalParametersp��B�ÁZ\0\0xq\0~\0k\0t\0FormalParameterssq\0~\0��bq\0~.t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~\0�\0t\0ExternalReferencesq\0~\0w�;q\0~.t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�Jq\0~9t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0h�T�q\0~9t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0V\Zu\Zq\0~9t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~>q\0~Aq\0~Dxxq\0~3t\0ExtendedAttributessq\0~\0�\0q\0~Hsq\0~\0qˡ�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~!q\0~$q\0~(q\0~.q\0~Ixxt\0\nDataFieldssr\0*org.enhydra.shark.xpdl.elements.DataFields���ʦ��U\0\0xq\0~\0k\0q\0~Osq\0~\0��4q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0WorkflowProcessessr\01org.enhydra.shark.xpdl.elements.WorkflowProcessesp�_�0,\0\0xq\0~\0k\0q\0~Vsq\0~\07���q\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0/org.enhydra.shark.xpdl.elements.WorkflowProcess%�v0��L\0\0xq\0~\0�t\0WorkflowProcesssq\0~\0X���q\0~Xt\0\0sq\0~\0w\0\0\0\rq\0~\0sq\0~\0q\0~\0sq\0~\0�q\0~^t\0process1pq\0~\0sq\0~\0\0q\0~\0sq\0~\04��q\0~^t\0Proposal Approval Processpt\0AccessLevelsq\0~\0\0q\0~isq\0~\0�\0q\0~^q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0PUBLICt\0PRIVATExt\0\rProcessHeadersr\0-org.enhydra.shark.xpdl.elements.ProcessHeader�L��C-)�\0\0xq\0~\0q\0~osq\0~\0E9�q\0~^t\0\0sq\0~\0w\0\0\0t\0DurationUnitsq\0~\0\0q\0~usq\0~\0�(�q\0~qt\0hsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0Yt\0Mt\0Dt\0ht\0mt\0sxt\0Createdsq\0~\0-\0q\0~�sq\0~\0;XP�q\0~qt\0\0t\0Descriptionsq\0~\02\0q\0~�sq\0~\0*	OBq\0~qt\0\0t\0Prioritysr\0(org.enhydra.shark.xpdl.elements.Priority`�Nn>b\0\0xq\0~\0#\0q\0~�sq\0~\0Y]q\0~qt\0\0t\0Limitsr\0%org.enhydra.shark.xpdl.elements.Limit���1�ӗ\0\0xq\0~\0#\0q\0~�sq\0~\0m��iq\0~qt\0\0t\0	ValidFromsr\0)org.enhydra.shark.xpdl.elements.ValidFromcŅ|�L<\0\0xq\0~\0#\0q\0~�sq\0~\0�R7q\0~qt\0\0t\0ValidTosr\0\'org.enhydra.shark.xpdl.elements.ValidTo����M�\0\0xq\0~\0#\0q\0~�sq\0~\0tl�q\0~qt\0\0t\0TimeEstimationsr\0.org.enhydra.shark.xpdl.elements.TimeEstimationŀ�\'3\0\0xq\0~\0\0q\0~�sq\0~\0Bf�q\0~qt\0\0sq\0~\0w\0\0\0t\0WaitingTimesr\0+org.enhydra.shark.xpdl.elements.WaitingTimeN����/\0\0xq\0~\0#\0q\0~�sq\0~\0I�}q\0~�t\0\0t\0WorkingTimesr\0+org.enhydra.shark.xpdl.elements.WorkingTime�~����\0\0xq\0~\0#\0q\0~�sq\0~\0_9��q\0~�t\0\0t\0Durationsr\0(org.enhydra.shark.xpdl.elements.Duration� �C���\0\0xq\0~\0#\0q\0~�sq\0~\00�:vq\0~�t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~vq\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0RedefinableHeadersq\0~\0H\0q\0~�sq\0~\03W�pq\0~^t\0\0sq\0~\0w\0\0\0q\0~\0Msq\0~\0\0q\0~\0Msq\0~\0\n�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\0Rq\0~\0Sq\0~\0Txt\0Authorsq\0~\0V\0q\0~�sq\0~\0\Zn�q\0~�t\0\0t\0Versionsq\0~\0[\0q\0~�sq\0~\0+�Q�q\0~�t\0\0t\0Codepagesq\0~\0`\0q\0~�sq\0~\0$��q\0~�t\0\0t\0\nCountrykeysq\0~\0e\0q\0~�sq\0~\0v��q\0~�t\0\0t\0Responsiblessq\0~\0j\0q\0~�sq\0~\0�fq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xt\0FormalParameterssq\0~2\0q\0~�sq\0~\0P�A9q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0\nDataFieldssq\0~P\0q\0~�sq\0~\0K�7q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0)org.enhydra.shark.xpdl.elements.DataFieldI�3.~���\0\0xq\0~\0�t\0	DataFieldsq\0~\0jO<Gq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0KG�\Zq\0~�t\0statuspq\0~\0sq\0~\0\0q\0~\0sq\0~\07k)�q\0~�t\0\0pt\0IsArraysq\0~\0\0q\0~�sq\0~\0iF��q\0~�t\0FALSEsq\0~\0E\0\0\0w\0\0\0t\0TRUEt\0FALSExt\0DataTypesr\0(org.enhydra.shark.xpdl.elements.DataType�\'4sM\0\0xq\0~\0q\0~�sq\0~\0I���q\0~�t\0\0sq\0~\0w\0\0\0t\0	DataTypessr\0)org.enhydra.shark.xpdl.elements.DataTypes�pcH,�!�\0Z\0\risInitializedxq\0~-q\0~�sq\0~\04K�Lq\0~�t\0\0sq\0~\0E\0\0\0	w\0\0\0	sr\0)org.enhydra.shark.xpdl.elements.BasicType�)��w1��\0\0xq\0~\0t\0	BasicTypesq\0~\05��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0q\0~\0�sq\0~\0&�@�q\0~�t\0STRINGsq\0~\0E\0\0\0w\0\0\0t\0STRINGt\0FLOATt\0INTEGERt\0	REFERENCEt\0DATETIMEt\0BOOLEANt\0	PERFORMERxxsq\0~\0E\0\0\0w\0\0\0q\0~xsr\0,org.enhydra.shark.xpdl.elements.DeclaredTypedR.\\^�9�\0\0xq\0~\0t\0DeclaredTypesq\0~\0J��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0 �q\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~xsr\0*org.enhydra.shark.xpdl.elements.SchemaType&1oSH��\0\0xq\0~\0t\0\nSchemaTypesq\0~\0Jigcq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~\0�t\0ExternalReferencesq\0~\0FW��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0S��8q\0~ t\0\0pq\0~\0�sq\0~\0q\0~\0�sq\0~\0p�M�q\0~ t\0\0pq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0q�~�q\0~ t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~%q\0~(q\0~+xsr\0*org.enhydra.shark.xpdl.elements.RecordType�%����K\0\0\0xq\0~\0kt\0\nRecordTypesq\0~\0�?vq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.UnionType���5P�G�\0\0xq\0~\0kt\0	UnionTypesq\0~\0=sMq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0/org.enhydra.shark.xpdl.elements.EnumerationType����f3b\0\0xq\0~\0kt\0EnumerationTypesq\0~\0w&S�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.ArrayTypeg�$\0�N@\0\0xq\0~\0t\0	ArrayTypesq\0~\0%U�Vq\0~�t\0\0sq\0~\0w\0\0\0t\0\nLowerIndexsq\0~\0q\0~Jsq\0~\0GQq\0~Et\0\0pt\0\nUpperIndexsq\0~\0q\0~Nsq\0~\0IÐ�q\0~Et\0\0pq\0~�sq\0~�q\0~�sq\0~\0���q\0~Et\0\0ppxsq\0~\0E\0\0\0w\0\0\0q\0~Kq\0~Oq\0~Rxsr\0(org.enhydra.shark.xpdl.elements.ListType�\"ӟ\n�\0\0xq\0~\0t\0ListTypesq\0~\0qdAq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�q\0~�sq\0~\0Ij�q\0~Wt\0\0ppxsq\0~\0E\0\0\0w\0\0\0q\0~\\xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0InitialValuesr\0,org.enhydra.shark.xpdl.elements.InitialValuej,z���R\0\0xq\0~\0#\0q\0~asq\0~\0�}nq\0~�t\0\0t\0Lengthsr\0&org.enhydra.shark.xpdl.elements.LengthMW+-̩W�\0\0xq\0~\0#\0q\0~fsq\0~\0w�$�q\0~�t\0\0t\0Descriptionsq\0~\02\0q\0~ksq\0~\0zq\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~osq\0~\0�J�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~cq\0~hq\0~lq\0~pxxt\0Participantssq\0~\0�\0q\0~vsq\0~\0h3U�q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Applicationssq\0~\0q\0~|sq\0~\0l�*q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ActivitySetssr\0,org.enhydra.shark.xpdl.elements.ActivitySets�qV[4���\0\0xq\0~\0k\0q\0~�sq\0~\0fO<1q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0\nActivitiessr\0*org.enhydra.shark.xpdl.elements.Activities&G^�l�P\0\0xq\0~\0k\0q\0~�sq\0~\0=��hq\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0(org.enhydra.shark.xpdl.elements.Activity�t�45\Z9�\0\0xq\0~\0�t\0Activitysq\0~\0;�Enq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0p��q\0~�t\0approve_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0�t/q\0~�t\0Approve Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\06��q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0s&�_q\0~�t\0\0q\0~\0�sr\0-org.enhydra.shark.xpdl.elements.ActivityTypeseŽ{����\0\0xq\0~-q\0~\0�sq\0~\0r�\r`q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0%org.enhydra.shark.xpdl.elements.Route0e�\r�G�\0\0xq\0~\0t\0Routesq\0~\0[f{q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0.org.enhydra.shark.xpdl.elements.Implementation�r��^%�\0\0xq\0~\0t\0Implementationsq\0~\01@nQq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sr\03org.enhydra.shark.xpdl.elements.ImplementationTypes\r��T١9\0\0xq\0~-q\0~\0�sq\0~\0wrNtq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0\"org.enhydra.shark.xpdl.elements.No{���.\0\0xq\0~\0t\0Nosq\0~\0]��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0%org.enhydra.shark.xpdl.elements.ToolsC��g��\0\0xq\0~\0k\0t\0Toolssq\0~\05^�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0\'org.enhydra.shark.xpdl.elements.SubFlow;O�s�7:$\0\0xq\0~\0t\0SubFlowsq\0~\0^1�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0b���q\0~�t\0\0pt\0	Executionsq\0~\0\0q\0~�sq\0~\0{�\0qq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ASYNCHRt\0SYNCHRxt\0ActualParameterssr\00org.enhydra.shark.xpdl.elements.ActualParameters���_�K�\0\0xq\0~\0k\0q\0~�sq\0~\09Df�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsr\0-org.enhydra.shark.xpdl.elements.BlockActivity�q�c��F\0\0xq\0~\0t\0\rBlockActivitysq\0~\0O`�q\0~�t\0\0sq\0~\0w\0\0\0t\0BlockIdsq\0~\0q\0~�sq\0~\0{�iq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersr\0)org.enhydra.shark.xpdl.elements.Performer�\"1%���\0\0xq\0~\0#\0q\0~�sq\0~\0 ���q\0~�t\0approvert\0	StartModesr\0)org.enhydra.shark.xpdl.elements.StartModenh����S\0\0xq\0~\0\0q\0~�sq\0~\0:n�q\0~�t\0\0sq\0~\0w\0\0\0t\0Modesr\00org.enhydra.shark.xpdl.elements.StartFinishModes~�6z�X�\'\0\0xq\0~-\0q\0~�sq\0~\0p�nfq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sr\0,org.enhydra.shark.xpdl.XMLEmptyChoiceElement�2�;�3�_\0\0xq\0~\0\0t\0XMLEmptyChoiceElementsq\0~\0P��#q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0)org.enhydra.shark.xpdl.elements.Automatic�t?�_��\0\0xq\0~\0t\0	Automaticsq\0~\0Z_��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsr\0&org.enhydra.shark.xpdl.elements.Manual�v���[ؤ\0\0xq\0~\0t\0Manualsq\0~\08�g�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0\nFinishModesr\0*org.enhydra.shark.xpdl.elements.FinishMode�������{\0\0xq\0~\0\0q\0~sq\0~\0H�F	q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0N���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0Yy�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0;[;�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0^�Yrq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Prioritysq\0~�\0q\0~0sq\0~\0e���q\0~�t\0\0t\0	Deadlinessr\0)org.enhydra.shark.xpdl.elements.Deadlines>��ɜ��\0\0xq\0~\0k\0q\0~4sq\0~\0r(�4q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsr\05org.enhydra.shark.xpdl.elements.SimulationInformation\"�|I���\0\0xq\0~\0\0q\0~;sq\0~\0L�q\0~�t\0\0sq\0~\0w\0\0\0t\0\rInstantiationsq\0~\0\0q\0~Asq\0~\0T�J�q\0~=q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ONCEt\0MULTIPLExt\0Costsr\0$org.enhydra.shark.xpdl.elements.Cost�����\0\0xq\0~\0#q\0~Gsq\0~\0*��q\0~=t\0\0t\0TimeEstimationsq\0~�q\0~Lsq\0~\02�<4q\0~=t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Qsq\0~\0D�G�q\0~Mt\0\0t\0WorkingTimesq\0~�\0q\0~Usq\0~\0T0Kq\0~Mt\0\0t\0Durationsq\0~�\0q\0~Ysq\0~\0A��q\0~Mt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~Rq\0~Vq\0~Zxxsq\0~\0E\0\0\0w\0\0\0q\0~Bq\0~Iq\0~Mxt\0Iconsr\0$org.enhydra.shark.xpdl.elements.Icon�T�U(�}6\0\0xq\0~\0#\0q\0~_sq\0~\0Z�r+q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~dsq\0~\0$\Z-q\0~�t\0\0t\0TransitionRestrictionssr\06org.enhydra.shark.xpdl.elements.TransitionRestrictionsC)�׀i;\0\0xq\0~\0k\0q\0~hsq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\05org.enhydra.shark.xpdl.elements.TransitionRestrictionN����}�\0\0xq\0~\0t\0TransitionRestrictionsq\0~\0�I�q\0~jt\0\0sq\0~\0w\0\0\0t\0Joinsr\0$org.enhydra.shark.xpdl.elements.Joinڕөx)�5\0\0xq\0~\0\0q\0~usq\0~\0DYq\0~pt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0#��[q\0~wt\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0ANDt\0XORxxsq\0~\0E\0\0\0w\0\0\0q\0~{xt\0Splitsr\0%org.enhydra.shark.xpdl.elements.Split���~ѯWS\0\0xq\0~\0\0q\0~�sq\0~\0{�q\0~pt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\09�g�q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssr\0.org.enhydra.shark.xpdl.elements.TransitionRefs��ъ���\0\0xq\0~\0k\0q\0~�sq\0~\0]��{q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~wq\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0Q���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\01org.enhydra.shark.xpdl.elements.ExtendedAttribute��\\��F\0\0xq\0~\0t\0ExtendedAttributesq\0~\0*A0�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0��q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpt\0Valuesq\0~\0\0q\0~�sq\0~\0!y�sq\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0	�ݡq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0*q|q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0\r��q\0~�t\0#205.0000228881836,56.76666259765625pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~1q\0~6q\0~=q\0~aq\0~eq\0~jq\0~�xsq\0~�t\0Activitysq\0~\0bc*Bq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Zޓq\0~�t\0approvalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0M5�zq\0~�t\0Approvalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0ouBq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0w0-q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0n�)�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0:�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0H��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0d�R�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0c�]Nq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\08SMq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0g|NAq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0A��q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0HZԊq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0p�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0\r:�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0s[tfq\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0m�q\0~�t\0approvert\0	StartModesq\0~�\0q\0~sq\0~\0LD�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\02�?q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0bT�Nq\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0d	^q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0&��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~#sq\0~\0K�k�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0BJ0q\0~$t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\'Q\n�q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0Y�5q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\09��q\0~(t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~,xsq\0~\0E\0\0\0w\0\0\0q\0~(xt\0Prioritysq\0~�\0q\0~?sq\0~\0tȍ�q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~Csq\0~\0[a��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Isq\0~\0,�X�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0U��q\0~Jq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~Qsq\0~\0eJ��q\0~Jt\0\0t\0TimeEstimationsq\0~�q\0~Usq\0~\03�5tq\0~Jt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Zsq\0~\0\rxO�q\0~Vt\0\0t\0WorkingTimesq\0~�\0q\0~^sq\0~\0 ^�q\0~Vt\0\0t\0Durationsq\0~�\0q\0~bsq\0~\0`�q\0~Vt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~[q\0~_q\0~cxxsq\0~\0E\0\0\0w\0\0\0q\0~Nq\0~Rq\0~Vxt\0Iconsq\0~`\0q\0~hsq\0~\00kq�q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~lsq\0~\0#��q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~psq\0~\0%��iq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~ot\0TransitionRestrictionsq\0~\0sq\0~qt\0\0sq\0~\0w\0\0\0t\0Joinsq\0~v\0q\0~{sq\0~\0GQ(Fq\0~vt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0K[��q\0~|q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Splitsq\0~�\0q\0~�sq\0~\0i�wq\0~vt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\n��q\0~�t\0XORsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssq\0~�\0q\0~�sq\0~\0D��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0-org.enhydra.shark.xpdl.elements.TransitionRef�%-��a�\0\0xq\0~\0�t\0\rTransitionRefsq\0~\0\nߕ8q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\\��nq\0~�t\0transition3pxsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rTransitionRefsq\0~\0W��nq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0*�q\0~�t\0transition6pxsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rTransitionRefsq\0~\0f��oq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Ug�Dq\0~�t\0transition5pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~|q\0~�xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\01�7q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\01C>oq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0_L�8q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0���q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0r_�_q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0ZGi=q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0a��q\0~�t\0430,62.79999084472655pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~$q\0~@q\0~Dq\0~Jq\0~iq\0~mq\0~qq\0~�xsq\0~�t\0Activitysq\0~\0��Cq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0;d\\nq\0~�t\0	activity1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\n�v�q\0~�t\0Resubmit Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0kR�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0��rq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\06r�}q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0W�dq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0+�	}q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\nI�Lq\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0*�5Kq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\02\n;�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0!%`sq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0fY��q\0~t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0M�8q\0~q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~\rsq\0~\0.�~q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~\nq\0~xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0$\0� q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0}�\\q\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\Zxxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0�<�q\0~�t\0	requestert\0	StartModesq\0~�\0q\0~\"sq\0~\0I$��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0k��Gq\0~#t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0_#O�q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0\n��q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0��q\0~\'t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~+xsq\0~\0E\0\0\0w\0\0\0q\0~\'xt\0\nFinishModesq\0~\0q\0~>sq\0~\0�o�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0Ko�q\0~?t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0���q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0Q�\'q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0\rf�q\0~Ct\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~Gxsq\0~\0E\0\0\0w\0\0\0q\0~Cxt\0Prioritysq\0~�\0q\0~Zsq\0~\0JAgq\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~^sq\0~\04��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~dsq\0~\0Йq\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0r�\'�q\0~eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~lsq\0~\00~/�q\0~et\0\0t\0TimeEstimationsq\0~�q\0~psq\0~\0#Y��q\0~et\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~usq\0~\0#A��q\0~qt\0\0t\0WorkingTimesq\0~�\0q\0~ysq\0~\0 �lNq\0~qt\0\0t\0Durationsq\0~�\0q\0~}sq\0~\0a#�q\0~qt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~vq\0~zq\0~~xxsq\0~\0E\0\0\0w\0\0\0q\0~iq\0~mq\0~qxt\0Iconsq\0~`\0q\0~�sq\0~\0\r��q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~�sq\0~\0#P�7q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~�sq\0~\0x6q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0q�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0%���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Y:_�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0}�q\0~�t\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0\Z��Eq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0;|��q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\00�Dq\0~�t\0397,20.787493896484378pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~#q\0~?q\0~[q\0~_q\0~eq\0~�q\0~�q\0~�q\0~�xsq\0~�t\0Activitysq\0~\0(Ċq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0R�3�q\0~�t\0\rsend_proposalpq\0~\0sq\0~\0\0q\0~\0sq\0~\0\Z/Q�q\0~�t\0\rSend Proposalpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0E���q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0m�~{q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0>���q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0^o�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0V�E�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\08^��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0y�?*q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0Z\nR�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0ۑfq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Y���q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0Q�ʰq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0Y��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0�wq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0/`>)q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0`y�?q\0~�t\0	requestert\0	StartModesq\0~�\0q\0~sq\0~\0��_q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0}���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0-��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0L$#�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0h��=q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~sq\0~\0\Z��\0q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0{tq\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0W���q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0*޲q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0C���q\0~#t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~\'xsq\0~\0E\0\0\0w\0\0\0q\0~#xt\0Prioritysq\0~�\0q\0~:sq\0~\0I��bq\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~>sq\0~\0;���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Dsq\0~\0O	?q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0H(��q\0~Eq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~Lsq\0~\0]��~q\0~Et\0\0t\0TimeEstimationsq\0~�q\0~Psq\0~\0zE�q\0~Et\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~Usq\0~\0|2��q\0~Qt\0\0t\0WorkingTimesq\0~�\0q\0~Ysq\0~\0q�{Aq\0~Qt\0\0t\0Durationsq\0~�\0q\0~]sq\0~\0-m@q\0~Qt\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~Vq\0~Zq\0~^xxsq\0~\0E\0\0\0w\0\0\0q\0~Iq\0~Mq\0~Qxt\0Iconsq\0~`\0q\0~csq\0~\0S�xq\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~gsq\0~\09)bWq\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~ksq\0~\0RW@q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~qsq\0~\0y�oq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0.��q\0~rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0t��q\0~wt\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0v�I�q\0~wt\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~|q\0~xsq\0~�t\0ExtendedAttributesq\0~\0ka��q\0~rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\n!\Zq\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0w��q\0~�t\0#681.0000381469727,99.78333282470703pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~;q\0~?q\0~Eq\0~dq\0~hq\0~lq\0~rxsq\0~�t\0Activitysq\0~\0b��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0P��q\0~�t\0parallelpq\0~\0sq\0~\0\0q\0~\0sq\0~\0��#q\0~�t\0Parallelpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0^�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\04�Ӊq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0fwP�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0�[�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0|�d�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\06��9q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0j�טq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\07��Yq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0p���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\01���q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0]Y�Hq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0<М�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\02V�uq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0L��q\0~�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~�xxq\0~�t\0	Performersq\0~�\0q\0~�sq\0~\0^7��q\0~�t\0approvert\0	StartModesq\0~�\0q\0~�sq\0~\0f:h\nq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0a@�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0(߃q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0\n8gq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0H-�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0\nFinishModesq\0~\0q\0~�sq\0~\0Eչq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0k��q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0^�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0H$L�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0)��2q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Prioritysq\0~�\0q\0~\Zsq\0~\0	��-q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~sq\0~\0\'���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~$sq\0~\0Mդ�q\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0z��_q\0~%q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~,sq\0~\0t�-�q\0~%t\0\0t\0TimeEstimationsq\0~�q\0~0sq\0~\0,��Xq\0~%t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~5sq\0~\0LnOEq\0~1t\0\0t\0WorkingTimesq\0~�\0q\0~9sq\0~\0p��q\0~1t\0\0t\0Durationsq\0~�\0q\0~=sq\0~\0}wC�q\0~1t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~6q\0~:q\0~>xxsq\0~\0E\0\0\0w\0\0\0q\0~)q\0~-q\0~1xt\0Iconsq\0~`\0q\0~Csq\0~\0,#6q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~Gsq\0~\0�@�q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~Ksq\0~\0\"%�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~ot\0TransitionRestrictionsq\0~\0~�q\0~Lt\0\0sq\0~\0w\0\0\0t\0Joinsq\0~v\0q\0~Vsq\0~\0�Ӡq\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0+,q\0~Wq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xxsq\0~\0E\0\0\0w\0\0\0q\0~[xt\0Splitsq\0~�\0q\0~_sq\0~\02��+q\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0V�q\0~`t\0ANDsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~q\0~�xt\0TransitionRefssq\0~�\0q\0~hsq\0~\0�q\0~`t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0\rTransitionRefsq\0~\0S��xq\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0N��fq\0~nt\0transition7pxsq\0~\0E\0\0\0w\0\0\0q\0~sxsq\0~�t\0\rTransitionRefsq\0~\0َ�q\0~it\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0U�h3q\0~wt\0transition8pxsq\0~\0E\0\0\0w\0\0\0q\0~|xxxsq\0~\0E\0\0\0w\0\0\0q\0~dq\0~ixxsq\0~\0E\0\0\0w\0\0\0q\0~Wq\0~`xxt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0e�!6q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0WiBq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�~�q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0H\n-�q\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0FZ�|q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0de��q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0�mq\0~�t\0588,61.599993896484364pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~%q\0~Dq\0~Hq\0~Lq\0~�xsq\0~�t\0Activitysq\0~\0\r_0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0m�1^q\0~�t\0tool1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0Rl�q\0~�t\0\ZSend Approval Notificationpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0T\0yvq\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\0+j#&q\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0,�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\0 /6�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0w�0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0\r:^�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0	&��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0P壱q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0$org.enhydra.shark.xpdl.elements.Tool\\6�&�+G�\0\0xq\0~\0�t\0Toolsq\0~\0X���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0N�*q\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0ER�8q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0APPLICATIONt\0	PROCEDURExt\0ActualParameterssq\0~�\0q\0~�sq\0~\0X���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0Iѐ@q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0�_�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~�t\0SubFlowsq\0~\0>8��q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0a�7�q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0_�lJq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0\"� q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0X֟@q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\0`{^Jq\0~t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~\nxxq\0~�t\0	Performersq\0~�\0q\0~sq\0~\0a�3q\0~�t\0approvert\0	StartModesq\0~�\0q\0~sq\0~\03�;q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0_���q\0~t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0�J�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0	�q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0\rl3}q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~xsq\0~\0E\0\0\0w\0\0\0q\0~xt\0\nFinishModesq\0~\0q\0~.sq\0~\0uJ0�q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0#�3sq\0~/t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0\r��Aq\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0�aUq\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\08*�q\0~3t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~7xsq\0~\0E\0\0\0w\0\0\0q\0~3xt\0Prioritysq\0~�\0q\0~Jsq\0~\0l).q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~Nsq\0~\0�#fq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~Tsq\0~\0#�dgq\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0KxiXq\0~Uq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~\\sq\0~\0n�ggq\0~Ut\0\0t\0TimeEstimationsq\0~�q\0~`sq\0~\0���q\0~Ut\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~esq\0~\0z$�q\0~at\0\0t\0WorkingTimesq\0~�\0q\0~isq\0~\0��q\0~at\0\0t\0Durationsq\0~�\0q\0~msq\0~\0F�NVq\0~at\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~fq\0~jq\0~nxxsq\0~\0E\0\0\0w\0\0\0q\0~Yq\0~]q\0~axt\0Iconsq\0~`\0q\0~ssq\0~\0)���q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~wsq\0~\0{ �q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~{sq\0~\0u��iq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0!��sq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0�Iq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\04��/q\0~�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0D�Jq\0~�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xsq\0~�t\0ExtendedAttributesq\0~\0��0q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\09�9�q\0~�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0`��q\0~�t\0735,63.974993896484364pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~q\0~q\0~/q\0~Kq\0~Oq\0~Uq\0~tq\0~xq\0~|q\0~�xsq\0~�t\0Activitysq\0~\0$#q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\02-e�q\0~�t\0tool2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0M���q\0~�t\0Send Reject Notificationpt\0Descriptionsq\0~\02\0q\0~�sq\0~\0٤�q\0~�t\0\0t\0Limitsq\0~�\0q\0~�sq\0~\08D�pq\0~�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0-�Q�q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\06��xq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0f���q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0y�]q\0~�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0.���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0�Nq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Toolsq\0~\0h�q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0z��6q\0~�t\0default_applicationpq\0~\0�sq\0~\0\0q\0~\0�sq\0~\0c�jq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0ATX�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0;+�`q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0j��q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�xxsq\0~�t\0SubFlowsq\0~\03�Pq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0\n���q\0~�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0x��q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~�sq\0~\0db�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�xxq\0~�xsq\0~\0E\0\0\0w\0\0\0q\0~�xsq\0~�t\0\rBlockActivitysq\0~\0ezyTq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\02�{�q\0~	t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~	xxq\0~�t\0	Performersq\0~�\0q\0~	\nsq\0~\05���q\0~�t\0approvert\0	StartModesq\0~�\0q\0~	sq\0~\0F\'��q\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0p!��q\0~	t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0u��q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0C���q\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0*n]bq\0~	t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	xsq\0~\0E\0\0\0w\0\0\0q\0~	xt\0\nFinishModesq\0~\0q\0~	*sq\0~\0w�Nq\0~�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0R3�q\0~	+t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\05�X�q\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0ma!2q\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0F�q\0~	/t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	3xsq\0~\0E\0\0\0w\0\0\0q\0~	/xt\0Prioritysq\0~�\0q\0~	Fsq\0~\0\0�\\q\0~�t\0\0t\0	Deadlinessq\0~5\0q\0~	Jsq\0~\0a\Z8�q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~	Psq\0~\0��pq\0~�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\06D/q\0~	Qq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~	Xsq\0~\0%��q\0~	Qt\0\0t\0TimeEstimationsq\0~�q\0~	\\sq\0~\0��)q\0~	Qt\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~	asq\0~\0\'5��q\0~	]t\0\0t\0WorkingTimesq\0~�\0q\0~	esq\0~\0k��nq\0~	]t\0\0t\0Durationsq\0~�\0q\0~	isq\0~\0y�(q\0~	]t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~	bq\0~	fq\0~	jxxsq\0~\0E\0\0\0w\0\0\0q\0~	Uq\0~	Yq\0~	]xt\0Iconsq\0~`\0q\0~	osq\0~\08���q\0~�t\0\0t\0\rDocumentationsq\0~\07\0q\0~	ssq\0~\03�q\0~�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~	wsq\0~\0gdъq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~	}sq\0~\0�	xq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0%�q\0~	~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0-�u[q\0~	�t\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\01x�\nq\0~	�t\0approverpxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�xsq\0~�t\0ExtendedAttributesq\0~\0wg`q\0~	~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\06���q\0~	�t\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0P7g�q\0~	�t\0394,168.39999694824218pxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~	q\0~	q\0~	+q\0~	Gq\0~	Kq\0~	Qq\0~	pq\0~	tq\0~	xq\0~	~xsq\0~�t\0Activitysq\0~\0%�Cq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0c�q\0~	�t\0route1pq\0~\0sq\0~\0\0q\0~\0sq\0~\0i)9[q\0~	�t\0Route 1pt\0Descriptionsq\0~\02\0q\0~	�sq\0~\0JU�q\0~	�t\0\0t\0Limitsq\0~�\0q\0~	�sq\0~\0!5��q\0~	�t\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0�Iq\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Routesq\0~\03��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0Implementationsq\0~\0Q�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~�q\0~\0�sq\0~\0]1ͳq\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�t\0Nosq\0~\0v��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�\0t\0Toolssq\0~\0e̝q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~�t\0SubFlowsq\0~\0�\"�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0R�;-q\0~	�t\0\0pq\0~�sq\0~\0\0q\0~�sq\0~\0�\n�q\0~	�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~�q\0~�xt\0ActualParameterssq\0~�\0q\0~	�sq\0~\0\Z��?q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�q\0~	�xxq\0~	�xsq\0~\0E\0\0\0w\0\0\0q\0~	�xsq\0~�t\0\rBlockActivitysq\0~\0*��(q\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~\0q\0~�sq\0~\01�q\0~	�t\0\0pxsq\0~\0E\0\0\0w\0\0\0q\0~	�xxq\0~	�t\0	Performersq\0~�\0q\0~	�sq\0~\08�q\0~	�t\0	requestert\0	StartModesq\0~�\0q\0~	�sq\0~\0��q\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0)��q\0~	�t\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0�_�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0+��q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0dW�*q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~	�xsq\0~\0E\0\0\0w\0\0\0q\0~	�xt\0\nFinishModesq\0~\0q\0~\n\nsq\0~\0E⛱q\0~	�t\0\0sq\0~\0w\0\0\0q\0~�sq\0~�\0q\0~�sq\0~\0_&��q\0~\nt\0\0sq\0~\0E\0\0\0w\0\0\0sq\0~�\0t\0XMLEmptyChoiceElementsq\0~\0w߷dq\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0	Automaticsq\0~\0�5�q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xsq\0~t\0Manualsq\0~\0��q\0~\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xxq\0~\nxsq\0~\0E\0\0\0w\0\0\0q\0~\nxt\0Prioritysq\0~�\0q\0~\n&sq\0~\01ٮ�q\0~	�t\0\0t\0	Deadlinessq\0~5\0q\0~\n*sq\0~\0;�K;q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0SimulationInformationsq\0~<\0q\0~\n0sq\0~\0[D�q\0~	�t\0\0sq\0~\0w\0\0\0q\0~Asq\0~\0\0q\0~Asq\0~\0+E�q\0~\n1q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~Eq\0~Fxt\0Costsq\0~Hq\0~\n8sq\0~\0W��q\0~\n1t\0\0t\0TimeEstimationsq\0~�q\0~\n<sq\0~\0Vx�Rq\0~\n1t\0\0sq\0~\0w\0\0\0t\0WaitingTimesq\0~�\0q\0~\nAsq\0~\0-���q\0~\n=t\0\0t\0WorkingTimesq\0~�\0q\0~\nEsq\0~\0.9��q\0~\n=t\0\0t\0Durationsq\0~�\0q\0~\nIsq\0~\0E���q\0~\n=t\0\0xsq\0~\0E\0\0\0w\0\0\0q\0~\nBq\0~\nFq\0~\nJxxsq\0~\0E\0\0\0w\0\0\0q\0~\n5q\0~\n9q\0~\n=xt\0Iconsq\0~`\0q\0~\nOsq\0~\0T��rq\0~	�t\0\0t\0\rDocumentationsq\0~\07\0q\0~\nSsq\0~\0o��4q\0~	�t\0\0t\0TransitionRestrictionssq\0~i\0q\0~\nWsq\0~\0\r%L�q\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0\0w\0\0\0\0xt\0ExtendedAttributessq\0~\0�\0q\0~\n]sq\0~\0dn�Dq\0~	�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0O� �q\0~\n^t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0a�L_q\0~\nct\0JaWE_GRAPH_PARTICIPANT_IDpq\0~�sq\0~\0\0q\0~�sq\0~\0g���q\0~\nct\0	requesterpxsq\0~\0E\0\0\0w\0\0\0q\0~\nhq\0~\nkxsq\0~�t\0ExtendedAttributesq\0~\0895\"q\0~\n^t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0f��q\0~\not\0JaWE_GRAPH_OFFSETpq\0~�sq\0~\0\0q\0~�sq\0~\0]���q\0~\not\0228.0000228881836,22pxsq\0~\0E\0\0\0w\0\0\0q\0~\ntq\0~\nwxxpxsq\0~\0E\0\0\0w\0\0\0q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~	�q\0~\nq\0~\n\'q\0~\n+q\0~\n1q\0~\nPq\0~\nTq\0~\nXq\0~\n^xxt\0Transitionssr\0+org.enhydra.shark.xpdl.elements.Transitions�9>��/i�\0\0xq\0~\0k\0q\0~\n|sq\0~\0O�\n/q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0*org.enhydra.shark.xpdl.elements.Transitiont�x��\0\0xq\0~\0�t\0\nTransitionsq\0~\0PE�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0W�ѳq\0~\n�t\0transition2pq\0~\0sq\0~\0\0q\0~\0sq\0~\0�$�q\0~\n�t\0\0pt\0Fromsq\0~\0q\0~\n�sq\0~\0?�DOq\0~\n�t\0approve_proposalpt\0Tosq\0~\0q\0~\n�sq\0~\0U��q\0~\n�t\0approvalpt\0	Conditionsr\0)org.enhydra.shark.xpdl.elements.Condition��D��Z;|\0\0xq\0~\0\0q\0~\n�sq\0~\0kt�=q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0>~T q\0~\n�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pt\0	CONDITIONt\0	OTHERWISEt\0	EXCEPTIONt\0DEFAULTEXCEPTIONxxsq\0~\0E\0\0\0w\0\0\0q\0~\n�xt\0Descriptionsq\0~\02\0q\0~\n�sq\0~\0#m�q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\0�%�q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0A?,5q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0 �ʪq\0~\n�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0OS��q\0~\n�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xsq\0~\n�t\0\nTransitionsq\0~\0Gr=�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0y���q\0~\n�t\0transition3pq\0~\0sq\0~\0\0q\0~\0sq\0~\0\n��q\0~\n�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0���q\0~\n�t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0YW�3q\0~\n�t\0	activity1pt\0	Conditionsq\0~\n�\0q\0~\n�sq\0~\0\\\"_Nq\0~\n�t\0status===\'resubmit\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0�XLq\0~\n�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~\n�xt\0Descriptionsq\0~\02\0q\0~\n�sq\0~\0aZa�q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~\n�sq\0~\07�m=q\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0<��;q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�T�q\0~\n�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\01�*gq\0~\n�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\n�xsq\0~\n�t\0\nTransitionsq\0~\0K�!�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\010q\0~\n�t\0transition4pq\0~\0sq\0~\0\0q\0~\0sq\0~\0vm�.q\0~\n�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0|�q\0~\n�t\0	activity1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0F~x�q\0~\n�t\0approve_proposalpt\0	Conditionsq\0~\n�\0q\0~\n�sq\0~\0t()q\0~\n�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0��#q\0~\0q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~xt\0Descriptionsq\0~\02\0q\0~sq\0~\0.9�q\0~\n�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\06��Qq\0~\n�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0Vmy�q\0~\rt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0im��q\0~t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0`$#�q\0~t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~\Zxxpxsq\0~\0E\0\0\0w\0\0\0q\0~\n�q\0~\n�q\0~\n�q\0~\n�q\0~\0q\0~	q\0~\rxsq\0~\n�t\0\nTransitionsq\0~\0h{q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0?�Y�q\0~t\0transition6pq\0~\0sq\0~\0\0q\0~\0sq\0~\0}�y�q\0~t\0approvedpq\0~\n�sq\0~\0q\0~\n�sq\0~\0;��kq\0~t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0<�N�q\0~t\0parallelpt\0	Conditionsq\0~\n�\0q\0~0sq\0~\0;Vs�q\0~t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0\'MUWq\0~1t\0	OTHERWISEsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~5xt\0Descriptionsq\0~\02\0q\0~:sq\0~\0��Fq\0~t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~>sq\0~\07��q\0~t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0��\'q\0~?t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0Y�TEq\0~Dt\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0&!Nq\0~Dt\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~Iq\0~Lxxpxsq\0~\0E\0\0\0w\0\0\0q\0~$q\0~\'q\0~*q\0~-q\0~1q\0~;q\0~?xsq\0~\n�t\0\nTransitionsq\0~\0\nM�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0l�0Bq\0~Qt\0transition7pq\0~\0sq\0~\0\0q\0~\0sq\0~\09�;q\0~Qt\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0LHNq\0~Qt\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\0)O�q\0~Qt\0\rsend_proposalpt\0	Conditionsq\0~\n�\0q\0~bsq\0~\0[4lhq\0~Qt\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0(\rxq\0~cq\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~gxt\0Descriptionsq\0~\02\0q\0~ksq\0~\0H���q\0~Qt\0\0t\0ExtendedAttributessq\0~\0�\0q\0~osq\0~\0jY�q\0~Qt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0o1�xq\0~pt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0K�q:q\0~ut\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0>���q\0~ut\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~zq\0~}xxpxsq\0~\0E\0\0\0w\0\0\0q\0~Vq\0~Yq\0~\\q\0~_q\0~cq\0~lq\0~pxsq\0~\n�t\0\nTransitionsq\0~\0�u#q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0���q\0~�t\0transition8pq\0~\0sq\0~\0\0q\0~\0sq\0~\0x��(q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0h��qq\0~�t\0parallelpq\0~\n�sq\0~\0q\0~\n�sq\0~\0H�i�q\0~�t\0tool1pt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0��pq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0O�rqq\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0|m�q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0@���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\08?\"q\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\00��}q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0G,q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0}w�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0b@v�q\0~�t\0transition5pq\0~\0sq\0~\0\0q\0~\0sq\0~\0=��q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\07�]q\0~�t\0approvalpq\0~\n�sq\0~\0q\0~\n�sq\0~\0\Z䂑q\0~�t\0tool2pt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0S]gq\0~�t\0status===\'rejected\'sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0(�4q\0~�t\0	CONDITIONsq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0���q\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~�sq\0~\0���q\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0.�#Zq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0(��q\0~�t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0^X�q\0~�t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�q\0~�xsq\0~\n�t\0\nTransitionsq\0~\0!�M�q\0~\n~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0%��wq\0~�t\0transition1pq\0~\0sq\0~\0\0q\0~\0sq\0~\06�I�q\0~�t\0\0pq\0~\n�sq\0~\0q\0~\n�sq\0~\0SOq\0~�t\0route1pq\0~\n�sq\0~\0q\0~\n�sq\0~\0.3Pq\0~�t\0approve_proposalpt\0	Conditionsq\0~\n�\0q\0~�sq\0~\0%Ziq\0~�t\0\0sq\0~\0w\0\0\0q\0~\0�sq\0~\0\0q\0~\0�sq\0~\0q���q\0~�q\0~\0Psq\0~\0E\0\0\0w\0\0\0q\0~\0Pq\0~\n�q\0~\n�q\0~\n�q\0~\n�xxsq\0~\0E\0\0\0w\0\0\0q\0~�xt\0Descriptionsq\0~\02\0q\0~�sq\0~\0n��tq\0~�t\0\0t\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0*�\nRq\0~�t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0b7\nq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0@�r�q\0~	t\0JaWE_GRAPH_TRANSITION_STYLEpq\0~�sq\0~\0\0q\0~�sq\0~\0Rq\0~	t\0NO_ROUTING_ORTHOGONALpxsq\0~\0E\0\0\0w\0\0\0q\0~q\0~xxpxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�q\0~�q\0~�q\0~�q\0~\0q\0~xxt\0ExtendedAttributessq\0~\0�\0q\0~sq\0~\0\Z�v8q\0~^t\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0f��Cq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0#��Nq\0~t\0%JaWE_GRAPH_WORKFLOW_PARTICIPANT_ORDERpq\0~�sq\0~\0\0q\0~�sq\0~\0T�q\0~t\0requester;approverpxsq\0~\0E\0\0\0w\0\0\0q\0~!q\0~$xsq\0~�t\0ExtendedAttributesq\0~\0�E\nq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0EN)q\0~(t\0JaWE_GRAPH_START_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0P7Fyq\0~(t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=route1,X_OFFSET=87,Y_OFFSET=28,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=START_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~-q\0~0xsq\0~�t\0ExtendedAttributesq\0~\0C��jq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0M�	q\0~4t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0x&��q\0~4t\0�JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool1,X_OFFSET=901,Y_OFFSET=74,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~9q\0~<xsq\0~�t\0ExtendedAttributesq\0~\0H20q\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0U��q\0~@t\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\08M�;q\0~@t\0�JaWE_GRAPH_PARTICIPANT_ID=requester,CONNECTING_ACTIVITY_ID=send_proposal,X_OFFSET=849,Y_OFFSET=110,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~Eq\0~Hxsq\0~�t\0ExtendedAttributesq\0~\0u�:Nq\0~t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0&�_q\0~Lt\0\ZJaWE_GRAPH_END_OF_WORKFLOWpq\0~�sq\0~\0\0q\0~�sq\0~\0SU�eq\0~Lt\0�JaWE_GRAPH_PARTICIPANT_ID=approver,CONNECTING_ACTIVITY_ID=tool2,X_OFFSET=579,Y_OFFSET=180,JaWE_GRAPH_TRANSITION_STYLE=NO_ROUTING_ORTHOGONAL,TYPE=END_DEFAULTpxsq\0~\0E\0\0\0w\0\0\0q\0~Qq\0~Txxpxsq\0~\0E\0\0\0\rw\0\0\0\rq\0~cq\0~fq\0~jq\0~qq\0~�q\0~�q\0~�q\0~wq\0~}q\0~�q\0~�q\0~\n~q\0~xxt\0ExtendedAttributessq\0~\0�\0q\0~Ysq\0~\0b�Uq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sq\0~�t\0ExtendedAttributesq\0~\0{�j~q\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0�V�q\0~_t\0EDITING_TOOLpq\0~�sq\0~\0\0q\0~�sq\0~\0?!6zq\0~_t\0Web Workflow Designerpxsq\0~\0E\0\0\0w\0\0\0q\0~dq\0~gxsq\0~�t\0ExtendedAttributesq\0~\0K���q\0~Zt\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0SU�zq\0~kt\0EDITING_TOOL_VERSIONpq\0~�sq\0~\0\0q\0~�sq\0~\0@1$Hq\0~kt\0\r5.0-pre-alphapxsq\0~\0E\0\0\0w\0\0\0q\0~pq\0~sxxpxsq\0~\0E\0\0\0\rw\0\0\0\rq\0~\0q\0~\0q\0~\0q\0~\0Iq\0~\0tq\0~\0�q\0~\0�q\0~\0�q\0~\0�q\0~q\0~Qq\0~Xq\0~Zx\0sq\0~\0w\0\0\0\0xt\01sr\0*org.enhydra.shark.xpdl.elements.Namespaces|��<.R��\0\0xq\0~\0kt\0\nNamespacessq\0~\0)U�xq\0~\0\nt\0\0sq\0~\0w\0\0\0\0xsq\0~\0E\0\0\0w\0\0\0sr\0)org.enhydra.shark.xpdl.elements.Namespace�z��_\0\0xq\0~\0t\0	Namespacesq\0~\07##Bq\0~{t\0\0sq\0~\0w\0\0\0q\0~\0sq\0~\0q\0~\0sq\0~\0:�{�q\0~�t\0xpdlpq\0~\0�sq\0~\0q\0~\0�sq\0~\0&\\?�q\0~�t\0 http://www.wfmc.org/2002/XPDL1.0pxsq\0~\0E\0\0\0w\0\0\0q\0~�q\0~�xx',1000202,1,1000203,0);
/*!40000 ALTER TABLE `SHKXPDLData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistory` (
  `XPDLId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `XPDLVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `XPDLHistoryUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistory` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLHistory` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLHistoryData` (
  `XPDLContent` mediumblob NOT NULL,
  `XPDLClassContent` mediumblob NOT NULL,
  `XPDLHistory` decimal(19,0) NOT NULL,
  `CNT` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLHistoryData` (`CNT`),
  KEY `SHKXPDLHistoryData_XPDLHistory` (`XPDLHistory`),
  CONSTRAINT `SHKXPDLHistoryData_XPDLHistory` FOREIGN KEY (`XPDLHistory`) REFERENCES `SHKXPDLHistory` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLHistoryData` WRITE;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLHistoryData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantPackage` (
  `PACKAGE_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantPackage` (`PACKAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLParticipantPackage` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantPackage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLParticipantProcess` (
  `PROCESS_ID` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PACKAGEOID` decimal(19,0) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLParticipantProcess` (`PROCESS_ID`,`PACKAGEOID`),
  KEY `SHKXPDLParticipantProcess_PACKAGEOID` (`PACKAGEOID`),
  CONSTRAINT `SHKXPDLParticipantProcess_PACKAGEOID` FOREIGN KEY (`PACKAGEOID`) REFERENCES `SHKXPDLParticipantPackage` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLParticipantProcess` WRITE;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLParticipantProcess` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLReferences` (
  `ReferredXPDLId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReferringXPDL` decimal(19,0) NOT NULL,
  `ReferredXPDLNumber` int(11) NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLReferences` (`ReferredXPDLId`,`ReferringXPDL`),
  KEY `SHKXPDLReferences_ReferringXPDL` (`ReferringXPDL`),
  CONSTRAINT `SHKXPDLReferences_ReferringXPDL` FOREIGN KEY (`ReferringXPDL`) REFERENCES `SHKXPDLS` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLReferences` WRITE;
/*!40000 ALTER TABLE `SHKXPDLReferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `SHKXPDLReferences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHKXPDLS` (
  `XPDLId` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `XPDLVersion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `XPDLClassVersion` bigint(20) NOT NULL,
  `XPDLUploadTime` datetime NOT NULL,
  `oid` decimal(19,0) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `I1_SHKXPDLS` (`XPDLId`,`XPDLVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `SHKXPDLS` WRITE;
/*!40000 ALTER TABLE `SHKXPDLS` DISABLE KEYS */;
INSERT INTO `SHKXPDLS` VALUES
('crm_community','1',1184650391000,'2022-11-07 11:53:16',1000202,0);
/*!40000 ALTER TABLE `SHKXPDLS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` bit(1) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `license` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_app` WRITE;
/*!40000 ALTER TABLE `app_app` DISABLE KEYS */;
INSERT INTO `app_app` VALUES
('appcenter',1,'App Center','','2022-11-07 11:53:47','2022-11-07 11:53:49','oRIgWuw8ed5OmS98TSZFxocskOFXU0v3VPneM0k80NqSBK2r6RhNzTNTryZkuj4W',NULL,NULL),
('crm_community',1,'CRM Community','','2022-11-07 11:53:07','2022-11-07 11:53:18','Vfe6Df5AdlrGEPqFYgTt8XuGJ4XiTt2NnBLEovw3qoQ=',NULL,NULL);
/*!40000 ALTER TABLE `app_app` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_builder` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `idx_name` (`name`),
  KEY `idx_type` (`type`),
  CONSTRAINT `FK_idup4nrrc79iy4kc46wf5919j` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_builder` WRITE;
/*!40000 ALTER TABLE `app_builder` DISABLE KEYS */;
INSERT INTO `app_builder` VALUES
('appcenter',1,'INTERNAL_TAGGING','Tagging','internal','2022-11-07 11:53:48','2022-11-07 11:53:48','{\n    \"datas\": {\n        \"form\": {},\n        \"list\": {},\n        \"userview\": {\n            \"v\": [\"t07\"],\n            \"v3\": [\"t08\"]\n        }\n    },\n    \"labels\": {\n        \"t01\": {\"color\": \"red\"},\n        \"t02\": {\"color\": \"pink\"},\n        \"t03\": {\"color\": \"orange\"},\n        \"t04\": {\"color\": \"yellow\"},\n        \"t05\": {\"color\": \"green\"},\n        \"t06\": {\"color\": \"lime\"},\n        \"t07\": {\n            \"color\": \"blue\",\n            \"label\": \"Default\"\n        },\n        \"t08\": {\n            \"color\": \"sky\",\n            \"label\": \"Glass\"\n        },\n        \"t09\": {\"color\": \"purple\"},\n        \"t10\": {\"color\": \"black\"}\n    }\n}',NULL),
('appcenter',1,'up-8C70B71371B942B6D48A7E9B4C1DB8D1','Home','INTERNAL_USERVIEW_PAGE','2022-11-07 11:53:48','2022-11-07 11:53:48','{\n\"className\": \"org.joget.apps.userview.model.UserviewPage\",\n\"elements\": [{\n\"className\": \"org.joget.apps.userview.lib.component.ColumnsComponent\",\n\"elements\": [{\n\"className\": \"org.joget.apps.userview.lib.component.ColumnComponent\",\n\"elements\": [\n{\n\"className\": \"org.joget.apps.userview.lib.component.ContainerComponent\",\n\"elements\": [\n{\n\"className\": \"org.joget.apps.userview.lib.component.ContainerComponent\",\n\"elements\": [],\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"customId\": \"assignment_msg\",\n\"id\": \"8358CCF066424B1AF09EBF61A96EAFC5\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {\"hidden\": \"true\"}\n},\n\"style-color\": \"#FFFFFF\",\n\"style-font-size\": \"13px\",\n\"style-margin-bottom\": \"20px\",\n\"style-margin-top\": \"30px\",\n\"style-mobile-margin-bottom\": \"15px\",\n\"style-mobile-margin-top\": \"15px\",\n\"style-text-align\": \"center\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.HeadingComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"customId\": \"clock\",\n\"id\": \"E92400A7CBAD40DC6E28B620D44D34D6\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"style-color\": \"#FFFFFF\",\n\"style-font-size\": \"20px\",\n\"style-line-height\": \"40px\",\n\"style-margin-bottom\": \"0px\",\n\"style-margin-top\": \"0px\",\n\"style-position\": \"absolute\",\n\"style-right\": \"15px\",\n\"style-text-align\": \"left\",\n\"style-top\": \"35px\",\n\"tagName\": \"h3\",\n\"textContent\": \" \"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.ContainerComponent\",\n\"elements\": [\n{\n\"className\": \"org.joget.apps.userview.lib.component.ButtonComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"attr-href\": \"#\",\n\"attr-onclick\": \"appCreate(\'\');\",\n\"css-display-type\": \"btn btn-light\",\n\"customId\": \"\",\n\"id\": \"8EFC9D21190A4BFBE31A945826FF6B34\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"style-color\": \"#7E8299\",\n\"style-font-weight\": \"500\",\n\"style-margin-right\": \"10px\",\n\"textContent\": \"#i18n.Design New App#\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.ButtonComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"attr-href\": \"#\",\n\"attr-onclick\": \"appImport();return false;\",\n\"css-display-type\": \"btn btn-light\",\n\"customId\": \"\",\n\"id\": \"10862931081E4DF47D44CCDFC696CAD6\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"style-color\": \"#7E8299\",\n\"style-font-weight\": \"500\",\n\"style-margin-right\": \"15px\",\n\"textContent\": \"#i18n.Import App#\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.ButtonComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"attr-href\": \"#\",\n\"attr-onclick\": \"AdminBar.showQuickOverlay(\\\"#request.contextPath#/web/desktop/marketplace/app?url=\\\" + encodeURIComponent(\\\"#platform.marketplaceUrl#\\\"));return false\",\n\"css-display-type\": \"btn btn-light\",\n\"customId\": \"\",\n\"id\": \"07863BFB349747ED1A6E45812F7C5F97\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"style-color\": \"#7E8299\",\n\"style-font-weight\": \"500\",\n\"textContent\": \"#i18n.Download from Marketplace#\"\n}\n}\n],\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"customId\": \"\",\n\"hidden\": \"true\",\n\"id\": \"96141190357145C9478235142772AEC5\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {\"hidden\": \"\"},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {\"hidden\": \"true\"}\n},\n\"style-margin-bottom\": \"10px\",\n\"style-text-align\": \"center\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.ScriptComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"customId\": \"\",\n\"id\": \"66465E19B19A4481B8BD32BD9BBC0D83\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"script\": \"$(function(){\\n    window[\\\"ajaxContentPlaceholder\\\"][\\\"#request.contextPath#/web/userview/appcenter/v/_/home\\\"] = \\\"dashboard\\\";\\n    \\n    var updateClock = function(clock, day){\\n        var date = new Date();\\n        var ampm = date.getHours() < 12 ? \'AM\' : \'PM\';\\n        var hours = date.getHours() == 0\\n                  ? 12\\n                  : date.getHours() > 12\\n                    ? date.getHours() - 12\\n                    : date.getHours();\\n        var minutes = date.getMinutes() < 10 \\n                    ? \'0\' + date.getMinutes() \\n                    : date.getMinutes();\\n        var style = $(clock).find(\\\"style\\\"); \\n        var dstyle = $(day).find(\\\"style\\\"); \\n        $(clock).text(hours + \\\":\\\" + minutes + \\\" \\\" + ampm);\\n        $(day).text(date.toLocaleDateString(\\\"en-US\\\", { weekday: \'long\', year: \'numeric\', month: \'long\', day: \'numeric\' }));\\n        $(clock).append(style);\\n        $(day).append(dstyle);\\n    };\\n    \\n    var clock = $(\\\"#clock\\\");\\n    var day = $(\\\"#date\\\")\\n    if (clock.length > 0) {\\n        updateClock(clock, day);\\n        window.setInterval(function() {\\n            updateClock(clock, day);\\n        }, 10000);\\n    }\\n    \\n    $(\\\".inbox-notification\\\").off(\\\"inbox_notification_updated\\\");\\n    $(\\\".inbox-notification\\\").on(\\\"inbox_notification_updated\\\", function(){\\n        var style = $(\\\"#assignment_msg\\\").find(\\\"style\\\");        \\n        $(\\\"#assignment_msg\\\").html(\'<h3 style=\\\"color:#fff;\\\">Hello #currentUser.firstName#, <\\/h3><a style=\\\"color:#fff;opacity: 0.75 !important;\\\" href=\\\"#request.baseURL#/web/userview/appcenter/home/_/_ja_inbox\\\"><h5>\' + $(\\\".inbox-notification .dropdown-menu-title span\\\").text() + \'<h5><\\/a>\');\\n        $(\\\"#assignment_msg\\\").append(style);\\n    });\\n    \\n    $(\\\".inbox-notification\\\").trigger(\\\"inbox_notification_updated\\\");\\n});\"\n}\n}\n],\n\"properties\": {\n\"attr-data-events-triggering\": [],\n\"customId\": \"inbox_container\",\n\"id\": \"970F3C4619204E5D5F9253C3A2B9D8A3\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.HeadingComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"customId\": \"\",\n\"id\": \"41B14E1F2C034F11E6F29E4A157C3FEC\",\n\"style-color\": \"#FFFFFF\",\n\"style-left\": \"30px\",\n\"style-position\": \"absolute\",\n\"style-top\": \"15px\",\n\"tagName\": \"h1\",\n\"textContent\": \"<i class=\\\"zmdi zmdi-apps\\\"><\\/i> App Center\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.component.HeadingComponent\",\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"customId\": \"date\",\n\"id\": \"681B2A6A3E604CDA411A34255B7BD9E3\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n},\n\"style-color\": \"#FFFFFF\",\n\"style-font-size\": \"20px\",\n\"style-position\": \"absolute\",\n\"style-right\": \"15px\",\n\"style-text-align\": \"center\",\n\"style-top\": \"15px\",\n\"tagName\": \"h6\",\n\"textContent\": \" \"\n}\n},\n{\n\"className\": \"menu-component\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n}\n}\n],\n\"properties\": {\n\"style-custom\": \"padding:20px;\",\n\"style-flex\": \"0 0 100%\",\n\"style-max-width\": \"100%\",\n\"style-mobile-padding-top\": \"80px\"\n}\n}],\n\"properties\": {\n\"attr-data-events-listening\": [],\n\"attr-data-events-triggering\": [],\n\"col-0-style-custom\": \"padding:20px;\",\n\"col-0-style-mobile-padding-top\": \"80px\",\n\"col-1-style-custom\": \"padding:80px 80px 40px 20px;\",\n\"col-1-style-mobile-custom\": \"padding: 0px 20px 20px;\",\n\"col-1-style-tablet-custom\": \"padding:80px 40px 40px 20px;\",\n\"columns\": [{\n\"style-max-width\": \"100%\",\n\"style-mobile-max-width\": \"\",\n\"style-tablet-max-width\": \"\"\n}],\n\"css-mobile-stack-columns\": \"true\",\n\"customId\": \"home_column\",\n\"gutter\": \"\",\n\"id\": \"74DC9C5E101D4BB4D955B3B9C5FE48D3\",\n\"permission_rules\": {\n\"58F9FBEA76264BE037991759BC1645A2\": {},\n\"F6E97C06864E4F62843B259A8C9AB1AD\": {}\n}\n}\n}],\n\"properties\": {\"id\": \"up-8C70B71371B942B6D48A7E9B4C1DB8D1\"}\n}',NULL);
/*!40000 ALTER TABLE `app_builder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_datalist` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK5E9247A6462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK5E9247A6462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_datalist` WRITE;
/*!40000 ALTER TABLE `app_datalist` DISABLE KEYS */;
INSERT INTO `app_datalist` VALUES
('appcenter',1,'applist','App List',NULL,'{\"actions\":[],\"binder\":{\"className\":\"org.joget.apps.datalist.lib.JsonApiDatalistBinder\",\"properties\":{\"copyCookies\":\"true\",\"debugMode\":\"\",\"handlePaging\":\"true\",\"headers\":[],\"jsonUrl\":\"#request.baseURL#\\/web\\/json\\/apps\\/published\\/userviews?appCenter=true\",\"multirowBaseObject\":\"apps.userviews\",\"primaryKey\":\"id\",\"requestType\":\"\",\"totalRowCountObject\":\"\"}},\"card-style-background-color\":\"#F5F8FA\",\"card-style-border-radius\":\"10px\",\"card-style-border-width\":\"0px\",\"card-style-hover-background-color\":\"#F5F8FA\",\"card-style-hover-border-color\":\"#FFFFFF\",\"card-style-hover-custom\":\"transition: all 0.2s ease-out;\\r\\nbox-shadow: 0px 4px 8px rgba(38, 38, 38, 0.2);\\r\\ntop: -5px;\\r\\nborder: 1px solid #cccccc;\\r\\nbackground-color: white;\",\"card-style-max-height\":\"200px\",\"card-style-min-height\":\"200px\",\"card-style-padding-bottom\":\"0px\",\"card-style-padding-left\":\"0px\",\"card-style-padding-right\":\"0px\",\"card-style-padding-top\":\"15px\",\"card-style-text-align\":\"center\",\"column_image\":[{\"action\":{\"className\":\"\",\"properties\":{}},\"alignment\":\"\",\"datalist_type\":\"column\",\"exclude_export\":\"true\",\"filterable\":true,\"format\":{\"className\":\"org.joget.apps.datalist.lib.ImageFormatter\",\"properties\":{\"defaultImage\":\"#request.baseURL#\\/web\\/userview\\/screenshot\\/appcenter\\/v\",\"height\":\"80px\",\"imageSrc\":\"\",\"imagefullsize\":\"\",\"width\":\"80px\"}},\"headerAlignment\":\"\",\"hidden\":\"false\",\"id\":\"column_0\",\"include_export\":\"\",\"label\":\"imageUrl\",\"name\":\"imageUrl\",\"permission_rules\":{\"9D3F667778064DF2976BDBE2C629EA8D\":{\"exclude_export\":\"true\",\"hidden\":\"false\",\"include_export\":\"\"}},\"renderHtml\":\"\",\"sortable\":\"false\",\"style\":\"\",\"style-border-color\":\"rgba(255, 255, 255, 0.55)\",\"style-float\":\"left\",\"width\":\"\"}],\"column_title\":[{\"action\":{\"className\":\"\",\"properties\":{}},\"alignment\":\"\",\"datalist_type\":\"column\",\"exclude_export\":\"\",\"filterable\":true,\"format\":{\"className\":\"org.joget.apps.datalist.lib.ImageFormatter\",\"properties\":{\"defaultImage\":\"#request.baseURL#\\/web\\/userview\\/screenshot\\/appcenter\\/v\",\"height\":\"90px\",\"imageSrc\":\"\",\"imagefullsize\":\"\",\"width\":\"90px\"}},\"headerAlignment\":\"\",\"hidden\":\"false\",\"id\":\"column_0\",\"label\":\"imageUrl\",\"name\":\"imageUrl\",\"permission_rules\":{\"9D3F667778064DF2976BDBE2C629EA8D\":{\"exclude_export\":\"true\",\"hidden\":\"false\",\"include_export\":\"\"}},\"renderHtml\":\"\",\"sortable\":\"false\",\"style\":\"\",\"style-border-radius\":\"10px\",\"width\":\"\"}],\"columns\":[{\"action\":{\"className\":\"\",\"properties\":{}},\"alignment\":\"\",\"datalist_type\":\"column\",\"exclude_export\":\"\",\"filterable\":true,\"format\":{\"className\":\"\",\"properties\":{}},\"headerAlignment\":\"\",\"hidden\":\"false\",\"id\":\"column_1\",\"label\":\"apps.name\",\"name\":\"apps.name\",\"permission_rules\":{\"9D3F667778064DF2976BDBE2C629EA8D\":{\"exclude_export\":\"true\",\"hidden\":\"false\",\"include_export\":\"\"}},\"renderHtml\":\"\",\"sortable\":\"false\",\"style\":\"\",\"style-color\":\"#495057\",\"style-custom\":\"text-overflow: ellipsis;\\noverflow: hidden;\\ndisplay: -webkit-box;\\n-webkit-line-clamp: 2;\\n-webkit-box-orient: vertical;\",\"style-font-size\":\"16px\",\"style-font-weight\":\"500\",\"width\":\"\"}],\"considerFilterWhenGetTotal\":\"\",\"description\":\"\",\"disableResponsive\":\"\",\"filters\":[],\"hidePageSize\":\"true\",\"id\":\"applist\",\"name\":\"App List\",\"order\":\"2\",\"orderBy\":\"name\",\"pageSize\":\"100\",\"pageSizeSelectorOptions\":\"10\",\"permission_rules\":[{\"permission\":{\"className\":\"org.joget.plugin.enterprise.AdminUserviewPermission\",\"properties\":{}},\"permission_key\":\"9D3F667778064DF2976BDBE2C629EA8D\",\"permission_name\":\"Is Admin\"}],\"responsiveMode\":\"\",\"rowAction_card\":[{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"id\":\"rowAction_2\",\"properties\":{\"confirmation\":\"\",\"datalist_type\":\"row_action\",\"header_label\":\"\",\"href\":\"#request.baseURL#\\/web\\/userview\",\"hrefColumn\":\"apps.id;id\",\"hrefParam\":\";\",\"label\":\"Hyperlink\",\"link-css-display-type\":\"btn btn-sm btn-primary\",\"rules\":[],\"target\":\"_blank\"}}],\"rowActions\":[{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"hidden\":\"true\",\"id\":\"rowAction_0\",\"label\":\"Hyperlink\",\"permission_rules\":{\"9D3F667778064DF2976BDBE2C629EA8D\":{\"hidden\":\"\"}},\"properties\":{\"confirmation\":\"\",\"datalist_type\":\"row_action\",\"header_label\":\"\",\"href\":\"#request.baseURL#\\/web\\/console\\/app\",\"hrefColumn\":\"apps.id;apps.version;builders\",\"hrefParam\":\";;\",\"label\":\"<i class=\\\"fas fa-pen\\\"><\\/i> \",\"link-css-display-type\":\"btn btn-sm btn-primary\",\"permission_rules\":{\"9D3F667778064DF2976BDBE2C629EA8D\":{}},\"rules\":[],\"style-border-radius\":\"50%\",\"style-custom\":\"transition: 0.2s display ease-in-out;\",\"style-display\":\"none\",\"style-height\":\"30px\",\"style-position\":\"absolute\",\"style-right\":\"10px\",\"style-top\":\"10px\",\"style-width\":\"30px\",\"target\":\"_blank\"}}],\"rowActionsMode\":\"\",\"searchPopup\":\"\",\"showDataWhenFilterSet\":\"\",\"template\":{\"className\":\"org.joget.apps.datalist.lib.SimpleCardTemplate\",\"properties\":{\"cardAction\":\"true\",\"columns_desktop\":\"col-lg-2\",\"columns_mobile\":\"col-12\",\"columns_tablet\":\"col-md-6\",\"footerMsg\":\"true\",\"image\":\"\",\"inlineLabel\":\"\"}},\"useSession\":\"\"}','2022-11-07 11:53:48','2022-11-07 11:53:48'),
('crm_community',1,'crm_account_list','Account Listing',NULL,'{\"id\":\"crm_account_list\",\"name\":\"Account Listing\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"\",\"considerFilterWhenGetTotal\":\"\",\"hidePageSize\":\"\",\"description\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[{\"id\":\"rowAction_0\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_list\",\"target\":\"_self\",\"hrefParam\":\"d-6304176-fn_account\",\"hrefColumn\":\"id\",\"label\":\"Contacts\",\"confirmation\":\"\",\"visible\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"},{\"id\":\"rowAction_1\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"type\":\"text\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"fk_account\",\"hrefColumn\":\"id\",\"label\":\"New Contact\",\"confirmation\":\"\"},\"name\":\"Data List Hyperlink\",\"label\":\"Hyperlink\"}],\"actions\":[{\"name\":\"Data List Hyperlink Action\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"label\":\"Hyperlink\",\"type\":\"text\",\"id\":\"action_1\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"label\":\"Add Account\",\"confirmation\":\"\",\"visible\":\"true\",\"datalist_type\":\"action\"}},{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_account\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_0\",\"label\":\"Account Name\",\"name\":\"accountName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_account\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"id\",\"label\":\"ID\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"ID\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_1\",\"name\":\"accountName\",\"label\":\"Account Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_5\",\"name\":\"country\",\"label\":\"Country\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_4\",\"name\":\"state\",\"label\":\"State\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}]}','2022-11-07 11:53:14','2022-11-07 11:53:14'),
('crm_community',1,'crm_contact_list','Contact List',NULL,'{\"id\":\"crm_contact_list\",\"name\":\"Contact List\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"\",\"considerFilterWhenGetTotal\":\"\",\"hidePageSize\":\"\",\"description\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[],\"actions\":[{\"name\":\"Data List Hyperlink Action\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"label\":\"Hyperlink\",\"type\":\"text\",\"id\":\"action_1\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"label\":\"Add Contact\",\"confirmation\":\"\",\"visible\":\"true\",\"datalist_type\":\"action\"}},{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_contact\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_2\",\"name\":\"account\",\"filterParamName\":\"d-6304176-fn_account\",\"label\":\"Account\",\"type\":{\"className\":\"\",\"properties\":{}},\"datalist_type\":\"filter\",\"hidden\":\"\"},{\"id\":\"filter_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"type\":{\"className\":\"org.joget.apps.datalist.lib.TextFieldDataListFilterType\",\"properties\":{\"defaultValue\":\"\"}},\"filterParamName\":\"d-6304176-fn_fullName\"},{\"id\":\"filter_1\",\"label\":\"Last Name\",\"name\":\"lastName\",\"filterParamName\":\"d-6304176-fn_lastName\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_contact\"}},\"columns\":[{\"id\":\"column_2\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}},\"datalist_type\":\"column\",\"renderHtml\":\"\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\"},{\"id\":\"column_0\",\"name\":\"fullName\",\"label\":\"First Name\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"contact_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Full Name\",\"confirmation\":\"\",\"visible\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"lastName\",\"label\":\"Last Name\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}],\"template\":{\"className\":\"\",\"properties\":{}}}','2022-11-07 11:53:14','2022-11-07 11:53:14'),
('crm_community',1,'crm_opportunity_list','Opportunity List',NULL,'{\"id\":\"crm_opportunity_list\",\"name\":\"Opportunity List\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"dateCreated\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"\",\"considerFilterWhenGetTotal\":\"\",\"hidePageSize\":\"\",\"description\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[],\"actions\":[{\"name\":\"Data List Hyperlink Action\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"label\":\"Hyperlink\",\"type\":\"text\",\"id\":\"action_1\",\"properties\":{\"href\":\"opportunity_new\",\"target\":\"_self\",\"hrefParam\":\"\",\"hrefColumn\":\"\",\"label\":\"Add Opportunity\",\"confirmation\":\"\",\"visible\":\"true\",\"datalist_type\":\"action\"}},{\"id\":\"action_0\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"type\":\"text\",\"properties\":{\"formDefId\":\"crm_opportunity\"},\"name\":\"Form Row Delete\",\"label\":\"Delete Row\"}],\"filters\":[{\"id\":\"filter_1\",\"name\":\"account\",\"label\":\"Account\",\"type\":{\"className\":\"\",\"properties\":{}},\"filterParamName\":\"d-4412661-fn_account\",\"datalist_type\":\"filter\",\"hidden\":\"\"},{\"id\":\"filter_0\",\"label\":\"Title\",\"name\":\"title\",\"filterParamName\":\"d-4412661-fn_title\"}],\"binder\":{\"name\":\"\",\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_opportunity\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"opportunity_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"Title\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_4\",\"name\":\"account\",\"label\":\"Account\",\"sortable\":\"true\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"account_new\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"account\",\"label\":\"Account\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}},\"datalist_type\":\"column\",\"renderHtml\":\"\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\"},{\"id\":\"column_2\",\"name\":\"amount\",\"label\":\"Amount\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_3\",\"name\":\"stage\",\"label\":\"Stage\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"},{\"id\":\"column_1\",\"name\":\"dateModified\",\"label\":\"Date Modified\",\"sortable\":\"true\",\"filterable\":\"true\",\"action\":\"\",\"formats\":\";\"}],\"template\":{\"className\":\"\",\"properties\":{}}}','2022-11-07 11:53:14','2022-11-07 11:53:14'),
('crm_community',1,'Proposal','Proposal List',NULL,'{\"id\":\"Proposal\",\"name\":\"Proposal List\",\"pageSize\":\"0\",\"order\":\"1\",\"orderBy\":\"refNo\",\"showPageSizeSelector\":\"true\",\"pageSizeSelectorOptions\":\"10,20,30,40,50,100\",\"buttonPosition\":\"bottomLeft\",\"checkboxPosition\":\"left\",\"useSession\":\"\",\"considerFilterWhenGetTotal\":\"\",\"hidePageSize\":\"\",\"description\":\"\",\"showDataWhenFilterSet\":\"\",\"rowActions\":[],\"actions\":[{\"name\":\"Data List Hyperlink Action\",\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"label\":\"Hyperlink\",\"type\":\"text\",\"id\":\"action_0\",\"properties\":{\"href\":\"proposal_process\",\"target\":\"_self\",\"label\":\"Submit New Proposal\",\"confirmation\":\"\",\"visible\":\"true\",\"datalist_type\":\"action\"}},{\"name\":\"Form Row Delete Action\",\"className\":\"org.joget.apps.datalist.lib.FormRowDeleteDataListAction\",\"label\":\"Delete\",\"type\":\"text\",\"id\":\"action_1\",\"properties\":{\"label\":\"Delete\",\"formDefId\":\"crm_proposal_form\",\"confirmation\":\"Are you sure?\",\"deleteGridData\":\"true\",\"deleteSubformData\":\"true\",\"deleteFiles\":\"true\",\"abortRelatedRunningProcesses\":\"true\",\"datalist_type\":\"action\"}}],\"filters\":[{\"id\":\"filter_2\",\"name\":\"account\",\"label\":\"Account\",\"filterParamName\":\"d-3959580-fn_account\",\"datalist_type\":\"filter\",\"type\":{\"className\":\"\",\"properties\":{}},\"hidden\":\"\"},{\"id\":\"filter_1\",\"name\":\"title\",\"label\":\"Title\",\"filterParamName\":\"d-3959580-fn_title\"},{\"id\":\"filter_0\",\"name\":\"status\",\"label\":\"Status\",\"filterParamName\":\"d-3959580-fn_status\"}],\"binder\":{\"className\":\"org.joget.apps.datalist.lib.FormRowDataListBinder\",\"properties\":{\"formDefId\":\"crm_proposal_approval_form\",\"extraCondition\":\"\"}},\"columns\":[{\"id\":\"column_0\",\"name\":\"refNo\",\"label\":\"#\",\"sortable\":\"false\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_1\",\"label\":\"Account\",\"displayLabel\":\"Account\",\"name\":\"account\",\"datalist_type\":\"column\",\"sortable\":\"false\",\"renderHtml\":\"\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\",\"action\":{\"className\":\"\",\"properties\":{}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_2\",\"datalist_type\":\"column\",\"name\":\"title\",\"label\":\"Title\",\"sortable\":\"false\",\"hidden\":\"false\",\"exclude_export\":\"\",\"width\":\"\",\"style\":\"\",\"alignment\":\"\",\"headerAlignment\":\"\",\"action\":{\"className\":\"org.joget.apps.datalist.lib.HyperlinkDataListAction\",\"properties\":{\"href\":\"ViewProposal\",\"target\":\"_self\",\"hrefParam\":\"id\",\"hrefColumn\":\"id\",\"label\":\"View\",\"confirmation\":\"\"}},\"format\":{\"className\":\"\",\"properties\":{}}},{\"id\":\"column_3\",\"label\":\"Description\",\"displayLabel\":\"Description\",\"name\":\"description\"},{\"id\":\"column_4\",\"label\":\"Status\",\"displayLabel\":\"Status\",\"name\":\"status\"},{\"id\":\"column_5\",\"label\":\"Date Modified\",\"displayLabel\":\"Date Modified\",\"name\":\"dateModified\"}],\"template\":{\"className\":\"\",\"properties\":{}}}','2022-11-07 11:53:14','2022-11-07 11:53:14');
/*!40000 ALTER TABLE `app_datalist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_env_variable` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK740A62EC462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK740A62EC462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_env_variable` WRITE;
/*!40000 ALTER TABLE `app_env_variable` DISABLE KEYS */;
INSERT INTO `app_env_variable` VALUES
('appcenter',1,'appCenter_APMData','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport java.sql.Statement;\nimport java.util.Date;\nimport javax.sql.DataSource;\nimport org.apache.http.HttpResponse;\nimport org.apache.http.client.methods.HttpGet;\nimport org.apache.http.client.methods.HttpRequestBase;\nimport org.apache.http.impl.client.CloseableHttpClient;\nimport org.apache.http.impl.client.HttpClientBuilder;\nimport org.apache.http.impl.client.HttpClients;\nimport org.apache.http.util.EntityUtils;\nimport org.joget.apm.APMUtil;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\nimport org.json.JSONObject;\nimport org.joget.commons.util.ServerUtil;\nimport org.json.JSONArray;\n\n     Date date = new Date();\n     long duration = 240*60000;\n     long to = date.getTime();\n     long from = to - duration;\n     String node;\n     String apm;\n     int count;\n     String apmType;\n    try {\n      node = ServerUtil.getServerName();\n      apm = APMUtil.getSummaries(\"#request.serverName#\", \"\", from, to, node);\n      JSONArray c = new JSONArray(apm);\n        for (int i = 0 ; i < c.length(); i++) {\n            JSONObject obj = c.getJSONObject(i);\n            if (type != null && type.length == 1 && type[0].equals(\"throughtput\")) {\n                apmType = \"transactionCount\";\n            } else {\n                apmType = type[0];\n            }\n            count = count + Integer.parseInt(obj.getString(apmType));\n        }\n        if (type != null && type.length == 1 && type[0].equals(\"throughtput\")) {\n           int throughput = 60 * 1000 * TotaltransactionCount;\n           count = Math.round(((throughput/duration)*100.0)/100.0);\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_APMData\", ex, \"\");\n    }\n    return String.valueOf(count);',NULL),
('appcenter',1,'appCenter_AppCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport java.util.ArrayList;\nimport java.util.List;\nimport org.joget.commons.util.LogUtil;\n\nConnection con = null;\nString appCount = \"\";\nString publishedApp = \"\";\nString sql;\n\ntry {\n  DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n  con = ds.getConnection();\n\n  if (!con.isClosed()) {\n    sql = \"SELECT COUNT(DISTINCT(appId)) FROM app_app\";\n    PreparedStatement stmt = con.prepareStatement(sql);\n    ResultSet rs = stmt.executeQuery();\n\n    while (rs.next()) {\n      appCount = rs.getString(1);\n    }\n    if (chart != null && chart.length == 1 && chart[0].equals(\"true\")) {\n      String sql2 = \"SELECT COUNT(DISTINCT(appId)) FROM app_app WHERE published=1\";\n      PreparedStatement stmt2 = con.prepareStatement(sql2);\n      ResultSet rs2 = stmt2.executeQuery();\n\n      while (rs2.next()) {\n        publishedApp = rs2.getString(1);\n      }\n      int unpublishApp = Integer.parseInt(appCount) - Integer.parseInt(publishedApp);\n      appCount = publishedApp+ \", \" +String.valueOf(unpublishApp);\n    }\n  }\n} catch (Exception ex) {\n  LogUtil.error(\"appCenter_AppCount\", ex, \"\");\n} finally {\n  try {\n    if (con != null) {\n      con.close();\n    }\n  } catch (Exception ex) {\n    LogUtil.error(\"appCenter_AppCount\", ex, \"\");\n  }\n}\nreturn appCount;',NULL),
('appcenter',1,'appCenter_datalistCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport java.util.ArrayList;\nimport java.util.List;\nimport org.joget.commons.util.LogUtil;\n\n    Connection con = null;\n    int datalistCount = 0;\n    String appName = \"\";\n    String eachdatalistCount = \"\";\n    String result;\n     \n    try {\n        DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n        con = ds.getConnection();\n        if(!con.isClosed()) {\n            String sql = \"SELECT appId, name, appVersion from app_app WHERE published = 1\";\n            PreparedStatement stmt = con.prepareStatement(sql);\n            ResultSet rs = stmt.executeQuery();\n            \n            while (rs.next()) {\n               if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                    if (appName.isEmpty()){\n                        appName = rs.getString(2);\n                    } else {\n                        appName += \",\" + rs.getString(2);\n                    }\n                } else {\n                    String sql2 = \"SELECT COUNT(id) FROM app_datalist WHERE appId = ? AND appVersion = ?\";\n                    PreparedStatement stmt2 = con.prepareStatement(sql2);\n                    stmt2.setString(1, rs.getString(1));\n                    stmt2.setString(2, rs.getString(3));\n                    ResultSet rs2 = stmt2.executeQuery();\n                \n                    while (rs2.next()) {\n                      if (eachdatalistCount.isEmpty()){\n                        eachdatalistCount = rs2.getString(1);\n                      } else {\n                        eachdatalistCount += \",\" + rs2.getString(1);\n                      }\n                      datalistCount+=Integer.parseInt(rs2.getString(1));\n                    }\n                }\n            }\n            \n            if (chart != null && chart.length == 1 && chart[0].equals(\"data\")) {\n                result = eachdatalistCount;\n            } else if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                result = appName;\n            } else {\n                result = String.valueOf(datalistCount);\n            }\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_datalistCount\", ex, \"\");\n    } finally {\n        try {\n            if (con != null) {\n                con.close();\n            }\n        } catch (Exception ex) {\n            LogUtil.error(\"appCenter_datalistCount\", ex, \"\");\n        }\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_formCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\nimport java.util.ArrayList;\nimport java.util.List;\n\n    Connection con = null;\n    int formCount = 0;\n    String appName = \"\";\n    String eachformCount = \"\";\n    String result;\n     \n    try {\n        DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n        con = ds.getConnection();\n        if(!con.isClosed()) {\n            String sql = \"SELECT appId, name, appVersion from app_app WHERE published = 1\";\n            PreparedStatement stmt = con.prepareStatement(sql);\n            ResultSet rs = stmt.executeQuery();\n            \n            while (rs.next()) {\n               if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                    if (appName.isEmpty()){\n                        appName = rs.getString(2);\n                    } else {\n                        appName += \",\" + rs.getString(2);\n                    }\n                } else {\n                    String sql2 = \"SELECT COUNT(formId) FROM app_form WHERE appId = ? AND appVersion = ?\";\n                    PreparedStatement stmt2 = con.prepareStatement(sql2);\n                    stmt2.setString(1, rs.getString(1));\n                    stmt2.setString(2, rs.getString(3));\n                    ResultSet rs2 = stmt2.executeQuery();\n                \n                    while (rs2.next()) {\n                      if (eachformCount.isEmpty()){\n                        eachformCount = rs2.getString(1);\n                      } else {\n                        eachformCount += \",\" + rs2.getString(1);\n                      }\n                      formCount+=Integer.parseInt(rs2.getString(1));\n                    }\n                }\n            }\n            \n            if (chart != null && chart.length == 1 && chart[0].equals(\"data\")) {\n                result = eachformCount;\n            } else if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                result = appName;\n            } else {\n                result = String.valueOf(formCount);\n            }\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_formCount\", ex, \"\");\n    } finally {\n        try {\n            if (con != null) {\n                con.close();\n            }\n        } catch (Exception ex) {\n            LogUtil.error(\"appCenter_formCount\", ex, \"\");\n        }\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_ghc','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\nimport org.joget.apps.app.service.AppService;\nimport org.joget.governance.service.GovHealthCheckManager;\nimport java.util.ArrayList;\nimport java.util.List;\nimport org.json.JSONObject;\n\n    String result = \"0\";\n    int count;\n    try {\n      AppService appService = (AppService) AppUtil.getApplicationContext().getBean(\"appService\");\n      GovHealthCheckManager govHealthCheckManager = (GovHealthCheckManager) AppUtil.getApplicationContext().getBean(\"govHealthCheckManager\");\n      String json = govHealthCheckManager.getLastResultsJson();\n      if (chart != null && chart.length == 1 && !chart[0].isEmpty() && json != null && !json.isEmpty()) {\n            JSONObject json = new JSONObject(json);\n            JSONObject check = json.getJSONObject(chart[0]);\n            result = check.getString(\"score\");\n      }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_ghc\", ex, \"\");\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_ghcStatus','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.commons.util.LogUtil;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.apps.app.service.AppService;\nimport org.joget.workflow.model.service.WorkflowManager;\nimport org.joget.governance.service.GovHealthCheckManager;\nimport org.json.JSONObject;\n\n    String result;\n    int count;\n    try {\n      AppService appService = (AppService) AppUtil.getApplicationContext().getBean(\"appService\");\n      GovHealthCheckManager govHealthCheckManager = (GovHealthCheckManager) AppUtil.getApplicationContext().getBean(\"govHealthCheckManager\");\n      String json = govHealthCheckManager.getLastResultsJson();\n      if (chart != null && chart.length == 1 && !chart[0].isEmpty()) {\n            JSONObject json = new JSONObject(json);\n            JSONObject check = json.getJSONObject(chart[0]);\n            result = json.toString();\n      }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_ghcStatus\", ex, \"\");\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_groupCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\nimport java.util.ArrayList;\nimport java.util.List;\n\n    Connection con = null;\n    int groupCount = 0;\n    String groupName = \"\";\n    String eachGroupCount = \"\";\n    String result;\n     \n    try {\n        DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n        con = ds.getConnection();\n        if(!con.isClosed()) {\n            String sql = \"select g.name, count(ug.userId) from dir_group g left join dir_user_group ug on g.id=ug.groupId group by g.name\";\n            PreparedStatement stmt = con.prepareStatement(sql);\n            ResultSet rs = stmt.executeQuery();\n         \n            while (rs.next()) {\n                if (chart != null && chart.length == 1 && chart[0].equals(\"data\")) {\n                    int len = rs.getInt(2);\n                    if (eachGroupCount.isEmpty()){\n                        eachGroupCount = String.valueOf(len);\n                    } else {\n                        eachGroupCount += \",\" + String.valueOf(len);\n                    }\n                } else if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                    if (groupName.isEmpty()){\n                        groupName = rs.getString(1);\n                    } else {\n                        groupName += \",\" + rs.getString(1);\n                    }\n                } else {\n                    groupCount+=1;\n                }\n            }\n            if (chart != null && chart.length == 1 && chart[0].equals(\"data\")) {\n                result = eachGroupCount;\n            } else if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                result = groupName;\n            } else {\n                result = String.valueOf(groupCount);\n            }\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_groupCount\", ex, \"\");\n    } finally {\n        try {\n            if (con != null) {\n                con.close();\n            }\n        } catch (Exception ex) {\n            LogUtil.error(\"appCenter_groupCount\", ex, \"\");\n        }\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_nodeCount','import org.joget.commons.util.ServerUtil;\n\nreturn ServerUtil.getActiveServerList().length.toString();',NULL),
('appcenter',1,'appCenter_processCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\nimport org.joget.apps.app.service.AppService;\nimport org.joget.workflow.model.service.WorkflowManager;\n\n    String result;\n    int count;\n    try {\n      AppService appService = (AppService) AppUtil.getApplicationContext().getBean(\"appService\");\n      WorkflowManager workflowManager = (WorkflowManager) AppUtil.getApplicationContext().getBean(\"workflowManager\");\n      if (chart != null && chart.length == 1 && chart[0].equals(\"completed\")) {\n        count = workflowManager.getCompletedProcessSize(null, null, null, null, null, null);\n      } else{\n        count = workflowManager.getRunningProcessSize(null, null, null, null, null, null);\n      }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_processCount\", ex, \"\");\n    }\n    return count.toString();',NULL),
('appcenter',1,'appCenter_UserCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\n\n    Connection con = null;\n    int userCount = 0;\n    int activeUser = 0;\n    int inactiveUser = 0;\n    String result;\n     \n    try {\n        DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n        con = ds.getConnection();\n        if(!con.isClosed()) {\n            String sql = \"SELECT id, active FROM dir_user\";\n            PreparedStatement stmt = con.prepareStatement(sql);\n            ResultSet rs = stmt.executeQuery();\n         \n            while (rs.next()) {\n                if (chart != null && chart.length == 1 && chart[0].equals(\"true\")) {\n                    if(rs.getString(2).equals(\"0\")){\n                        inactiveUser+=1;\n                    } else {\n                        activeUser+=1;\n                    }\n                } else {\n                    userCount+=1;\n                }\n            }\n            if (chart != null && chart.length == 1 && chart[0].equals(\"true\")) {\n                result = String.valueOf(activeUser) +\",\"+ String.valueOf(inactiveUser);\n            } else {\n                result = String.valueOf(userCount);\n            }\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_UserCount\", ex, \"\");\n    } finally {\n        try {\n            if (con != null) {\n                con.close();\n            }\n        } catch (Exception ex) {\n            LogUtil.error(\"appCenter_UserCount\", ex, \"\");\n        }\n    }\n    return result;',NULL),
('appcenter',1,'appCenter_userviewCount','import java.sql.Connection;\nimport java.sql.PreparedStatement;\nimport java.sql.ResultSet;\nimport java.sql.SQLException;\nimport javax.sql.DataSource;\nimport org.joget.apps.app.service.AppUtil;\nimport org.joget.commons.util.LogUtil;\n\n    Connection con = null;\n    int userviewCount = 0;\n    String appName = \"\";\n    String eachUserviewCount = \"\";\n    String result;\n     \n    try {\n        DataSource ds = (DataSource) AppUtil.getApplicationContext().getBean(\"setupDataSource\");\n        con = ds.getConnection();\n        if(!con.isClosed()) {\n            String sql = \"SELECT appId, name, appVersion from app_app WHERE published = 1\";\n            PreparedStatement stmt = con.prepareStatement(sql);\n            ResultSet rs = stmt.executeQuery();\n            \n            while (rs.next()) {\n               if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                    if (appName.isEmpty()){\n                        appName = rs.getString(2);\n                    } else {\n                        appName += \",\" + rs.getString(2);\n                    }\n                } else {\n                    String sql2 = \"SELECT COUNT(id) FROM app_userview WHERE appId = ? AND appVersion = ?\";\n                    PreparedStatement stmt2 = con.prepareStatement(sql2);\n                    stmt2.setString(1, rs.getString(1));\n                    stmt2.setString(2, rs.getString(3));\n                    ResultSet rs2 = stmt2.executeQuery();\n                \n                    while (rs2.next()) {\n                      if (eachUserviewCount.isEmpty()){\n                        eachUserviewCount = rs2.getString(1);\n                      } else {\n                        eachUserviewCount += \",\" + rs2.getString(1);\n                      }\n                      userviewCount+=Integer.parseInt(rs2.getString(1));\n                    }\n                }\n            }\n            \n            if (chart != null && chart.length == 1 && chart[0].equals(\"data\")) {\n                result = eachUserviewCount;\n            } else if (chart != null && chart.length == 1 && chart[0].equals(\"label\")){\n                result = appName;\n            } else {\n                result = String.valueOf(userviewCount);\n            }\n        }\n    } catch (Exception ex) {\n        LogUtil.error(\"appCenter_userviewCount\", ex, \"\");\n    } finally {\n        try {\n            if (con != null) {\n                con.close();\n            }\n        } catch (Exception ex) {\n            LogUtil.error(\"appCenter_userviewCount\", ex, \"\");\n        }\n    }\n    return result;',NULL),
('crm_community',1,'AppName','Customer Relationship Management',NULL),
('crm_community',1,'refNo','',NULL);
/*!40000 ALTER TABLE `app_env_variable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd` WRITE;
/*!40000 ALTER TABLE `app_fd` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_appcenter` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  `modifiedByName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd_appcenter` WRITE;
/*!40000 ALTER TABLE `app_fd_appcenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_appcenter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_account` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  `modifiedByName` varchar(255) DEFAULT NULL,
  `c_country` longtext DEFAULT NULL,
  `c_address` longtext DEFAULT NULL,
  `c_accountName` longtext DEFAULT NULL,
  `c_city` longtext DEFAULT NULL,
  `c_state` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd_crm_account` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_contact` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  `modifiedByName` varchar(255) DEFAULT NULL,
  `c_lastName` longtext DEFAULT NULL,
  `c_address` longtext DEFAULT NULL,
  `c_city` longtext DEFAULT NULL,
  `c_fullName` longtext DEFAULT NULL,
  `c_photo` longtext DEFAULT NULL,
  `c_state` longtext DEFAULT NULL,
  `c_account` longtext DEFAULT NULL,
  `c_addressAvailable` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd_crm_contact` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_opportunity` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  `modifiedByName` varchar(255) DEFAULT NULL,
  `c_amount` longtext DEFAULT NULL,
  `c_stage` longtext DEFAULT NULL,
  `c_description` longtext DEFAULT NULL,
  `c_source` longtext DEFAULT NULL,
  `c_newAccount` longtext DEFAULT NULL,
  `c_title` longtext DEFAULT NULL,
  `c_account` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd_crm_opportunity` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_opportunity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_fd_crm_proposal` (
  `id` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `createdByName` varchar(255) DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  `modifiedByName` varchar(255) DEFAULT NULL,
  `c_refNo` longtext DEFAULT NULL,
  `c_comments` longtext DEFAULT NULL,
  `c_notes` longtext DEFAULT NULL,
  `c_attachment` longtext DEFAULT NULL,
  `c_description` longtext DEFAULT NULL,
  `c_title` longtext DEFAULT NULL,
  `c_account` longtext DEFAULT NULL,
  `c_status` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_fd_crm_proposal` WRITE;
/*!40000 ALTER TABLE `app_fd_crm_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_fd_crm_proposal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `tableName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`formId`),
  KEY `FK45957822462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FK45957822462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_form` WRITE;
/*!40000 ALTER TABLE `app_form` DISABLE KEYS */;
INSERT INTO `app_form` VALUES
('appcenter',1,'landing','Published Apps','2022-11-07 11:53:48','2022-11-07 11:53:48','appcenter','{\n    \"className\": \"org.joget.apps.form.model.Form\",\n    \"elements\": [\n        {\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"elements\": [{\n                \"className\": \"org.joget.apps.form.model.Column\",\n                \"elements\": [{\n                    \"className\": \"org.joget.apps.form.lib.CustomHTML\",\n                    \"properties\": {\n                        \"autoPopulate\": \"\",\n                        \"id\": \"admin_div\",\n                        \"label\": \"\",\n                        \"value\": \"<style>\\n#appcenter_admin {\\n    position: absolute;\\n    top: -40px;\\n    text-align: center;\\n    display: block;\\n    margin: auto;\\n    width: 100%;\\n}\\n#appcenter_admin a {\\n    background: white;\\n    border: solid 1px #ddd;\\n    cursor: pointer;\\n    text-decoration: none;\\n    color: #555;\\n    margin-right: 5px;\\n    padding: 10px;\\n    box-shadow: 0 1px 1.5px 1px rgba(0,0,0,.12);\\n    border-radius: 4px;\\n    font-size: 14px;\\n    font-weight: 400;\\n    line-height: 1.42857143;\\n    display: inline-block;\\n}\\n@media (max-width:540px) {\\n    #appcenter_admin {\\n        display: none;\\n    }\\n}\\n<\\/style>\\n<div id=\\\"appcenter_admin\\\">\\n    <a href=\\\"#\\\" onclick=\\\"appCreate();return false\\\">#i18n.Design New App#<\\/a>\\n    <a href=\\\"#\\\" onclick=\\\"appImport();return false\\\">#i18n.Import App#<\\/a>\\n    <a href=\\\"#\\\" onclick=\'AdminBar.showQuickOverlay(\\\"#request.contextPath#/web/desktop/marketplace/app?url=\\\" + encodeURIComponent(\\\"https://marketplace.joget.org\\\"));return false\'>#i18n.Download from Marketplace#<\\/a>\\n<\\/div>\"\n                    }\n                }],\n                \"properties\": {\"width\": \"100%\"}\n            }],\n            \"properties\": {\n                \"comment\": \"Display admin buttons\",\n                \"id\": \"admin_section\",\n                \"label\": \"\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"permission\": {\n                    \"className\": \"org.joget.apps.userview.lib.BeanShellPermission\",\n                    \"properties\": {\"script\": \"import org.joget.workflow.util.WorkflowUtil;\\nreturn !WorkflowUtil.isCurrentUserAnonymous() && WorkflowUtil.isCurrentUserInRole(WorkflowUtil.ROLE_ADMIN);\\n\"}\n                },\n                \"permissionReadonly\": \"\",\n                \"readonly\": \"\",\n                \"readonlyLabel\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                }\n            }\n        },\n        {\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"elements\": [{\n                \"className\": \"org.joget.apps.form.model.Column\",\n                \"elements\": [{\n                    \"className\": \"org.joget.apps.form.lib.CustomHTML\",\n                    \"properties\": {\n                        \"autoPopulate\": \"\",\n                        \"id\": \"published_apps\",\n                        \"label\": \"\",\n                        \"value\": \"<div id=\\\"main-action-help\\\"><i class=\\\"fa fa-info-circle\\\"><\\/i><\\/div>\\n<div id=\\\"search\\\"><\\/div>\\n<ul id=\\\"apps\\\"><\\/ul>\\n<p>\\n<script src=\\\"#request.contextPath#/js/appCenter7.js\\\"><\\/script>\\n<script>\\nAppCenter.searchFilter($(\\\"#search\\\"), $(\\\"#apps\\\")); \\nAppCenter.loadPublishedApps(\\\"#apps\\\");\\n<\\/script>\\n<\\/p>\"\n                    }\n                }],\n                \"properties\": {\"width\": \"100%\"}\n            }],\n            \"properties\": {\n                \"comment\": \"Load and display published app userviews\",\n                \"id\": \"apps_section\",\n                \"label\": \"\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"permission\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"permissionReadonly\": \"\",\n                \"readonly\": \"\",\n                \"readonlyLabel\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                }\n            }\n        }\n    ],\n    \"properties\": {\n        \"description\": \"\",\n        \"id\": \"landing\",\n        \"loadBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        },\n        \"name\": \"Published Apps\",\n        \"noPermissionMessage\": \"\",\n        \"permission\": {\n            \"className\": \"\",\n            \"properties\": {}\n        },\n        \"postProcessor\": {\n            \"className\": \"\",\n            \"properties\": {}\n        },\n        \"postProcessorRunOn\": \"both\",\n        \"storeBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        },\n        \"tableName\": \"appcenter\"\n    }\n}',NULL),
('crm_community',1,'crm_account','Account Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_account','{\n    \"className\": \"org.joget.apps.form.model.Form\",\n    \"properties\": {\n        \"id\": \"crm_account\",\n        \"loadBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        },\n        \"tableName\": \"crm_account\",\n        \"description\": \"\",\n        \"name\": \"Account Form\",\n        \"storeBinder\": {\n            \"className\": \"org.joget.apps.form.lib.WorkflowFormBinder\",\n            \"properties\": {}\n        }\n    },\n    \"elements\": [\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"id\",\n                                \"label\": \"Account ID\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"accountName\",\n                                \"label\": \"Account Name\",\n                                \"size\": \"\",\n                                \"readonly\": \"\",\n                                \"validator\": {\n                                    \"className\": \"org.joget.apps.form.lib.DefaultValidator\",\n                                    \"properties\": {\n                                        \"mandatory\": \"true\",\n                                        \"type\": \"\"\n                                    }\n                                },\n                                \"workflowVariable\": \"\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"99%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"account_details\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Account Details\"\n            }\n        },\n        {\n            \"elements\": [\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextArea\",\n                            \"properties\": {\n                                \"id\": \"address\",\n                                \"cols\": \"20\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Address\",\n                                \"readonly\": \"\",\n                                \"rows\": \"5\"\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                },\n                {\n                    \"elements\": [\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"city\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"City\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.TextField\",\n                            \"properties\": {\n                                \"id\": \"state\",\n                                \"workflowVariable\": \"\",\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"State\",\n                                \"readonly\": \"\",\n                                \"size\": \"\"\n                            }\n                        },\n                        {\n                            \"className\": \"org.joget.apps.form.lib.SelectBox\",\n                            \"properties\": {\n                                \"id\": \"country\",\n                                \"workflowVariable\": \"\",\n                                \"optionsBinder\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"validator\": {\n                                    \"className\": \"\",\n                                    \"properties\": {}\n                                },\n                                \"label\": \"Country\",\n                                \"multiple\": \"\",\n                                \"readonly\": \"\",\n                                \"size\": \"\",\n                                \"options\": [\n                                    {\n                                        \"value\": \"\",\n                                        \"label\": \"\"\n                                    },\n                                    {\n                                        \"value\": \"local\",\n                                        \"label\": \"Local\"\n                                    },\n                                    {\n                                        \"value\": \"international\",\n                                        \"label\": \"International\"\n                                    }\n                                ]\n                            }\n                        }\n                    ],\n                    \"className\": \"org.joget.apps.form.model.Column\",\n                    \"properties\": {\n                        \"width\": \"49%\"\n                    }\n                }\n            ],\n            \"className\": \"org.joget.apps.form.model.Section\",\n            \"properties\": {\n                \"id\": \"address\",\n                \"loadBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"visibilityControl\": \"\",\n                \"visibilityValue\": \"\",\n                \"storeBinder\": {\n                    \"className\": \"\",\n                    \"properties\": {}\n                },\n                \"label\": \"Address Details\"\n            }\n        }\n    ]\n}',NULL),
('crm_community',1,'crm_contact','Contact Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_contact','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_contact\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_contact\",\"name\":\"Contact Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"fullName\",\"workflowVariable\":\"\",\"readonlyLabel\":\"\",\"maxlength\":\"\",\"encryption\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"message\":\"\",\"custom-regex\":\"\",\"mandatory\":\"true\",\"type\":\"\"}},\"value\":\"\",\"label\":\"First Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"lastName\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Last Name\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"addressAvailable\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Available\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"no\",\"label\":\"No\"},{\"value\":\"yes\",\"label\":\"Yes\"}]}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"id\":\"photo\",\"label\":\"Photo\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"contact_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Contact Details\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"address\",\"cols\":\"20\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"Address\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"city\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"City\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"state\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"State\",\"readonly\":\"\",\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"address_details\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"addressAvailable\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Address Details\"}}]}',NULL),
('crm_community',1,'crm_opportunity','Opportunity Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_opportunity','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_opportunity\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_opportunity\",\"name\":\"Opportunity Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"title\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"mandatory\":\"true\",\"type\":\"\"}},\"label\":\"Title\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"id\":\"description\",\"cols\":\"15\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Description\",\"readonly\":\"\",\"rows\":\"5\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"id\":\"amount\",\"workflowVariable\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Amount\",\"readonly\":\"\",\"size\":\"\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"stage\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Stage\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"open\",\"label\":\"Open\"},{\"value\":\"won\",\"label\":\"Won\"},{\"value\":\"lost\",\"label\":\"Lost\"}]}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"source\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Source\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[{\"value\":\"\",\"label\":\"\"},{\"value\":\"direct\",\"label\":\"Direct\"},{\"value\":\"indirect\",\"label\":\"Indirect\"}]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"opportunity\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Opportunity\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"newAccount\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{}},\"label\":\"New Account\",\"readonly\":\"\",\"multiple\":\"\",\"options\":[{\"value\":\"yes\",\"label\":\"Yes\"},{\"value\":\"no\",\"label\":\"No\"}],\"size\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}},{\"elements\":[],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"49%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"accountChoice\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"id\":\"account\",\"workflowVariable\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"extraCondition\":\"\",\"labelColumn\":\"accountName\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\",\"multiple\":\"\",\"readonly\":\"\",\"size\":\"\",\"options\":[]}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_existing\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"no\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Existing Account\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"account\",\"formDefId\":\"crm_account\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"account\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"script1\",\"validator\":{\"className\":\"\",\"properties\":{}},\"value\":\"<script>\\nvar val = $(\\\"#account_crm_accountid\\\").val();\\nif (val != \'\') {\\n    $(\\\"#newAccount\\\").val(\\\"no\\\");\\n    $(\\\"#newAccount\\\").trigger(\\\"change\\\");\\n}\\n<\\/script>\",\"label\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"account_new\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"newAccount\",\"visibilityValue\":\"yes\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Account\"}}]}',NULL),
('crm_community',1,'crm_proposal_approval_form','Proposal Approval Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"name\":\"Proposal Approval Form\",\"id\":\"crm_proposal_approval_form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"label\":\"\",\"formDefId\":\"crm_proposal_form\",\"readonly\":\"true\",\"readonlyLabel\":\"\",\"noframe\":\"true\",\"parentSubFormId\":\"\",\"subFormParentId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}}}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"visibilityControl\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"id\":\"section1\",\"label\":\"Proposal Approval\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityValue\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"readonly\":\"\",\"size\":\"\",\"optionsBinder\":{\"className\":\"\",\"properties\":{}},\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"type\":\"\",\"mandatory\":\"true\"}},\"multiple\":\"\",\"options\":[{\"label\":\"Approved\",\"value\":\"approved\"},{\"label\":\"Resubmit\",\"value\":\"resubmit\"},{\"label\":\"Rejected\",\"value\":\"rejected\"}],\"workflowVariable\":\"status\",\"id\":\"status\",\"label\":\"Status\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"readonly\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"id\":\"comments\",\"label\":\"Approver Comments\",\"rows\":\"5\",\"cols\":\"20\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"visibilityControl\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"id\":\"section2\",\"label\":\"Approver Action\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityValue\":\"\"}}]}',NULL),
('crm_community',1,'crm_proposal_form','Proposal Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"name\":\"Proposal Form\",\"id\":\"crm_proposal_form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.IdGeneratorField\",\"properties\":{\"hidden\":\"true\",\"format\":\"????\",\"workflowVariable\":\"\",\"envVariable\":\"refNo\",\"id\":\"refNo\",\"label\":\"Reference No\"}},{\"className\":\"org.joget.apps.form.lib.SelectBox\",\"properties\":{\"readonly\":\"\",\"size\":\"\",\"optionsBinder\":{\"className\":\"org.joget.apps.form.lib.FormOptionsBinder\",\"properties\":{\"formDefId\":\"crm_account\",\"labelColumn\":\"accountName\",\"extraCondition\":\"\"}},\"validator\":{\"className\":\"\",\"properties\":{}},\"multiple\":\"\",\"options\":[],\"workflowVariable\":\"\",\"id\":\"account\",\"label\":\"Account\"}},{\"className\":\"org.joget.apps.form.lib.TextField\",\"properties\":{\"readonly\":\"\",\"size\":\"\",\"validator\":{\"className\":\"org.joget.apps.form.lib.DefaultValidator\",\"properties\":{\"type\":\"\",\"mandatory\":\"true\"}},\"workflowVariable\":\"\",\"id\":\"title\",\"label\":\"Title\"}},{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"readonly\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"workflowVariable\":\"\",\"id\":\"description\",\"label\":\"Description\",\"placeholder\":\"\",\"rows\":\"5\",\"value\":\"\",\"cols\":\"60\",\"readonlyLabel\":\"\"}},{\"className\":\"org.joget.apps.form.lib.FileUpload\",\"properties\":{\"attachment\":\"true\",\"readonly\":\"\",\"size\":\"\",\"id\":\"attachment\",\"label\":\"Attachment\"}},{\"className\":\"org.joget.apps.form.lib.CustomHTML\",\"properties\":{\"id\":\"field6\",\"value\":\"#i18n.form_hints#\",\"label\":\"&nbsp;\",\"autoPopulate\":\"\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"100%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"visibilityControl\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"id\":\"section1\",\"label\":\"Proposal Form\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityValue\":\"\"}}]}',NULL),
('crm_community',1,'crm_proposal_resubmit_form','Proposal Resubmit Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"id\":\"crm_proposal_resubmit_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\",\"name\":\"Proposal Resubmit Form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"}},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"approval\",\"formDefId\":\"crm_proposal_approval_form\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"true\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmit\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"id\":\"proposal\",\"formDefId\":\"crm_proposal_form\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"subFormParentId\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"\",\"parentSubFormId\":\"\",\"readonly\":\"\"}},{\"className\":\"org.joget.apps.form.lib.HiddenField\",\"properties\":{\"id\":\"status\",\"workflowVariable\":\"status\",\"value\":\"pending\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section2\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityControl\":\"\",\"visibilityValue\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"label\":\"Proposal Resubmission\"}}]}',NULL),
('crm_community',1,'crm_proposal_sending_form','Proposal Sending Form','2022-11-07 11:53:12','2022-11-07 11:53:12','crm_proposal','{\"className\":\"org.joget.apps.form.model.Form\",\"properties\":{\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"name\":\"Proposal Sending Form\",\"id\":\"crm_proposal_sending_form\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\"},\"tableName\":\"crm_proposal\"},\"elements\":[{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.SubForm\",\"properties\":{\"parentSubFormId\":\"\",\"loadBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}},\"readonly\":\"true\",\"formDefId\":\"crm_proposal_approval_form\",\"subFormParentId\":\"\",\"id\":\"approval\",\"label\":\"\",\"storeBinder\":{\"className\":\"org.joget.apps.form.lib.WorkflowFormBinder\",\"properties\":{}}}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"id\":\"section1\",\"label\":\"Send Proposal\",\"readonly\":\"\",\"readonlyLabel\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"permission\":{\"className\":\"\",\"properties\":{}},\"permissionReadonly\":\"\",\"comment\":\"\"}},{\"elements\":[{\"elements\":[{\"className\":\"org.joget.apps.form.lib.TextArea\",\"properties\":{\"readonly\":\"\",\"validator\":{\"className\":\"\",\"properties\":{}},\"id\":\"notes\",\"label\":\"Notes\",\"rows\":\"5\",\"cols\":\"20\"}}],\"className\":\"org.joget.apps.form.model.Column\",\"properties\":{\"width\":\"99%\"}}],\"className\":\"org.joget.apps.form.model.Section\",\"properties\":{\"visibilityControl\":\"\",\"loadBinder\":{\"className\":\"\",\"properties\":{}},\"id\":\"section2\",\"label\":\"\",\"storeBinder\":{\"className\":\"\",\"properties\":{}},\"visibilityValue\":\"\"}}]}',NULL);
/*!40000 ALTER TABLE `app_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_form_data_audit_trail` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tableName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_form_data_audit_trail` WRITE;
/*!40000 ALTER TABLE `app_form_data_audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_form_data_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_message` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageKey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`ouid`),
  KEY `FKEE346FE9462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FKEE346FE9462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_message` WRITE;
/*!40000 ALTER TABLE `app_message` DISABLE KEYS */;
INSERT INTO `app_message` VALUES
('appcenter',1,'<i class=\'fa fa-home\'></i> Home_zh_CN','<i class=\'fa fa-home\'></i> Home','zh_CN','<i class=\'fa fa-home\'></i> 首页'),
('appcenter',1,'<i class=\'fa fa-home\'></i> Home_zh_TW','<i class=\'fa fa-home\'></i> Home','zh_TW','<i class=\'fa fa-home\'></i> 首頁'),
('appcenter',1,'All Apps_zh_CN','All Apps','zh_CN','所有应用'),
('appcenter',1,'All Apps_zh_TW','All Apps','zh_TW','所有應用'),
('appcenter',1,'App Center_zh_CN','App Center','zh_CN','应用中心'),
('appcenter',1,'App Center_zh_TW','App Center','zh_TW','應用中心'),
('appcenter',1,'Design New App_zh_CN','Design New App','zh_CN','设计新应用程序'),
('appcenter',1,'Design New App_zh_TW','Design New App','zh_TW','設計新應用程序'),
('appcenter',1,'Download from Marketplace_zh_CN','Download from Marketplace','zh_CN','应用市场'),
('appcenter',1,'Download from Marketplace_zh_TW','Download from Marketplace','zh_TW','應用市場'),
('appcenter',1,'Faster, Simpler Digital Transformation_zh_CN','Faster, Simpler Digital Transformation','zh_CN','更快, 更简单地实现 企业数字化转型'),
('appcenter',1,'Faster, Simpler Digital Transformation_zh_TW','Faster, Simpler Digital Transformation','zh_TW','更快, 更簡單地實現 企業數字化轉型'),
('appcenter',1,'Import App_zh_CN','Import App','zh_CN','导入应用'),
('appcenter',1,'Import App_zh_TW','Import App','zh_TW','導入應用'),
('appcenter',1,'Incorrect Username and/or Password_zh_CN','Incorrect Username and/or Password','zh_CN','您的登录未成功'),
('appcenter',1,'Incorrect Username and/or Password_zh_TW','Incorrect Username and/or Password','zh_TW','您的登錄未成功'),
('appcenter',1,'Login_zh_CN','Login','zh_CN','登录'),
('appcenter',1,'Login_zh_TW','Login','zh_TW','登錄'),
('appcenter',1,'Monitor_zh_CN','Monitor','zh_CN','监控'),
('appcenter',1,'Monitor_zh_TW','Monitor','zh_TW','監控'),
('appcenter',1,'Password_zh_CN','Password','zh_CN','密码'),
('appcenter',1,'Password_zh_TW','Password','zh_TW','密碼'),
('appcenter',1,'Powered by Joget_zh_CN','Powered by Joget','zh_CN','由Joget技术支持'),
('appcenter',1,'Powered by Joget_zh_TW','Powered by Joget','zh_TW','由Joget技術支持'),
('appcenter',1,'Published Apps_zh_CN','Published Apps','zh_CN','本地已发布'),
('appcenter',1,'Published Apps_zh_TW','Published Apps','zh_TW','本地已發布'),
('appcenter',1,'Settings_zh_CN','Settings','zh_CN','设置'),
('appcenter',1,'Settings_zh_TW','Settings','zh_TW','設置'),
('appcenter',1,'Username_zh_CN','Username','zh_CN','用户名'),
('appcenter',1,'Username_zh_TW','Username','zh_TW','用戶名'),
('appcenter',1,'Users_zh_CN','Users','zh_CN','用户'),
('appcenter',1,'Users_zh_TW','Users','zh_TW','用戶'),
('crm_community',1,'About_zh_CN','About','zh_CN','关于'),
('crm_community',1,'aboutpage_en_US','aboutpage','en_US','<h4 style=\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\">More Leads, More Sales, More Customers</h4>\n<h1 style=\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\"><span style=\"font-size: large;\"><strong>Business&nbsp;Customer Relationship Management</strong></span></h1>\n<p style=\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\">CRM helps your business communicate with prospects, share sales information, close deals and keep customers happy.<img src=\"http://www.joget.org/images/demo/phone_pad.png\" alt=\"\" width=\"382\" height=\"302\" /></p>'),
('crm_community',1,'aboutpage_zh_CN','aboutpage','zh_CN','<h4 style=\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\">更多线索，更多销售，更多客户</h4>\n<h1 style=\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\"><span style=\"font-size: large;\"><strong>客户关系管理 (CRM)</strong></span></h1>\n<p style=\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\">CRM帮助您的企业与潜在客户进行沟通，共享销售信息，达成交易并保持客户满意。<img src=\"http://www.joget.org/images/demo/phone_pad.png\" alt=\"\" width=\"382\" height=\"302\" /></p>'),
('crm_community',1,'Account Details_zh_CN','Account Details','zh_CN','客户详情'),
('crm_community',1,'Account ID_zh_CN','Account ID','zh_CN','客户ID'),
('crm_community',1,'Account List_zh_CN','Account List','zh_CN','客户列表'),
('crm_community',1,'Account Name_zh_CN','Account Name','zh_CN','客户名称'),
('crm_community',1,'Account_zh_CN','Account','zh_CN','客户'),
('crm_community',1,'Accounts_zh_CN','Accounts','zh_CN','客户'),
('crm_community',1,'Add Account_zh_CN','Add Account','zh_CN','增加客户'),
('crm_community',1,'Add Contact_zh_CN','Add Contact','zh_CN','增加联系人'),
('crm_community',1,'Add Opportunity_zh_CN','Add Opportunity','zh_CN','增加机会'),
('crm_community',1,'Address Available_zh_CN','Address Available','zh_CN','可用地址'),
('crm_community',1,'Address Details_zh_CN','Address Details','zh_CN','详细地址'),
('crm_community',1,'Address_zh_CN','Address','zh_CN','地址'),
('crm_community',1,'Amount_zh_CN','Amount','zh_CN','金额'),
('crm_community',1,'applicationName_en_US','applicationName','en_US','Customer Relationship Management'),
('crm_community',1,'applicationName_zh_CN','applicationName','zh_CN','客户关系管理 (CRM)'),
('crm_community',1,'Approved_zh_CN','Approved','zh_CN','批准'),
('crm_community',1,'Approver Action_zh_CN','Approver Action','zh_CN','审批人决策'),
('crm_community',1,'Approver Comments_zh_CN','Approver Comments','zh_CN','审批人评论'),
('crm_community',1,'Attachment_zh_CN','Attachment','zh_CN','文件上传'),
('crm_community',1,'City_zh_CN','City','zh_CN','城市'),
('crm_community',1,'Contact Details_zh_CN','Contact Details','zh_CN','详细联系方式'),
('crm_community',1,'Contact List_zh_CN','Contact List','zh_CN','联系人列表'),
('crm_community',1,'Contacts_zh_CN','Contacts','zh_CN','联系人'),
('crm_community',1,'Country_zh_CN','Country','zh_CN','国家'),
('crm_community',1,'Date Modified_zh_CN','Date Modified','zh_CN','更新日期'),
('crm_community',1,'Delete Row_zh_CN','Delete Row','zh_CN','删除行'),
('crm_community',1,'Delete_zh_CN','Delete','zh_CN','删除'),
('crm_community',1,'Description_zh_CN','Description','zh_CN','描述'),
('crm_community',1,'Direct_zh_CN','Direct','zh_CN','直接'),
('crm_community',1,'Existing Account_zh_CN','Existing Account','zh_CN','现有客户'),
('crm_community',1,'First Name_zh_CN','First Name','zh_CN','名'),
('crm_community',1,'form_hints_en_US','form_hints','en_US','<i>Tasks and emails will be forwarded to \'admin\' user for approval. \nYou can change the settings <a href=\"/jw/web/console/app/crm_community/1/processes/process1\" target=\"_blank\">here</a><br/></i>'),
('crm_community',1,'form_hints_zh_CN','form_hints','zh_CN','<i>任务和电子邮件将转发给“管理员”用户以供批准。<br/>\n您可以在<a href=\"/jw/web/console/app/crm_community/1/processes/process1\" target=\"_blank\">此处</a> 更改设置。</i>'),
('crm_community',1,'Full Name_zh_CN','Full Name','zh_CN','姓名'),
('crm_community',1,'Hidden_zh_CN','Hidden','zh_CN','隐藏'),
('crm_community',1,'Home_zh_CN','Home','zh_CN','首页'),
('crm_community',1,'Hyperlink_zh_CN','Hyperlink','zh_CN','连结'),
('crm_community',1,'Indirect_zh_CN','Indirect','zh_CN','间接'),
('crm_community',1,'International_zh_CN','International','zh_CN','国际的'),
('crm_community',1,'Last Name_zh_CN','Last Name','zh_CN','姓'),
('crm_community',1,'Local_zh_CN','Local','zh_CN','本地的'),
('crm_community',1,'Lost_zh_CN','Lost','zh_CN','失去'),
('crm_community',1,'New Account_zh_CN','New Account','zh_CN','新客户'),
('crm_community',1,'New Contact_zh_CN','New Contact','zh_CN','新联系人'),
('crm_community',1,'New Opportunity_zh_CN','New Opportunity','zh_CN','新机会'),
('crm_community',1,'No_zh_CN','No','zh_CN','否'),
('crm_community',1,'Notes_zh_CN','Notes','zh_CN','说明'),
('crm_community',1,'Open_zh_CN','Open','zh_CN','开始'),
('crm_community',1,'Opportunities_zh_CN','Opportunities','zh_CN','机会'),
('crm_community',1,'Opportunity List_zh_CN','Opportunity List','zh_CN','机会列表'),
('crm_community',1,'Opportunity_zh_CN','Opportunity','zh_CN','机会'),
('crm_community',1,'page_Proposals Inbox_header_en_US','page_Proposals Inbox_header','en_US','Reminder to administrator for email notification to work:<br/>\n<ul>\n\n<li>Input the all users users email address in <a href=\"/jw/web/console/directory/users\" target=\"_blank\">Setup Users</a>.</li>\n<li>Input your email SMTP credentials into the <a href=\"/jw/web/console/setting/general\" target=\"_blank\">General Settings</a>.</li>\n</ul>'),
('crm_community',1,'page_Proposals Inbox_header_zh_CN','page_Proposals Inbox_header','zh_CN','给Joget管理员使用电子邮件的提示：<br/>\n<ul>\n\n<li>在 <a href=\"/jw/web/console/directory/users\" target=\"_blank\">系统设置 > 设置用户</a> 中输入所有用户的电子邮件地址。</li>\n<li>在 <a href=\"/jw/web/console/setting/general\" target=\"_blank\">系统设置 > 常规设置</a> 中输入您的Joget SMTP服务器配置以发送电子邮件。</li>\n</ ul>\n'),
('crm_community',1,'Photo_zh_CN','Photo','zh_CN','图片上传'),
('crm_community',1,'Proposal Approval_zh_CN','Proposal Approval','zh_CN','审批'),
('crm_community',1,'Proposal Form_zh_CN','Proposal Form','zh_CN','建议书'),
('crm_community',1,'Proposal Process_zh_CN','Proposal Process','zh_CN','建议书流程'),
('crm_community',1,'Proposal Resubmission_zh_CN','Proposal Resubmission','zh_CN','退回的建议单'),
('crm_community',1,'Proposal Resubmit_zh_CN','Proposal Resubmit','zh_CN','重新提交'),
('crm_community',1,'Reference No_zh_CN','Reference No','zh_CN','参考编号'),
('crm_community',1,'Rejected_zh_CN','Rejected','zh_CN','拒绝'),
('crm_community',1,'Resubmit_zh_CN','Resubmit','zh_CN','重新提交'),
('crm_community',1,'Send Proposal_zh_CN','Send Proposal','zh_CN','发送建议书'),
('crm_community',1,'Source_zh_CN','Source','zh_CN','来源'),
('crm_community',1,'Stage_zh_CN','Stage','zh_CN','阶段'),
('crm_community',1,'State_zh_CN','State','zh_CN','省份/直辖市'),
('crm_community',1,'Status_zh_CN','Status','zh_CN','状态'),
('crm_community',1,'Submit New Proposal_zh_CN','Submit New Proposal','zh_CN','提交新建议书'),
('crm_community',1,'Task Inbox_zh_CN','Task Inbox','zh_CN','任务收件箱'),
('crm_community',1,'Title_zh_CN','Title','zh_CN','职位'),
('crm_community',1,'View All Proposals_zh_CN','View All Proposals','zh_CN','所有建议书'),
('crm_community',1,'View Proposal_zh_CN','View Proposal','zh_CN','观看建议书'),
('crm_community',1,'View_zh_CN','View','zh_CN','观看'),
('crm_community',1,'Welcome_zh_CN','Welcome','zh_CN','欢迎'),
('crm_community',1,'Won_zh_CN','Won','zh_CN','赢得'),
('crm_community',1,'Yes_zh_CN','Yes','zh_CN','是');
/*!40000 ALTER TABLE `app_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package` (
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`packageId`,`packageVersion`),
  KEY `FK852EA428462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK852EA428462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_package` WRITE;
/*!40000 ALTER TABLE `app_package` DISABLE KEYS */;
INSERT INTO `app_package` VALUES
('crm_community',1,'CRM Community','2022-11-07 11:53:16','2022-11-07 11:53:17','crm_community',1);
/*!40000 ALTER TABLE `app_package` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_form` (
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formIFrameStyle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autoContinue` bit(1) DEFAULT NULL,
  `disableSaveAsDraft` bit(1) DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKA8D741D5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKA8D741D5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_package_activity_form` WRITE;
/*!40000 ALTER TABLE `app_package_activity_form` DISABLE KEYS */;
INSERT INTO `app_package_activity_form` VALUES
('process1','activity1','crm_community',1,'process1::activity1','SINGLE','crm_proposal_resubmit_form',NULL,NULL,'','\0'),
('process1','approve_proposal','crm_community',1,'process1::approve_proposal','SINGLE','crm_proposal_approval_form',NULL,NULL,'','\0'),
('process1','runProcess','crm_community',1,'process1::runProcess','SINGLE','crm_proposal_form',NULL,NULL,'','\0'),
('process1','send_proposal','crm_community',1,'process1::send_proposal','SINGLE','crm_proposal_sending_form',NULL,NULL,'','\0');
/*!40000 ALTER TABLE `app_package_activity_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_activity_plugin` (
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluginName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluginProperties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`activityDefId`,`packageId`,`packageVersion`),
  KEY `FKADE8644C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FKADE8644C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_package_activity_plugin` WRITE;
/*!40000 ALTER TABLE `app_package_activity_plugin` DISABLE KEYS */;
INSERT INTO `app_package_activity_plugin` VALUES
('process1','tool1','crm_community',1,'process1::tool1','org.joget.apps.app.lib.EmailTool','{\"toSpecific\":\"\",\"toParticipantId\":\"approver\",\"cc\":\"\",\"bcc\":\"\",\"subject\":\"Proposal Approved: #form.crm_proposal.title#\",\"message\":\"Proposal Approved\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\",\"isHtml\":\"\",\"from\":\"\",\"host\":\"\",\"port\":\"\",\"security\":\"\",\"username\":\"\",\"password\":\"\",\"formDefId\":\"\",\"fields\":[],\"files\":[],\"icsAttachement\":\"\"}'),
('process1','tool2','crm_community',1,'process1::tool2','org.joget.apps.app.lib.EmailTool','{\"toSpecific\":\"\",\"toParticipantId\":\"requester\",\"cc\":\"\",\"bcc\":\"\",\"subject\":\"Proposal Rejected: #form.crm_proposal.title#\",\"message\":\"Proposal Rejected\\n\\nRef No: #form.crm_proposal.refNo#\\nTitle: #form.crm_proposal.title#\",\"isHtml\":\"\",\"from\":\"\",\"host\":\"\",\"port\":\"\",\"security\":\"\",\"username\":\"\",\"password\":\"\",\"formDefId\":\"\",\"fields\":[],\"files\":[],\"icsAttachement\":\"\"}');
/*!40000 ALTER TABLE `app_package_activity_plugin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_package_participant` (
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `participantId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageVersion` bigint(20) NOT NULL,
  `ouid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluginProperties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processDefId`,`participantId`,`packageId`,`packageVersion`),
  KEY `FK6D7BF59C5F255BCC` (`packageId`,`packageVersion`),
  CONSTRAINT `FK6D7BF59C5F255BCC` FOREIGN KEY (`packageId`, `packageVersion`) REFERENCES `app_package` (`packageId`, `packageVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_package_participant` WRITE;
/*!40000 ALTER TABLE `app_package_participant` DISABLE KEYS */;
INSERT INTO `app_package_participant` VALUES
('process1','approver','crm_community',1,'process1::approver','requesterHod',NULL,NULL),
('process1','processStartWhiteList','crm_community',1,'process1::processStartWhiteList','role','loggedInUser',NULL),
('process1','requester','crm_community',1,'process1::requester','requester','runProcess',NULL);
/*!40000 ALTER TABLE `app_package_participant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_plugin_default` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pluginName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluginDescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pluginProperties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FK7A835713462EF4C7` (`appId`,`appVersion`),
  CONSTRAINT `FK7A835713462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_plugin_default` WRITE;
/*!40000 ALTER TABLE `app_plugin_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_plugin_default` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processUid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK5E33D79C918F93D` (`processUid`),
  CONSTRAINT `FK5E33D79C918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_activity` WRITE;
/*!40000 ALTER TABLE `app_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_activity_instance` (
  `instanceId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `performer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignmentUsers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromCreatedTime` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `activityUid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK9C6ABDD8B06E2043` (`activityUid`),
  KEY `FK9C6ABDD8D4610A90` (`processInstanceId`),
  CONSTRAINT `FK9C6ABDD8B06E2043` FOREIGN KEY (`activityUid`) REFERENCES `app_report_activity` (`uuid`),
  CONSTRAINT `FK9C6ABDD8D4610A90` FOREIGN KEY (`processInstanceId`) REFERENCES `app_report_process_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_activity_instance` WRITE;
/*!40000 ALTER TABLE `app_report_activity_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_activity_instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_app` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_app` WRITE;
/*!40000 ALTER TABLE `app_report_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_app` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_package` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageVersion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appUid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKBD580A19E475ABC` (`appUid`),
  CONSTRAINT `FKBD580A19E475ABC` FOREIGN KEY (`appUid`) REFERENCES `app_report_app` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_package` WRITE;
/*!40000 ALTER TABLE `app_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_package` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process` (
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageUid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FKDAFFF442D40695DD` (`packageUid`),
  CONSTRAINT `FKDAFFF442D40695DD` FOREIGN KEY (`packageUid`) REFERENCES `app_report_package` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_process` WRITE;
/*!40000 ALTER TABLE `app_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_report_process_instance` (
  `instanceId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `timeConsumingFromStartedTime` bigint(20) DEFAULT NULL,
  `processUid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`instanceId`),
  KEY `FK351D7BF2918F93D` (`processUid`),
  CONSTRAINT `FK351D7BF2918F93D` FOREIGN KEY (`processUid`) REFERENCES `app_report_process` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_report_process_instance` WRITE;
/*!40000 ALTER TABLE `app_report_process_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_report_process_instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_resource` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `permissionClass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissionProperties` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  CONSTRAINT `FK_nnvkg0h6yy8o3f4yjhd20ury0` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_resource` WRITE;
/*!40000 ALTER TABLE `app_resource` DISABLE KEYS */;
INSERT INTO `app_resource` VALUES
('appcenter',1,'build_app.png',87107,'org.joget.apps.userview.lib.LoggedInUserPermission','{\"permission\": { \"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\", \"properties\": {}}}'),
('appcenter',1,'finalBanner.png',100318,NULL,'{\"hashvariable\":\"#appResource.finalBanner.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'image.png',86251,NULL,'{\"hashvariable\":\"#appResource.image.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'joget_glass_logo.png',17978,NULL,'{\"hashvariable\":\"#appResource.joget_glass_logo.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'Joget_logo__Reverse_White_Register.png',65542,NULL,'{\"hashvariable\":\"#appResource.Joget_logo__Reverse_White_Register.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'jogetAcademy.png',119664,NULL,'{\"hashvariable\":\"#appResource.jogetAcademy.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'jogetPages.png',145467,NULL,'{\"hashvariable\":\"#appResource.jogetPages.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('appcenter',1,'loginImg.png',142577,NULL,'{\"hashvariable\":\"#appResource.loginImg.png#\",\"permission\":{\"className\":\"\",\"properties\":{}}}'),
('crm_community',1,'crm-icon7.png',29514,NULL,'{\"permission\": { \"className\": \"\", \"properties\": {}}}');
/*!40000 ALTER TABLE `app_resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_userview` (
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appVersion` bigint(20) NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`appId`,`appVersion`,`id`),
  KEY `FKE411D54E462EF4C7` (`appId`,`appVersion`),
  KEY `idx_name` (`name`),
  CONSTRAINT `FKE411D54E462EF4C7` FOREIGN KEY (`appId`, `appVersion`) REFERENCES `app_app` (`appId`, `appVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `app_userview` WRITE;
/*!40000 ALTER TABLE `app_userview` DISABLE KEYS */;
INSERT INTO `app_userview` VALUES
('appcenter',1,'home','App Center',NULL,'{\n\"categories\": [{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [{\n\"className\": \"org.joget.apps.userview.lib.DataListMenu\",\n\"properties\": {\n\"buttonPosition\": \"bottomLeft\",\n\"cacheAllLinks\": \"\",\n\"cacheListAction\": \"\",\n\"checkboxPosition\": \"left\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"customId\": \"home\",\n\"datalistId\": \"applist\",\n\"enableOffline\": \"\",\n\"id\": \"8C70B71371B942B6D48A7E9B4C1DB8D1\",\n\"keyName\": \"\",\n\"label\": \"<i class=\\\"zmdi zmdi-apps\\\"><\\/i> Home\",\n\"permission_rules\": {\"58F9FBEA76264BE037991759BC1645A2\": {}},\n\"rowCount\": \"\",\n\"selectionType\": \"multiple\",\n\"style-custom\": \"min-height:50vh;\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}],\n\"properties\": {\n\"comment\": \"\",\n\"hide\": \"\",\n\"id\": \"category-CB52FE21C5EE44FC35A4BDB7A4DCDF53\",\n\"label\": \"Home\",\n\"permission\": {\n\"className\": \"\",\n\"properties\": {}\n},\n\"permission_rules\": {\"58F9FBEA76264BE037991759BC1645A2\": {\n\"hide\": \"\",\n\"permissionDeny\": \"\"\n}}\n}\n}],\n\"className\": \"org.joget.apps.userview.model.Userview\",\n\"properties\": {\n\"description\": \"\",\n\"footerMessage\": \"#i18n.Powered by Joget#\",\n\"id\": \"home\",\n\"logoutText\": \"Logout\",\n\"name\": \"App Center\",\n\"welcomeMessage\": \"Empowering Open Innovation\"\n},\n\"setting\": {\"properties\": {\n\"__\": \"\",\n\"hideThisUserviewInAppCenter\": \"true\",\n\"permission\": {\n\"className\": \"\",\n\"properties\": {}\n},\n\"permission_rules\": [{\n\"permission\": {\n\"className\": \"org.joget.plugin.enterprise.AdminUserviewPermission\",\n\"properties\": {}\n},\n\"permission_key\": \"58F9FBEA76264BE037991759BC1645A2\",\n\"permission_name\": \"Is Admin\"\n}],\n\"__\": \"\",\n\"theme\": {\n\"className\": \"org.joget.apps.userview.lib.AjaxUniversalTheme\",\n\"properties\": {\n\"brand-name-style-display\": \"none\",\n\"breadcrumb-style-display\": \"none\",\n\"css\": \"<\\/style>\\n<link rel=\\\"stylesheet\\\" type=\\\"text/css\\\" href=\\\"#request.baseURL?html#/css/appCenter8.css?build=#platform.build#\\\" />\\n<style>\",\n\"disableHelpGuide\": \"\",\n\"disablePush\": \"\",\n\"disablePwa\": \"\",\n\"dx8background\": \"#F5F8FA\",\n\"dx8backgroundImage\": \"\",\n\"dx8buttonBackground\": \"\",\n\"dx8buttonColor\": \"\",\n\"dx8colorSchema\": \"#f1f1f1;#FFFFFF;#8D9BCA;#1EA0CB;#253037;#19242b\",\n\"dx8colorScheme\": \"rgb(249, 250, 251);rgb(59, 67, 72);rgb(3, 169, 244);rgb(110, 206, 251);rgb(255, 255, 255);rgb(255, 255, 255)\",\n\"dx8contentFontColor\": \"\",\n\"dx8contentbackground\": \"\",\n\"dx8fontColor\": \"\",\n\"dx8footerBackground\": \"\",\n\"dx8footerColor\": \"\",\n\"dx8headerColor\": \"\",\n\"dx8headerFontColor\": \"\",\n\"dx8headingBgColor\": \"\",\n\"dx8headingFontColor\": \"\",\n\"dx8linkActiveColor\": \"#007BFF\",\n\"dx8linkColor\": \"#01A9F4\",\n\"dx8navActiveIconColor\": \"\",\n\"dx8navActiveLinkBackground\": \"\",\n\"dx8navActiveLinkColor\": \"#000000\",\n\"dx8navBackground\": \"#FFFFFF\",\n\"dx8navBadge\": \"\",\n\"dx8navBadgeText\": \"\",\n\"dx8navLinkBackground\": \"\",\n\"dx8navLinkColor\": \"#7E8299\",\n\"dx8navLinkIcon\": \"#7E8299\",\n\"dx8navScrollbarThumb\": \"\",\n\"dx8navScrollbarTrack\": \"\",\n\"dx8primaryColor\": \"\",\n\"enableResponsiveSwitch\": \"true\",\n\"fav_icon\": \"\",\n\"fontControl\": \"\",\n\"footer-style-display\": \"none\",\n\"homeAttractBanner\": \"\",\n\"homeUrl\": \"\",\n\"horizontal_menu\": \"\",\n\"inbox\": \"all\",\n\"js\": \"<\\/script>\\r\\n<script type=\\\"text/javascript\\\" src=\\\"#request.baseURL?html#/js/appCenter8.js?build=#platform.build#\\\"/>\\\"><\\/script>\\r\\n<script>\",\n\"loginBackground\": \"\",\n\"loginPageBottom\": \"<\\/div>\\n<\\/div>\\n<div class=\\\"d-flex flex-lg-row-fluid w-lg-50 bgi-size-cover bgi-position-center order-1 order-lg-2\\\" style=\\\"background-image: url(#appResource.image.png#);background-size: cover;\\\">\\n\\t\\t\\t\\t\\t<!--begin::Content-->\\n\\t\\t\\t\\t\\t<div class=\\\"d-flex flex-column flex-center py-7 py-lg-15 px-5 px-md-15 w-100\\\">\\n\\t\\t\\t\\t\\t\\t<!--begin::Logo-->\\n\\t\\t\\t\\t\\t\\t<img alt=\\\"Logo\\\" src=\\\"#appResource.Joget_logo__Reverse_White_Register.png#\\\" class=\\\"h-60px h-lg-75px d-lg-block mx-auto w-275px w-md-50 w-xl-500px mb-10 mb-lg-20\\\">\\n\\t\\t\\t\\t\\t\\t<!--end::Logo-->\\n\\t\\t\\t\\t\\t\\t<!--begin::Image-->\\n\\t\\t\\t\\t\\t\\t<img class=\\\"d-none d-lg-block mx-auto w-275px w-md-50 w-xl-500px mb-10 mb-lg-20\\\" src=\\\"#appResource.loginImg.png#\\\" alt=\\\"\\\">\\n\\t\\t\\t\\t\\t\\t<!--end::Image-->\\n\\t\\t\\t\\t\\t\\t<!--begin::Title-->\\n\\t\\t\\t\\t\\t\\t<h1 class=\\\"d-none d-lg-block text-white fs-2qx fw-bolder text-center mb-7\\\">Empowering Open Innovation<\\/h1>\\n\\t\\t\\t\\t\\t\\t<!--end::Title-->\\n\\t\\t\\t\\t\\t\\t<!--begin::Text-->\\n\\t\\t\\t\\t\\t\\t<div class=\\\"d-none d-lg-block text-white fs-base text-center\\\"><strong>Joget DX<\\/strong> combines the best of <strong>process automation, workflow management<\\/strong> and <strong>low code application development<\\/strong> in a simple, flexible and open platform. Joget DX is a modern open source low-code application development platform to build enterprise web apps and automate workflows on the Cloud and Mobile<\\/div>\\n\\t\\t\\t\\t\\t\\t<!--end::Text-->\\n\\t\\t\\t\\t\\t<\\/div>\\n\\t\\t\\t\\t\\t<!--end::Content-->\\n\\t\\t\\t\\t<\\/div>\\n<\\/div>\\n<style>\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > img:nth-child(2){\\n  width: 550px;\\n    height: 350px;\\n    margin: 40px 0px;\\n    margin-bottom: 5.5rem !important;\\n-webkit-filter: drop-shadow(5px 5px 5px #222);\\n    filter: drop-shadow(5px 5px 5px #222);\\n}\\nbody#login #loginForm{\\n position: relative;\\n}\\nbody#login #page #content main{\\npadding-left: 0%;\\n    padding-right: 0%;\\nheight: 100%;\\n}\\n.w-lg-50 {\\n    width: 50%!important;\\n}\\n.d-flex {\\n    height: 100%;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > img.h-60px.h-lg-75px{\\n  width: 200px;\\n height: 55px;\\nmargin-top: 4rem!important;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > img:nth-child(3){\\nwidth: 540px!important;\\nmargin-bottom: 5.5rem!important;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div{\\n    padding-top: 3rem;\\n    padding-bottom: 3rem;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > h2{\\n padding-left: 20px;\\nmargin-bottom: 40px;\\n}\\n#loginForm > table{\\nwidth: 50%;\\n}\\nbody#login #loginForm table td input[type=\'submit\']{\\nwidth: 100%;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > h1{\\nmargin-bottom: 20px;\\n}\\nlabel{\\n    font-weight: 500;\\n}\\n#content > main > div > div.d-flex.flex-column.flex-lg-row-fluid.w-lg-50.p-10.order-2.order-lg-1 > div > div{\\n    position: relative;\\n    top: 23%;\\n}\\nbody#login #loginForm table td input[type=\'submit\'] {\\n    background-color: #32ae93 !important;\\n    height: 40px;\\n    font-size: 16px !important;\\n    font-weight: 500 !important;\\n}\\n#login #page{\\nmax-width: 100%;\\n}\\n\\n@media (max-width: 992px) {\\n.w-lg-50 {\\n    width: 100% !important;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2{\\nheight: 20% !important;\\n}\\n#content > main > div > div.d-flex.flex-lg-row-fluid.w-lg-50.bgi-size-cover.bgi-position-center.order-1.order-lg-2 > div > img.h-60px.h-lg-75px{\\nmargin-top: 0rem !important;\\n}\\n}\\n<\\/style>\\n<script>\\n$( document ).ready(function() {\\n   $(\'#loginForm > table > tbody > tr:nth-child(3) > td:nth-child(2) > input\').val(\'Sign In\');\\n});\\n<\\/script>\",\n\"loginPageTop\": \"<div class=\\\"d-flex flex-column flex-lg-row flex-column-fluid\\\">\\n<div class=\\\"d-flex flex-column flex-lg-row-fluid w-lg-50 p-10 order-2 order-lg-1\\\">\\n<div class=\\\"d-flex flex-center flex-column flex-lg-row-fluid\\\">\",\n\"logo\": \"#appResource.joget_glass_logo.png#\",\n\"profile\": \"\",\n\"removeAssignmentTitle\": \"\",\n\"shortcut\": [],\n\"shortcutLinkLabel\": \"Shortcut\",\n\"subfooter\": \"\",\n\"subheader\": \"\",\n\"urlsToCache\": \"\",\n\"userImage\": \"\",\n\"userMenu\": [],\n\"welcome-message-style-font-size\": \"20px\",\n\"welcome-message-style-font-weight\": \"500\"\n}\n},\n\"userviewDescription\": \"\",\n\"userviewId\": \"home\",\n\"userviewName\": \"App Center\",\n\"userview_category\": \"\",\n\"userview_thumbnail\": \"\"\n}}\n}','2022-11-07 11:53:48','2022-11-07 11:53:48'),
('crm_community',1,'crm_userview_sales','CRM',NULL,'{\n\"categories\": [\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [{\n\"className\": \"org.joget.apps.userview.lib.HtmlPage\",\n\"properties\": {\n\"content\": \"<div id=\\\"left_content\\\">\\n<div style=\\\"margin-right: 10px;\\\">\\n<h4 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-size: inherit; line-height: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; font-weight: bold; color: #042c54;\\\">More Leads, More Sales, More Customers<\\/h4>\\n<h1 style=\\\"margin: 0px; padding: 0px; border-width: 0px; font: inherit; vertical-align: baseline; color: #1f4282;\\\"><span style=\\\"font-size: large;\\\"><strong>Business&nbsp;Customer Relationship Management<\\/strong><\\/span><\\/h1>\\n<p style=\\\"margin: 0px; padding: 30px 0px 0px; border-width: 0px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-size: inherit; font-size-adjust: inherit; font-stretch: inherit; vertical-align: baseline; color: #363636; line-height: 15px;\\\">CRM helps your business communicate with prospects, share sales information, close deals and keep customers happy.<img src=\\\"http://www.joget.org/images/demo/phone_pad.png\\\" alt=\\\"\\\" width=\\\"382\\\" height=\\\"302\\\" /><\\/p>\\n<\\/div>\\n<\\/div>\",\n\"customId\": \"welcome\",\n\"enableOffline\": \"\",\n\"id\": \"welcome\",\n\"label\": \"Welcome\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}],\n\"permission\": {\n\"className\": \"org.joget.apps.userview.model.UserviewPermission\",\n\"properties\": {}\n},\n\"properties\": {\n\"hide\": \"\",\n\"id\": \"category-9BE91A55FAAC4B5098841EA9E1994BE6\",\n\"label\": \"Home\",\n\"permission\": {\n\"className\": \"org.joget.plugin.enterprise.AnonymousUserviewPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [\n{\n\"className\": \"org.joget.apps.userview.lib.DataListMenu\",\n\"properties\": {\n\"buttonPosition\": \"topLeft\",\n\"cacheAllLinks\": \"\",\n\"cacheListAction\": \"\",\n\"checkboxPosition\": \"left\",\n\"customFooter\": \"\",\n\"customHeader\": \"<h2>#i18n.Account List#<\\/h2>\",\n\"customId\": \"account_list\",\n\"datalistId\": \"crm_account_list\",\n\"enableOffline\": \"\",\n\"id\": \"384344BD3E2946D097C6F5F17540C377\",\n\"keyName\": \"\",\n\"label\": \"Account List\",\n\"rowCount\": \"true\",\n\"selectionType\": \"multiple\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.FormMenu\",\n\"properties\": {\n\"cancelButtonLabel\": \"\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"customId\": \"account_new\",\n\"fieldPassover\": \"\",\n\"fieldPassoverMethod\": \"append\",\n\"formId\": \"crm_account\",\n\"id\": \"account_form\",\n\"keyName\": \"\",\n\"label\": \"New Account\",\n\"loadDataWithKey\": \"\",\n\"messageShowAfterComplete\": \"\",\n\"paramName\": \"\",\n\"readonly\": \"\",\n\"readonlyLabel\": \"\",\n\"redirectTargetOnCancel\": \"top\",\n\"redirectUrlAfterComplete\": \"account_list\",\n\"redirectUrlOnCancel\": \"account_list\",\n\"showInPopupDialog\": \"\",\n\"submitButtonLabel\": \"\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}\n],\n\"permission\": {\n\"className\": \"org.joget.apps.userview.model.UserviewPermission\",\n\"properties\": {}\n},\n\"properties\": {\n\"hide\": \"\",\n\"id\": \"category-7650DEEFC4CC4332AC25871B65BBDD48\",\n\"label\": \"Accounts\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [\n{\n\"className\": \"org.joget.apps.userview.lib.DataListMenu\",\n\"properties\": {\n\"buttonPosition\": \"topLeft\",\n\"cacheAllLinks\": \"\",\n\"cacheListAction\": \"\",\n\"checkboxPosition\": \"left\",\n\"customFooter\": \"\",\n\"customHeader\": \"<h2>#i18n.Contact List#<\\/h2>\",\n\"customId\": \"contact_list\",\n\"datalistId\": \"crm_contact_list\",\n\"enableOffline\": \"\",\n\"id\": \"D86B740C970C4B08B4D5CCD3DC0E9503\",\n\"keyName\": \"\",\n\"label\": \"Contact List\",\n\"rowCount\": \"true\",\n\"selectionType\": \"multiple\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.FormMenu\",\n\"properties\": {\n\"cancelButtonLabel\": \"\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"customId\": \"contact_new\",\n\"fieldPassover\": \"\",\n\"fieldPassoverMethod\": \"append\",\n\"formId\": \"crm_contact\",\n\"id\": \"contact-form\",\n\"keyName\": \"\",\n\"label\": \"New Contact\",\n\"loadDataWithKey\": \"\",\n\"messageShowAfterComplete\": \"\",\n\"paramName\": \"\",\n\"readonly\": \"\",\n\"readonlyLabel\": \"\",\n\"redirectTargetOnCancel\": \"top\",\n\"redirectUrlAfterComplete\": \"contact_list\",\n\"redirectUrlOnCancel\": \"contact_list\",\n\"showInPopupDialog\": \"\",\n\"submitButtonLabel\": \"\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}\n],\n\"permission\": {\n\"className\": \"org.joget.apps.userview.model.UserviewPermission\",\n\"properties\": {}\n},\n\"properties\": {\n\"hide\": \"\",\n\"id\": \"category-E77D2050680D4DB0A85A5C0C3AC1C083\",\n\"label\": \"Contacts\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [\n{\n\"className\": \"org.joget.apps.userview.lib.DataListMenu\",\n\"properties\": {\n\"buttonPosition\": \"topLeft\",\n\"cacheAllLinks\": \"\",\n\"cacheListAction\": \"\",\n\"checkboxPosition\": \"left\",\n\"customFooter\": \"\",\n\"customHeader\": \"<h2>#i18n.Opportunity List#<\\/h2>\",\n\"customId\": \"opportunity_list\",\n\"datalistId\": \"crm_opportunity_list\",\n\"enableOffline\": \"\",\n\"id\": \"A074397ABEA94CF78E2E8FA0843AB97B\",\n\"keyName\": \"\",\n\"label\": \"Opportunity List\",\n\"rowCount\": \"true\",\n\"selectionType\": \"multiple\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.FormMenu\",\n\"properties\": {\n\"cancelButtonLabel\": \"\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"customId\": \"opportunity_new\",\n\"fieldPassover\": \"\",\n\"fieldPassoverMethod\": \"append\",\n\"formId\": \"crm_opportunity\",\n\"id\": \"0C7E36768A2F46BB945CEC50E62E0BE8\",\n\"keyName\": \"\",\n\"label\": \"New Opportunity\",\n\"loadDataWithKey\": \"\",\n\"messageShowAfterComplete\": \"\",\n\"paramName\": \"\",\n\"readonly\": \"\",\n\"readonlyLabel\": \"\",\n\"redirectTargetOnCancel\": \"top\",\n\"redirectUrlAfterComplete\": \"opportunity_list\",\n\"redirectUrlOnCancel\": \"opportunity_list\",\n\"showInPopupDialog\": \"\",\n\"submitButtonLabel\": \"\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}\n],\n\"permission\": {\n\"className\": \"org.joget.apps.userview.model.UserviewPermission\",\n\"properties\": {}\n},\n\"properties\": {\n\"hide\": \"\",\n\"id\": \"category-A12DBDB14B4447A984E6095B77F28B42\",\n\"label\": \"Opportunities\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [\n{\n\"className\": \"org.joget.apps.userview.lib.DataListMenu\",\n\"properties\": {\n\"buttonPosition\": \"topLeft\",\n\"cacheAllLinks\": \"\",\n\"cacheListAction\": \"\",\n\"checkboxPosition\": \"left\",\n\"customFooter\": \"\",\n\"customHeader\": \"<h2>#i18n.View All Proposals#<\\/h2>\",\n\"customId\": \"view_all_proposal\",\n\"datalistId\": \"Proposal\",\n\"enableOffline\": \"\",\n\"id\": \"9E98D32002434ABFAABA3649DCA300F5\",\n\"keyName\": \"\",\n\"label\": \"View All Proposals\",\n\"rowCount\": \"true\",\n\"selectionType\": \"multiple\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.InboxMenu\",\n\"properties\": {\n\"appFilter\": \"process\",\n\"assignment-customFooter\": \"\",\n\"assignment-customHeader\": \"\",\n\"buttonPosition\": \"topLeft\",\n\"cacheAllLinks\": \"\",\n\"customId\": \"workflow_inbox\",\n\"enableOffline\": \"\",\n\"id\": \"AA1445B29D904408B3F2B1B36E469E16\",\n\"label\": \"Task Inbox\",\n\"list-customFooter\": \"\",\n\"list-customHeader\": \"<h2>#i18n.Task Inbox#<\\/h2>\\r\\n#i18n.page_Proposals Inbox_header#\",\n\"processId\": \"process1\",\n\"rowCount\": \"true\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n},\n{\n\"className\": \"org.joget.apps.userview.lib.RunProcess\",\n\"properties\": {\n\"customId\": \"proposal_process\",\n\"fieldPassover\": \"\",\n\"fieldPassoverMethod\": \"append\",\n\"id\": \"2D27B3875F234315A7A3562BD0E35AB2\",\n\"keyName\": \"\",\n\"label\": \"Submit New Proposal\",\n\"messageShowAfterComplete\": \"\",\n\"paramName\": \"\",\n\"processDefId\": \"process1\",\n\"redirectUrlAfterComplete\": \"view_all_proposal\",\n\"runProcessDirectly\": \"Yes\",\n\"runProcessSubmitLabel\": \"\",\n\"showInPopupDialog\": \"\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}\n],\n\"properties\": {\n\"hide\": \"\",\n\"id\": \"category-78EC0B8A1E8E483A93770714BB0D6F6E\",\n\"label\": \"Proposal Process\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [{\n\"className\": \"org.joget.apps.userview.lib.HtmlPage\",\n\"properties\": {\n\"content\": \"<div id=\\\"left_content\\\">\\n<div style=\\\"float: left; width: 400px; margin-right: 10px;\\\">#i18n.aboutpage#<\\/div>\\n<\\/div>\",\n\"customId\": \"about\",\n\"enableOffline\": \"\",\n\"id\": \"765269E3926049B0A21D16581EE188DF\",\n\"label\": \"About\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}],\n\"properties\": {\n\"comment\": \"\",\n\"hide\": \"\",\n\"id\": \"category-8739F2859D894A339404C2404CB9004E\",\n\"label\": \"a\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n},\n{\n\"className\": \"org.joget.apps.userview.model.UserviewCategory\",\n\"menus\": [{\n\"className\": \"org.joget.apps.userview.lib.FormMenu\",\n\"properties\": {\n\"cancelButtonLabel\": \"\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"customId\": \"ViewProposal\",\n\"fieldPassover\": \"\",\n\"fieldPassoverMethod\": \"append\",\n\"formId\": \"crm_proposal_approval_form\",\n\"id\": \"1A2E6106918040F484C342E1BB12B2A3\",\n\"keyName\": \"\",\n\"label\": \"View Proposal\",\n\"loadDataWithKey\": \"\",\n\"messageShowAfterComplete\": \"\",\n\"paramName\": \"\",\n\"readonly\": \"Yes\",\n\"readonlyLabel\": \"\",\n\"redirectTargetOnCancel\": \"top\",\n\"redirectUrlAfterComplete\": \"view_all_proposal\",\n\"redirectUrlOnCancel\": \"view_all_proposal\",\n\"showInPopupDialog\": \"\",\n\"submitButtonLabel\": \"\",\n\"userviewCacheDuration\": \"20\",\n\"userviewCacheScope\": \"\"\n}\n}],\n\"properties\": {\n\"comment\": \"\",\n\"hide\": \"yes\",\n\"id\": \"category-1AFAC018AFA848F2970403061E49EE72\",\n\"label\": \"Hidden\",\n\"permission\": {\n\"className\": \"org.joget.apps.userview.lib.LoggedInUserPermission\",\n\"properties\": {}\n}\n}\n}\n],\n\"className\": \"org.joget.apps.userview.model.Userview\",\n\"layout\": {\n\"className\": \"org.joget.apps.userview.model.UserviewLayout\",\n\"properties\": {\n\"afterMenu\": \"\",\n\"beforeMenu\": \"\",\n\"customFooter\": \"\",\n\"customHeader\": \"\",\n\"theme\": {\n\"className\": \"org.joget.apps.userview.lib.DefaultTheme\",\n\"properties\": {\n\"css\": \"\",\n\"js\": \"\"\n}\n}\n}\n},\n\"properties\": {\n\"description\": \"\",\n\"footerMessage\": \"Powered by Joget\",\n\"id\": \"crm_userview_sales\",\n\"logoutText\": \"Logout\",\n\"name\": \"#i18n.applicationName#\",\n\"welcomeMessage\": \"Sales Force Automation\"\n},\n\"setting\": {\n\"className\": \"org.joget.apps.userview.model.UserviewSetting\",\n\"properties\": {\n\"__\": \"\",\n\"hideThisUserviewInAppCenter\": \"\",\n\"permission\": {\n\"className\": \"\",\n\"properties\": {}\n},\n\"__\": \"\",\n\"theme\": {\n\"className\": \"org.joget.plugin.enterprise.Dx8ColorAdminTheme\",\n\"properties\": {\n\"accentColor\": \"BLUE\",\n\"buttonColor\": \"GREY\",\n\"buttonTextColor\": \"WHITE\",\n\"css\": \"\",\n\"disableHelpGuide\": \"\",\n\"disablePush\": \"\",\n\"disablePwa\": \"\",\n\"displayCategoryLabel\": \"\",\n\"dx8background\": \"\",\n\"dx8backgroundImage\": \"\",\n\"dx8buttonBackground\": \"\",\n\"dx8buttonColor\": \"\",\n\"dx8colorScheme\": \"rgb(233, 233, 233);rgb(255, 255, 255);rgb(157, 235, 249);rgb(0, 114, 82);rgb(0, 131, 143);rgb(0, 86, 98)\",\n\"dx8contentFontColor\": \"\",\n\"dx8contentbackground\": \"\",\n\"dx8fontColor\": \"\",\n\"dx8footerBackground\": \"\",\n\"dx8footerColor\": \"\",\n\"dx8headerColor\": \"\",\n\"dx8headerFontColor\": \"\",\n\"dx8linkActiveColor\": \"\",\n\"dx8linkColor\": \"\",\n\"dx8navActiveIconColor\": \"\",\n\"dx8navActiveLinkBackground\": \"\",\n\"dx8navActiveLinkColor\": \"\",\n\"dx8navBackground\": \"\",\n\"dx8navBadge\": \"\",\n\"dx8navBadgeText\": \"\",\n\"dx8navLinkBackground\": \"\",\n\"dx8navLinkColor\": \"\",\n\"dx8navLinkIcon\": \"\",\n\"dx8navScrollbarThumb\": \"\",\n\"dx8primaryColor\": \"\",\n\"enableResponsiveSwitch\": \"true\",\n\"fav_icon\": \"\",\n\"fontColor\": \"WHITE\",\n\"fontControl\": \"\",\n\"homeAttractBanner\": \"\",\n\"homeUrl\": \"\",\n\"horizontal_menu\": \"\",\n\"inbox\": \"current\",\n\"js\": \"\",\n\"loginBackground\": \"\",\n\"loginPageBottom\": \"\",\n\"loginPageTop\": \"\",\n\"logo\": \"\",\n\"menuFontColor\": \"BLACK\",\n\"primaryColor\": \"DARKROYALBLUE\",\n\"profile\": \"\",\n\"removeAssignmentTitle\": \"\",\n\"shortcut\": [],\n\"shortcutLinkLabel\": \"Shortcut\",\n\"subfooter\": \"\",\n\"subheader\": \"\",\n\"themeScheme\": \"light\",\n\"urlsToCache\": \"\",\n\"userImage\": \"\",\n\"userMenu\": []\n}\n},\n\"userviewDescription\": \"\",\n\"userviewId\": \"crm_userview_sales\",\n\"userviewName\": \"CRM\",\n\"userview_thumbnail\": \"#appResource.crm-icon7.png#\"\n}\n}\n}','2022-11-07 11:53:14','2022-11-07 11:53:14');
/*!40000 ALTER TABLE `app_userview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_department` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hod` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEE8AA4418CEBAE1` (`organizationId`),
  KEY `FKEEE8AA44EF6BB2B7` (`parentId`),
  KEY `FKEEE8AA4480DB1449` (`hod`),
  CONSTRAINT `FKEEE8AA4418CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKEEE8AA4480DB1449` FOREIGN KEY (`hod`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FKEEE8AA44EF6BB2B7` FOREIGN KEY (`parentId`) REFERENCES `dir_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_department` WRITE;
/*!40000 ALTER TABLE `dir_department` DISABLE KEYS */;
INSERT INTO `dir_department` VALUES
('D-001','CEO Office','','ORG-001','4028808127f4ef840127f5efdbfb004f',NULL),
('D-002','Human Resource and Admin','','ORG-001','4028808127f4ef840127f5f41d4b0091',NULL),
('D-003','Finance','','ORG-001','4028808127f4ef840127f606242400b3',NULL),
('D-004','Marketing','','ORG-001','4028808127f4ef840127f5f20f36007a',NULL),
('D-005','Product Development','','ORG-001','4028808127f4ef840127f5f04dc2005a',NULL),
('D-006','Training and Consulting','','ORG-001','4028808127f4ef840127f5f7c5b500a5',NULL),
('D-007','Support and Services','','ORG-001','4028808127fb4d350127ff78d63300d1',NULL);
/*!40000 ALTER TABLE `dir_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `employeeCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gradeId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC6620ADE716AE35F` (`departmentId`),
  KEY `FKC6620ADE14CE02E9` (`gradeId`),
  KEY `FKC6620ADECE539211` (`userId`),
  KEY `FKC6620ADE18CEBAE1` (`organizationId`),
  CONSTRAINT `FKC6620ADE14CE02E9` FOREIGN KEY (`gradeId`) REFERENCES `dir_grade` (`id`),
  CONSTRAINT `FKC6620ADE18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`),
  CONSTRAINT `FKC6620ADE716AE35F` FOREIGN KEY (`departmentId`) REFERENCES `dir_department` (`id`),
  CONSTRAINT `FKC6620ADECE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_employment` WRITE;
/*!40000 ALTER TABLE `dir_employment` DISABLE KEYS */;
INSERT INTO `dir_employment` VALUES
('4028808127f4ef840127f5efdbfb004f','terry',NULL,NULL,NULL,NULL,'G-001','D-001','ORG-001'),
('4028808127f4ef840127f5f04dc2005a','clark',NULL,NULL,NULL,NULL,'G-002','D-005','ORG-001'),
('4028808127f4ef840127f5f11cf60068','cat',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),
('4028808127f4ef840127f5f194e20071','tana',NULL,NULL,NULL,NULL,'G-003','D-005','ORG-001'),
('4028808127f4ef840127f5f20f36007a','roy',NULL,NULL,NULL,NULL,'G-002','D-004','ORG-001'),
('4028808127f4ef840127f5f319720088','etta',NULL,NULL,NULL,NULL,'G-003','D-004','ORG-001'),
('4028808127f4ef840127f5f41d4b0091','sasha',NULL,NULL,NULL,NULL,'G-002','D-002','ORG-001'),
('4028808127f4ef840127f5f7c5b500a5','jack',NULL,NULL,NULL,NULL,'G-002','D-006','ORG-001'),
('4028808127f4ef840127f606242400b3','tina',NULL,NULL,NULL,NULL,'G-002','D-003','ORG-001'),
('4028808127fb4d350127ff78d63300d1','david',NULL,NULL,NULL,NULL,'G-002','D-007','ORG-001'),
('4028808127fb4d350127ff84074600f2','julia',NULL,NULL,NULL,NULL,'G-003','D-002','ORG-001');
/*!40000 ALTER TABLE `dir_employment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_employment_report_to` (
  `employmentId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportToId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employmentId`,`reportToId`),
  KEY `FK53622945F4068416` (`reportToId`),
  KEY `FK536229452787E613` (`employmentId`),
  CONSTRAINT `FK536229452787E613` FOREIGN KEY (`employmentId`) REFERENCES `dir_employment` (`id`),
  CONSTRAINT `FK53622945F4068416` FOREIGN KEY (`reportToId`) REFERENCES `dir_employment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_employment_report_to` WRITE;
/*!40000 ALTER TABLE `dir_employment_report_to` DISABLE KEYS */;
INSERT INTO `dir_employment_report_to` VALUES
('4028808127f4ef840127f5f04dc2005a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f04e9b005f'),
('4028808127f4ef840127f5f20f36007a','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f20fb7007f'),
('4028808127f4ef840127f5f41d4b0091','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f48eda009e'),
('4028808127f4ef840127f5f7c5b500a5','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f5f7c60b00aa'),
('4028808127f4ef840127f606242400b3','4028808127f4ef840127f5efdbfb004f','4028808127f4ef840127f60624c100b8'),
('4028808127fb4d350127ff78d63300d1','4028808127f4ef840127f5efdbfb004f','4028808127fb4d350127ff78d6fe00d6');
/*!40000 ALTER TABLE `dir_employment_report_to` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_grade` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A49A518CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A49A518CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_grade` WRITE;
/*!40000 ALTER TABLE `dir_grade` DISABLE KEYS */;
INSERT INTO `dir_grade` VALUES
('G-001','Board Members','','ORG-001'),
('G-002','Managers','','ORG-001'),
('G-003','Executives','','ORG-001');
/*!40000 ALTER TABLE `dir_grade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_group` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizationId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBC9A804D18CEBAE1` (`organizationId`),
  CONSTRAINT `FKBC9A804D18CEBAE1` FOREIGN KEY (`organizationId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_group` WRITE;
/*!40000 ALTER TABLE `dir_group` DISABLE KEYS */;
INSERT INTO `dir_group` VALUES
('G-001','Managers','',NULL),
('G-002','CxO','',NULL),
('G-003','hrAdmin','',NULL);
/*!40000 ALTER TABLE `dir_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_organization` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55A15FA5961BD498` (`parentId`),
  CONSTRAINT `FK55A15FA5961BD498` FOREIGN KEY (`parentId`) REFERENCES `dir_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_organization` WRITE;
/*!40000 ALTER TABLE `dir_organization` DISABLE KEYS */;
INSERT INTO `dir_organization` VALUES
('ORG-001','Joget.Org','',NULL);
/*!40000 ALTER TABLE `dir_organization` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_role` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_role` WRITE;
/*!40000 ALTER TABLE `dir_role` DISABLE KEYS */;
INSERT INTO `dir_role` VALUES
('ROLE_ADMIN','Admin','Administrator'),
('ROLE_USER','User','Normal User');
/*!40000 ALTER TABLE `dir_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `timeZone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user` WRITE;
/*!40000 ALTER TABLE `dir_user` DISABLE KEYS */;
INSERT INTO `dir_user` VALUES
('admin','admin','21232f297a57a5a743894a0e4a801fc3','Admin','Admin',NULL,1,'0',NULL),
('cat','cat','5f4dcc3b5aa765d61d8327deb882cf99','Cat','Grant','',1,'',NULL),
('clark','clark','5f4dcc3b5aa765d61d8327deb882cf99','Clark','Kent','',1,'',NULL),
('david','david','5f4dcc3b5aa765d61d8327deb882cf99','David','Cain','',1,'',NULL),
('etta','etta','5f4dcc3b5aa765d61d8327deb882cf99','Etta','Candy','',1,'',NULL),
('jack','jack','5f4dcc3b5aa765d61d8327deb882cf99','Jack','Drake','',1,'',NULL),
('julia','julia','5f4dcc3b5aa765d61d8327deb882cf99','Julia','Kapatelis','',1,'',NULL),
('roy','roy','5f4dcc3b5aa765d61d8327deb882cf99','Roy','Harper','',1,'',NULL),
('sasha','sasha','5f4dcc3b5aa765d61d8327deb882cf99','Sasha','Bordeaux','',1,'',NULL),
('tana','tana','5f4dcc3b5aa765d61d8327deb882cf99','Tana','Moon','',1,'',NULL),
('terry','terry','5f4dcc3b5aa765d61d8327deb882cf99','Terry','Berg','',1,'',NULL),
('tina','tina','5f4dcc3b5aa765d61d8327deb882cf99','Tina','Magee','',1,'',NULL);
/*!40000 ALTER TABLE `dir_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_extra` (
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `algorithm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loginAttempt` int(11) DEFAULT NULL,
  `failedloginAttempt` int(11) DEFAULT NULL,
  `lastLogedInDate` datetime DEFAULT NULL,
  `lockOutDate` datetime DEFAULT NULL,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `requiredPasswordChange` bit(1) DEFAULT NULL,
  `noPasswordExpiration` bit(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_extra` WRITE;
/*!40000 ALTER TABLE `dir_user_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_extra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_group` (
  `groupId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `FK2F0367FD159B6639` (`groupId`),
  KEY `FK2F0367FDCE539211` (`userId`),
  CONSTRAINT `FK2F0367FD159B6639` FOREIGN KEY (`groupId`) REFERENCES `dir_group` (`id`),
  CONSTRAINT `FK2F0367FDCE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_group` WRITE;
/*!40000 ALTER TABLE `dir_user_group` DISABLE KEYS */;
INSERT INTO `dir_user_group` VALUES
('G-001','clark'),
('G-001','david'),
('G-001','jack'),
('G-003','julia'),
('G-001','roy'),
('G-001','sasha'),
('G-003','sasha'),
('G-002','terry'),
('G-001','tina');
/*!40000 ALTER TABLE `dir_user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_meta` (
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`,`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_meta` WRITE;
/*!40000 ALTER TABLE `dir_user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_meta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_password_history` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_password_history` WRITE;
/*!40000 ALTER TABLE `dir_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_replacement` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replacementUser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processIds` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_replacement` WRITE;
/*!40000 ALTER TABLE `dir_user_replacement` DISABLE KEYS */;
/*!40000 ALTER TABLE `dir_user_replacement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dir_user_role` (
  `roleId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK5C5FE738C8FE3CA7` (`roleId`),
  KEY `FK5C5FE738CE539211` (`userId`),
  CONSTRAINT `FK5C5FE738C8FE3CA7` FOREIGN KEY (`roleId`) REFERENCES `dir_role` (`id`),
  CONSTRAINT `FK5C5FE738CE539211` FOREIGN KEY (`userId`) REFERENCES `dir_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `dir_user_role` WRITE;
/*!40000 ALTER TABLE `dir_user_role` DISABLE KEYS */;
INSERT INTO `dir_user_role` VALUES
('ROLE_ADMIN','admin'),
('ROLE_USER','cat'),
('ROLE_USER','clark'),
('ROLE_USER','david'),
('ROLE_USER','etta'),
('ROLE_USER','jack'),
('ROLE_USER','julia'),
('ROLE_USER','roy'),
('ROLE_USER','sasha'),
('ROLE_USER','tana'),
('ROLE_USER','terry'),
('ROLE_USER','tina');
/*!40000 ALTER TABLE `dir_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectid` (
  `nextoid` decimal(19,0) NOT NULL,
  PRIMARY KEY (`nextoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `objectid` WRITE;
/*!40000 ALTER TABLE `objectid` DISABLE KEYS */;
INSERT INTO `objectid` VALUES
(1000400);
/*!40000 ALTER TABLE `objectid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_audit_trail` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clazz` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_audit_trail` WRITE;
/*!40000 ALTER TABLE `wf_audit_trail` DISABLE KEYS */;
INSERT INTO `wf_audit_trail` VALUES
('ff808081845038300184503872ed0000','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=false}','2022-11-07 11:53:07',NULL,NULL),
('ff8080818450383001845038731b0001','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:07',NULL,NULL),
('ff808081845038300184503886560002','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_account\", appId:\"crm_community\", appVersion:\"1\", name:\"Account Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886750003','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff8080818450383001845038868c0004','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_contact\", appId:\"crm_community\", appVersion:\"1\", name:\"Contact Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff8080818450383001845038869b0005','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886b60006','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_opportunity\", appId:\"crm_community\", appVersion:\"1\", name:\"Opportunity Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886c50007','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886cf0008','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_proposal_approval_form\", appId:\"crm_community\", appVersion:\"1\", name:\"Proposal Approval Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886e00009','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886ef000a','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_proposal_form\", appId:\"crm_community\", appVersion:\"1\", name:\"Proposal Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff808081845038300184503886ff000b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff8080818450383001845038870a000c','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_proposal_resubmit_form\", appId:\"crm_community\", appVersion:\"1\", name:\"Proposal Resubmit Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff8080818450383001845038871d000d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:12',NULL,NULL),
('ff80808184503830018450388736000e','roleAnonymous','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"crm_proposal_sending_form\", appId:\"crm_community\", appVersion:\"1\", name:\"Proposal Sending Form\", dateCreated:\"Mon Nov 07 11:53:12 MYT 2022\", dateModified:\"Mon Nov 07 11:53:12 MYT 2022\"}','2022-11-07 11:53:12',NULL,NULL),
('ff80808184503830018450388ee5000f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388ef40010','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id:\"crm_account_list\", appId:\"crm_community\", appVersion:\"1\", name:\"Account Listing\", dateCreated:\"Mon Nov 07 11:53:14 MYT 2022\", dateModified:\"Mon Nov 07 11:53:14 MYT 2022\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f0d0011','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f260012','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id:\"crm_contact_list\", appId:\"crm_community\", appVersion:\"1\", name:\"Contact List\", dateCreated:\"Mon Nov 07 11:53:14 MYT 2022\", dateModified:\"Mon Nov 07 11:53:14 MYT 2022\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f450013','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f560014','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id:\"crm_opportunity_list\", appId:\"crm_community\", appVersion:\"1\", name:\"Opportunity List\", dateCreated:\"Mon Nov 07 11:53:14 MYT 2022\", dateModified:\"Mon Nov 07 11:53:14 MYT 2022\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f680015','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f7b0016','roleAnonymous','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id:\"Proposal\", appId:\"crm_community\", appVersion:\"1\", name:\"Proposal List\", dateCreated:\"Mon Nov 07 11:53:14 MYT 2022\", dateModified:\"Mon Nov 07 11:53:14 MYT 2022\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388f9d0017','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388fb30018','roleAnonymous','org.joget.apps.app.dao.UserviewDefinitionDaoImpl','add','{id:\"crm_userview_sales\", appId:\"crm_community\", appVersion:\"1\", name:\"CRM\", dateCreated:\"Mon Nov 07 11:53:14 MYT 2022\", dateModified:\"Mon Nov 07 11:53:14 MYT 2022\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388fc80019','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388fcb001a','roleAnonymous','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"AppName\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388fd4001b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388fd7001c','roleAnonymous','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"refNo\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450388ff5001d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:14',NULL,NULL),
('ff80808184503830018450389007001e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"About_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389010001f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890130020','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"aboutpage_en_US\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038901f0021','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890210022','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"aboutpage_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038902c0023','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038902e0024','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Account Details_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890380025','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038903d0026','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Account ID_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890430027','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890460028','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Account List_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038904d0029','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389057002a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Account Name_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038905c002b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038905d002c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Account_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389066002d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389068002e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Accounts_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389092002f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890950030','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Add Account_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038909b0031','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038909d0032','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Add Contact_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890a70033','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890a90034','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Add Opportunity_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890b10035','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890b30036','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Address Available_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890b90037','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890bb0038','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Address Details_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890c60039','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890cb003a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Address_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890d3003b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890d5003c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Amount_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890d9003d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890da003e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"applicationName_en_US\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890de003f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503890df0040','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"applicationName_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891030041','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891060042','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Approved_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038910a0043','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038910e0044','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Approver Action_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891140045','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891150046','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Approver Comments_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038911b0047','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038911d0048','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Attachment_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891220049','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389126004a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"City_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038912c004b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038912d004c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Contact Details_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389133004d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389135004e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Contact List_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038913a004f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891400050','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Contacts_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891430051','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891440052','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Country_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891490053','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038914a0054','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Date Modified_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891510055','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891570056','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Delete Row_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038915b0057','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038915c0058','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Delete_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891660059','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389171005a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Description_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038917d005b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389180005c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Direct_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389186005d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389188005e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Existing Account_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038918d005f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038918f0060','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"First Name_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891940061','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891950062','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"form_hints_en_US\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038919a0063','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038919e0064','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"form_hints_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891a40065','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891a70066','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Full Name_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891ae0067','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891b10068','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Hidden_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891b50069','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891b6006a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Home_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891c2006b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891c4006c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Hyperlink_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891c8006d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891ca006e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Indirect_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891d2006f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891d40070','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"International_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891db0071','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891de0072','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Last Name_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891e30073','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891e60074','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Local_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891eb0075','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891ec0076','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Lost_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891f60077','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503891f80078','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"New Account_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892000079','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389208007a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"New Contact_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389213007b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389215007c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"New Opportunity_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389218007d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389219007e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"No_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389220007f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892220080','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Notes_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892270081','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892290082','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Open_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038922c0083','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038922e0084','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Opportunities_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892310085','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892320086','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Opportunity List_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038923d0087','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038923e0088','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Opportunity_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892410089','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389244008a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"page_Proposals Inbox_header_en_US\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038924d008b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038924e008c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"page_Proposals Inbox_header_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389253008d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389254008e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Photo_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038925b008f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038925d0090','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Proposal Approval_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892610091','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892630092','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Proposal Form_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038926f0093','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892710094','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Proposal Process_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892770095','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892780096','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Proposal Resubmission_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038927c0097','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038927e0098','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Proposal Resubmit_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892840099','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038928c009a','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Reference No_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389294009b','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389296009c','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Rejected_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389298009d','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff80808184503830018450389299009e','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Resubmit_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038929c009f','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038929d00a0','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Send Proposal_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892a300a1','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892a500a2','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Source_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892ae00a3','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892af00a4','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Stage_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892b300a5','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892b600a6','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"State_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892bf00a7','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892c100a8','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Status_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892c700a9','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892cc00aa','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Submit New Proposal_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892d700ab','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892d900ac','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Task Inbox_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892de00ad','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892e000ae','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Title_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892e500af','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892e700b0','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"View All Proposals_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892ee00b1','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892f100b2','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"View Proposal_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892f500b3','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892f600b4','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"View_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892fb00b5','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff808081845038300184503892fd00b6','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Welcome_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038930100b7','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038930500b8','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Won_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038930e00b9','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038931200ba','roleAnonymous','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Yes_zh_CN\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038931f00bb','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038932400bc','roleAnonymous','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"crm-icon7.png\", appId:\"crm_community\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:15',NULL,NULL),
('ff8080818450383001845038965500bd','roleAnonymous','org.joget.workflow.model.service.WorkflowManagerImpl','processUpload','','2022-11-07 11:53:16','crm_community','1'),
('ff8080818450383001845038975c00be','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=false}','2022-11-07 11:53:16','crm_community','1'),
('ff808081845038300184503897b500bf','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:16','crm_community','1'),
('ff808081845038300184503897c300c0','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:16','crm_community','1'),
('ff808081845038300184503897cc00c1','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038981400c2','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038981600c3','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038982700c4','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038982f00c5','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038984f00c6','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038985100c7','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038986100c8','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038986400c9','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityForm','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038987f00ca','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038988d00cb','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038989100cc','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityPlugin','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038989900cd','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff808081845038300184503898a600ce','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff808081845038300184503898a800cf','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppActivityPlugin','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff808081845038300184503898d600d0','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff808081845038300184503898f100d1','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff808081845038300184503898f600d2','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038990500d3','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038990e00d4','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038991100d5','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038991700d6','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038992000d7','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038992200d8','roleAnonymous','org.joget.apps.app.dao.PackageDefinitionDaoImpl','addAppParticipant','crm_community','2022-11-07 11:53:17','crm_community','1'),
('ff8080818450383001845038992700d9','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=false}','2022-11-07 11:53:17','crm_community','1'),
('ff80808184503830018450389bd300da','roleAnonymous','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=crm_community, version=1, published=true}','2022-11-07 11:53:18','crm_community','1'),
('ff808081845038300184503910a300db','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=appcenter, version=1, published=false}','2022-11-07 11:53:47',NULL,NULL),
('ff808081845038300184503910b500dc','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:47',NULL,NULL),
('ff8080818450383001845039118c00dd','admin','org.joget.apps.app.dao.FormDefinitionDaoImpl','add','{id:\"landing\", appId:\"appcenter\", appVersion:\"1\", name:\"Published Apps\", dateCreated:\"Mon Nov 07 11:53:48 MYT 2022\", dateModified:\"Mon Nov 07 11:53:48 MYT 2022\"}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503913df00de','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503913f300df','admin','org.joget.apps.app.dao.DatalistDefinitionDaoImpl','add','{id:\"applist\", appId:\"appcenter\", appVersion:\"1\", name:\"App List\", dateCreated:\"Mon Nov 07 11:53:48 MYT 2022\", dateModified:\"Mon Nov 07 11:53:48 MYT 2022\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039140800e0','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039141900e1','admin','org.joget.apps.app.dao.UserviewDefinitionDaoImpl','add','{id:\"home\", appId:\"appcenter\", appVersion:\"1\", name:\"App Center\", dateCreated:\"Mon Nov 07 11:53:48 MYT 2022\", dateModified:\"Mon Nov 07 11:53:48 MYT 2022\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039142f00e2','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039144300e3','admin','org.joget.apps.app.dao.BuilderDefinitionDaoImpl','add','{id:\"INTERNAL_TAGGING\", appId:\"appcenter\", appVersion:\"1\", name:\"Tagging\", dateCreated:\"Mon Nov 07 11:53:48 MYT 2022\", dateModified:\"Mon Nov 07 11:53:48 MYT 2022\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039144c00e4','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039145900e5','admin','org.joget.apps.app.dao.BuilderDefinitionDaoImpl','add','{id:\"up-8C70B71371B942B6D48A7E9B4C1DB8D1\", appId:\"appcenter\", appVersion:\"1\", name:\"Home\", dateCreated:\"Mon Nov 07 11:53:48 MYT 2022\", dateModified:\"Mon Nov 07 11:53:48 MYT 2022\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039146b00e6','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039146c00e7','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_APMData\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039146e00e8','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039146f00e9','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_AppCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039147200ea','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039147300eb','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_datalistCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039147700ec','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039147800ed','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_formCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039147a00ee','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148000ef','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_ghc\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148500f0','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148600f1','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_ghcStatus\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148800f2','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148900f3','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_groupCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148b00f4','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148c00f5','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_nodeCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039148f00f6','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039149000f7','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_processCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039149600f8','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039149600f9','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_UserCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff8080818450383001845039149f00fa','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914a300fb','admin','org.joget.apps.app.dao.EnvironmentVariableDaoImpl','add','{id:\"appCenter_userviewCount\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914a800fc','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914a900fd','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"<i class=\'fa fa-home\'></i> Home_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914ab00fe','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914ad00ff','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"<i class=\'fa fa-home\'></i> Home_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914b80100','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914c10101','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"All Apps_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914c60102','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:48',NULL,NULL),
('ff808081845038300184503914cd0103','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"All Apps_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914d10104','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914d70105','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"App Center_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914de0106','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914df0107','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"App Center_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914e10108','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914e20109','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Design New App_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914e6010a','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914e8010b','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Design New App_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914ea010c','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914ec010d','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Download from Marketplace_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914f2010e','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914f3010f','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Download from Marketplace_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914f50110','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914f60111','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Faster, Simpler Digital Transformation_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914fe0112','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503914fe0113','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Faster, Simpler Digital Transformation_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915000114','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915010115','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Import App_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915050116','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915060117','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Import App_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915070118','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915090119','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Incorrect Username and/or Password_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039150b011a','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039150c011b','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Incorrect Username and/or Password_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039150e011c','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039150e011d','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Login_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391512011e','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391513011f','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Login_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915150120','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039151a0121','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Monitor_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039151c0122','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039151c0123','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Monitor_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039151e0124','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039151f0125','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Password_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915220126','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915230127','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Password_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915250128','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915260129','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Powered by Joget_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391527012a','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391528012b','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Powered by Joget_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039152c012c','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039152c012d','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Published Apps_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039152e012e','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039152f012f','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Published Apps_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915300130','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915310131','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Settings_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915330132','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915330133','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Settings_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039153a0134','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039153b0135','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Username_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039153d0136','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039153e0137','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Username_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915400138','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915430139','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Users_zh_CN\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391546013a','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391546013b','admin','org.joget.apps.app.dao.MessageDaoImpl','add','{id:\"Users_zh_TW\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391549013c','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039154a013d','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"build_app.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039154c013e','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039154d013f','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"finalBanner.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039154f0140','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915500141','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"image.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915510142','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915520143','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"joget_glass_logo.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915590144','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff8080818450383001845039155e0145','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"Joget_logo__Reverse_White_Register.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915600146','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915620147','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"jogetAcademy.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915630148','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff808081845038300184503915640149','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"jogetPages.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391566014a','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','updateDateModified','{id=appcenter, version=1, published=false}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391567014b','admin','org.joget.apps.app.dao.AppResourceDaoImpl','add','{id:\"loginImg.png\", appId:\"appcenter\", appVersion:\"1\", name:\"null\", dateCreated:\"null\", dateModified:\"null\"}','2022-11-07 11:53:49',NULL,NULL),
('ff80808184503830018450391641014c','admin','org.joget.apps.app.dao.AppDefinitionDaoImpl','saveOrUpdate','{id=appcenter, version=1, published=true}','2022-11-07 11:53:49','appcenter','1');
/*!40000 ALTER TABLE `wf_audit_trail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_history_activity` (
  `activityId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` bigint(20) DEFAULT NULL,
  `accepted` bigint(20) DEFAULT NULL,
  `lastStateTime` bigint(20) DEFAULT NULL,
  `limitDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participantId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignmentUsers` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activityId`),
  KEY `FK_7mmrnb28ugrdxpf0dpw35y73u` (`processId`),
  CONSTRAINT `FK_7mmrnb28ugrdxpf0dpw35y73u` FOREIGN KEY (`processId`) REFERENCES `wf_history_process` (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_history_activity` WRITE;
/*!40000 ALTER TABLE `wf_history_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_history_activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_history_process` (
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processRequesterId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resourceRequesterId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` bigint(20) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `lastStateTime` bigint(20) DEFAULT NULL,
  `limitDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processId`),
  CONSTRAINT `FK_prxyxtqy6byfrq3l5qght53l6` FOREIGN KEY (`processId`) REFERENCES `wf_process_link_history` (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_history_process` WRITE;
/*!40000 ALTER TABLE `wf_history_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_history_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_process_link` (
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_process_link` WRITE;
/*!40000 ALTER TABLE `wf_process_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_process_link_history` (
  `processId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originProcessId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_process_link_history` WRITE;
/*!40000 ALTER TABLE `wf_process_link_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_process_link_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report` (
  `activityInstanceId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processInstanceId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `startedTime` datetime DEFAULT NULL,
  `dateLimit` bigint(20) DEFAULT NULL,
  `due` datetime DEFAULT NULL,
  `delay` bigint(20) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `timeConsumingFromDateCreated` bigint(20) DEFAULT NULL,
  `timeConsumingFromDateStarted` bigint(20) DEFAULT NULL,
  `performer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameOfAcceptedUser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignmentUsers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appVersion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityInstanceId`),
  KEY `FKB943CCA47A4E8F48` (`packageId`),
  KEY `FKB943CCA4A39D6461` (`processDefId`),
  KEY `FKB943CCA4CB863F` (`activityDefId`),
  CONSTRAINT `FKB943CCA47A4E8F48` FOREIGN KEY (`packageId`) REFERENCES `wf_report_package` (`packageId`),
  CONSTRAINT `FKB943CCA4A39D6461` FOREIGN KEY (`processDefId`) REFERENCES `wf_report_process` (`processDefId`),
  CONSTRAINT `FKB943CCA4CB863F` FOREIGN KEY (`activityDefId`) REFERENCES `wf_report_activity` (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_report` WRITE;
/*!40000 ALTER TABLE `wf_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_activity` (
  `activityDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activityName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activityDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_report_activity` WRITE;
/*!40000 ALTER TABLE `wf_report_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_package` (
  `packageId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_report_package` WRITE;
/*!40000 ALTER TABLE `wf_report_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_package` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_report_process` (
  `processDefId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`processDefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_report_process` WRITE;
/*!40000 ALTER TABLE `wf_report_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_report_process` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_resource_bundle_message` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageKey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_resource_bundle_message` WRITE;
/*!40000 ALTER TABLE `wf_resource_bundle_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wf_resource_bundle_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wf_setup` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wf_setup` WRITE;
/*!40000 ALTER TABLE `wf_setup` DISABLE KEYS */;
INSERT INTO `wf_setup` VALUES
('4028c4ea79850c7c0179850cc3880001','deleteProcessOnCompletion','archive',NULL),
('ff80808184503830018450391671014d','defaultUserview','appcenter/home',NULL);
/*!40000 ALTER TABLE `wf_setup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

