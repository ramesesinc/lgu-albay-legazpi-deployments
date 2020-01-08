DROP VIEW IF EXISTS vw_building_permit_ancillary;
CREATE VIEW vw_building_permit_ancillary AS 
SELECT 
   a.*,
    pt.title,
    pt.sectionid,
    pt.sortorder    
FROM building_permit_ancillary a 
INNER JOIN obo_permit_type pt ON a.permittypeid = pt.objid 

