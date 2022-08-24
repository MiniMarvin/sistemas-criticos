/* machineResourceManager
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    machineResourceManager

SEES
    userManager,
    machineResourceManagerCtx

VARIABLES
    machineResources,
    machineResourceProperties

INVARIANT
    MACHINE_RESOURCES: FIN(MACHINE_RESOURCES)
    & machineResources <: MACHINE_RESOURCES
    & machineResourceProperties : machineResources +-> struct(cpu : NAT, hdd : NAT, mem : NAT)

INITIALISATION
    machineResources := {}
    || machineResourceProperties := {}

OPERATIONS
    addResource(cpu, hdd, mem, caller) =
    PRE
        cpu : NAT
        & hdd : NAT
        & mem : NAT
        & caller : admins
    THEN
        ANY resource
        WHERE 
            resource : MACHINE_RESOURCES
            & resource /: machineResources
            & resource /: dom(machineResourceProperties)
        THEN
            machineResources := machineResources \/ {resource}
            || machineResourceProperties(resource) := rec(cpu, hdd, mem)
        END
    END;
    
    // TODO: ensure that the machine doesn't have any virtual machine on it
    removeResource(resource, caller) = 
    PRE
        resource : MACHINE_RESOURCES
        & resource : machineResources
        & caller : admins
    THEN
        machineResources := machineResources - {resource}
        || machineResourceProperties := {resource} <<| machineResourceProperties 
    END;
    
    resourceList <-- listResources =
    BEGIN
        resourceList := machineResourceProperties
    END

END
