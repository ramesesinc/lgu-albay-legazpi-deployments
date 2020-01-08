[getBuildingPermitStates]
SELECT * FROM sys_wf_node WHERE nodetype = 'state' AND tracktime = 1 AND processname = 'building_permit'

[getOccupancyPermitStates]
SELECT * FROM sys_wf_node WHERE nodetype = 'state' AND tracktime = 1 AND processname = 'occupancy_permit'