DROP VIEW IF EXISTS vw_occupancy_permit;
CREATE VIEW vw_occupancy_permit AS 
SELECT 
   op.*,
   bp.title,
   bp.location_barangay_name AS  location_text, 
   t.state AS task_state,
   t.startdate AS task_startdate,
   t.enddate AS task_enddate,
   t.assignee_objid AS task_assignee_objid,
   t.assignee_name AS task_assignee_name,
   t.actor_objid AS task_actor_objid,
   t.actor_name AS task_actor_name,
   (SELECT title FROM sys_wf_node WHERE processname = 'occupancy_permit' AND name=t.state) AS task_title,

   (op.totalmaterialcost + op.totaldirectlaborcost + op.totalequipmentcost + op.totalothercost) AS totalprojectcost

FROM occupancy_permit op 
INNER JOIN occupancy_permit_task t ON op.taskid = t.taskid
INNER JOIN building_permit bp ON op.bldgpermitid=bp.objid

