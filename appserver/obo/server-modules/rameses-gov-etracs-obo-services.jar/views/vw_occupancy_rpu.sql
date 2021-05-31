DROP VIEW IF EXISTS `vw_occupancy_rpu`;
CREATE VIEW vw_occupancy_rpu AS 
SELECT 
orpu.*,
oc.apptype,
oc.bldgpermitid,
bp.objid AS bldgappid,
bp.controlno AS bldgpermitno,
bp.dtissued AS bldgpermitdtissued,
oc.objid AS occpermitid,
oc.controlno AS occpermitno,
oc.dtissued AS occpermitdtissued,
oc.applicantid,
oc.actualprojectcost,
oc.occupancytypeid,
oc.actualnumunits,
oc.actualnumfloors,
oc.actualtotalfloorarea,
oc.actualheight,
oc.dtactualstarted,
oc.dtactualcompleted,
oc.inspectiondate,
oc.title,
oc.location_text

FROM occupancy_rpu orpu 
INNER JOIN vw_occupancy_certificate oc ON orpu.appid=oc.objid  
INNER JOIN vw_building_permit bp ON oc.bldgpermitid = bp.objid ;


