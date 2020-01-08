DROP VIEW IF EXISTS vw_building_permit_professional;
CREATE VIEW vw_building_permit_professional AS 
SELECT 
   a.*,
   e.name,  
   e.firstname, 
   e.lastname, 
   e.middlename, 
   e.address_text, 
   e.tin, 
   e.id 
FROM building_permit_professional a 
INNER JOIN building_permit_entity e ON a.entityid = e.objid;