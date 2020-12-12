[cleanUpEntity]
DELETE FROM building_application_entity 
WHERE appid = $P{appid} 
AND objid NOT IN ( SELECT applicantid FROM building_application WHERE objid=$P{appid} )
AND objid NOT IN ( SELECT ownerid FROM building_application_rpu WHERE appid=$P{appid} )
AND objid NOT IN ( SELECT entityid FROM building_application_professional WHERE appid=$P{appid} )

[findOrphan]
SELECT COUNT(*) AS counter 
FROM building_application_entity 
WHERE appid = $P{appid} 
AND objid NOT IN ( SELECT applicantid FROM building_application WHERE objid=$P{appid} )
AND objid NOT IN ( SELECT ownerid FROM building_application_rpu WHERE appid=$P{appid} )
AND objid NOT IN ( SELECT entityid FROM building_application_professional WHERE appid=$P{appid} )