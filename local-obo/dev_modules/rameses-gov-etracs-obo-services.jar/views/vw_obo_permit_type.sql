DROP VIEW IF EXISTS vw_obo_permit_type;
CREATE VIEW vw_obo_permit_type AS 
SELECT 
 ot.*,
 et.org_objid,
 et.org_name,
 et.buildingpermitstate,
 et.occupancypermitstate
FROM obo_permit_type ot 
LEFT JOIN obo_section et ON ot.sectionid = et.objid 