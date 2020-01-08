DROP VIEW IF EXISTS vw_occupancy_permit;
CREATE VIEW vw_occupancy_permit AS 
SELECT 
   op.*,

   a.description AS description,
   a.title AS title,
   a.location_lotno AS location_lotno,
   a.location_blockno AS location_blockno,
   a.location_street AS location_street,
   a.location_barangay_name AS location_barangay_name,
   a.location_barangay_objid AS location_barangay_objid,
   a.objid AS bldgpermit_objid,
   a.numunits AS bldgpermit_numunits,
   a.fixedcost AS bldgpermit_fixedcost,
   a.projectcost AS bldgpermit_projectcost,
   a.dtproposedconstruction AS bldgpermit_dtproposedconstruction,
   a.dtexpectedcompletion AS bldgpermit_dtexpectedcompletion,
   a.totalfloorarea AS bldgpermit_totalfloorarea,
   a.height AS bldgpermit_height,
   a.numfloors AS bldgpermit_numfloors,
   a.worktypes AS bldgpermit_worktypes,
   a.permitno AS bldgpermit_permitno,
   a.dtissued AS bldgpermit_dtissued,
   a.appno AS bldgpermit_appno,


   e.name AS applicant_name,
   e.objid AS applicant_objid,
   bt.objid AS occupancytype_objid,
   bt.title AS occupancytype_title,   
   od.objid AS occupancytype_division_objid,
   od.title AS occupancytype_division_title,   
   og.objid AS occupancytype_group_objid,
   og.title AS occupancytype_group_title,   

   zc.objid AS zoneclass_objid,
   zc.title AS zoneclass_title,

   LTRIM(CONCAT(
      (CASE WHEN a.location_lotno IS NULL THEN '' ELSE CONCAT( ' ', a.location_lotno) END),
      (CASE WHEN a.location_blockno IS NULL THEN '' ELSE CONCAT(' ', a.location_blockno) END),
      (CASE WHEN a.location_street IS NULL THEN '' ELSE CONCAT(' ', a.location_street) END),
      (CASE WHEN a.location_barangay_name IS NULL THEN '' ELSE CONCAT(' ', a.location_barangay_name ) END)
   )) AS location_address_text,

   t.state AS task_state,
   t.startdate AS task_startdate,
   t.enddate AS task_enddate,
   t.assignee_objid AS task_assignee_objid,
   t.assignee_name AS task_assignee_name,
   t.actor_objid AS task_actor_objid,
   t.actor_name AS task_actor_name,
   (SELECT title FROM sys_wf_node WHERE processname = 'occupancy_permit' AND name=t.state) AS task_title

FROM occupancy_permit op 
INNER JOIN building_permit a ON op.bldgpermitid = a.objid 
INNER JOIN building_permit_entity e ON a.applicantid = e.objid
INNER JOIN occupancy_permit_task t ON op.taskid = t.taskid
INNER JOIN obo_occupancy_type bt ON op.occupancytypeid = bt.objid
INNER JOIN obo_occupancy_type_division od ON bt.divisionid = od.objid
INNER JOIN obo_occupancy_type_group og ON od.groupid = og.objid
LEFT JOIN obo_zoneclass zc ON a.zoneclassid = zc.objid


