/* virtualMachineManager
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    virtualMachineManager

SEES
    virtualMachineManagerCtx ,
    userManagerCtx ,
    machineResourceManagerCtx ,
    machineResourceManager ,
    userManager

ABSTRACT_VARIABLES
    virtualMachines ,
    virtualMachineProperties ,
    vmCategories ,
    spotVirtualMachines ,
    allocatedVirtualMachines

INVARIANT
    VIRTUAL_MACHINES : FIN ( VIRTUAL_MACHINES )
    & VM_CATEGORIES : FIN ( VM_CATEGORIES )
    & vmCategories <: VM_CATEGORIES
    & virtualMachines <: VIRTUAL_MACHINES
    & virtualMachineProperties : virtualMachines +-> struct (
            residentMachine : MACHINE_RESOURCES ,
            owner : USERS ,
            category : VM_CATEGORIES ,
            cpu : NAT ,
            hdd : NAT ,
            mem : NAT
        )
    & spotVirtualMachines <: virtualMachines
    & allocatedVirtualMachines <: virtualMachines
    & spotVirtualMachines \/ allocatedVirtualMachines = virtualMachines
    & spotVirtualMachines /\ allocatedVirtualMachines = {}

INITIALISATION
    virtualMachines := {}
    || virtualMachineProperties := {}
    || vmCategories := { allocated , spot }
    || spotVirtualMachines := {}
    || allocatedVirtualMachines := {}

OPERATIONS
    addAllocatedVirtualMachine ( cpu , hdd , mem , client ) =
    PRE
        cpu : NAT
        & hdd : NAT
        & mem : NAT
        & client : clients
    THEN
        ANY machine , vm
        WHERE
            vm : VIRTUAL_MACHINES
            & vm /: virtualMachines
            & vm /: spotVirtualMachines
            & vm /: allocatedVirtualMachines
            & machine : machineResources
            & machine : dom ( machineResourceProperties )
            & cpu <= ( machineResourceProperties ( machine ) ) ' cpu
            & hdd <= ( machineResourceProperties ( machine ) ) ' hdd
            & mem <= ( machineResourceProperties ( machine ) ) ' mem
            & spotVirtualMachines \/ allocatedVirtualMachines = virtualMachines
        THEN
            virtualMachines := virtualMachines \/ { vm }
            || allocatedVirtualMachines := allocatedVirtualMachines \/ { vm }
            || virtualMachineProperties ( vm ) := rec (
                    residentMachine : machine ,
                    owner : client ,
                    category : allocated ,
                    cpu : cpu ,
                    hdd : hdd ,
                    mem : mem
                )
        END
    END ;

    vms <-- getAllocatedVmsOnMachine ( machine ) =
    PRE
        machine : machineResources
        & machine : dom ( machineResourceProperties )
    THEN
        vms := struct (
            residentMachine : { machine } ,
            owner : USERS ,
            category : VM_CATEGORIES ,
            cpu : NAT ,
            hdd : NAT ,
            mem : NAT
        ) /\ ran ( virtualMachineProperties )
    END

END
