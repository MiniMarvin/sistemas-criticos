/* virtualMachineManager
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    virtualMachineManager

SEES
    virtualMachineManagerCtx,
    userManagerCtx,
    machineResourceManagerCtx,
    machineResourceManager,
    userManager

VARIABLES
    virtualMachines,
    virtualMachineProperties,
    vmCategories,
    spotVirtualMachines,
    allocatedVirtualMachines

INVARIANT
    VIRTUAL_MACHINES : FIN(VIRTUAL_MACHINES)
    & VM_CATEGORIES : FIN(VM_CATEGORIES)
    & vmCategories <: VM_CATEGORIES
    & virtualMachines <: VIRTUAL_MACHINES
    & virtualMachineProperties : virtualMachines --> struct(
            residentMachine: MACHINE_RESOURCES,
            owner: USERS,
            category: VM_CATEGORIES,
            cpu: NAT1,
            hdd : NAT1,
            mem: NAT1
        )
    & virtualMachineProperties : FIN(virtualMachineProperties)
    & card(virtualMachineProperties) < card(VIRTUAL_MACHINES)
    & spotVirtualMachines <: virtualMachines
    & allocatedVirtualMachines <: virtualMachines
    & spotVirtualMachines \/ allocatedVirtualMachines = virtualMachines
    & spotVirtualMachines /\ allocatedVirtualMachines = {}
    
INITIALISATION
    virtualMachines := {}
    || virtualMachineProperties := {}
    || vmCategories := {allocated, spot}
    || spotVirtualMachines := {}
    || allocatedVirtualMachines := {}

OPERATIONS
    addAllocatedVirtualMachine(cpu, hdd, mem, client) = 
    PRE
        cpu : NAT1
        & hdd : NAT1
        & mem : NAT1
        & client : clients
        & card(virtualMachineProperties) < vmLimit
    THEN
        ANY machine, vm
        WHERE
            vm : VIRTUAL_MACHINES
            & vm /: virtualMachines
            & vm /: spotVirtualMachines
            & vm /: allocatedVirtualMachines
            & machine : machineResources
            & machine : dom(machineResourceProperties)
            & cpu <= (
                (machineResourceProperties(machine))'cpu
//                - SIGMA vm . (vm : struct(
//                    residentMachine: {machine},
//                    owner:USERS,
//                    category: {allocated},
//                    cpu:NAT1,
//                    hdd:NAT1,
//                    mem:NAT1
//                ) /\ ran(virtualMachineProperties) | vm'cpu)
            )
            & hdd <= (
                (machineResourceProperties(machine))'hdd
//                - SIGMA vm . (vm : struct(
//                    residentMachine: {machine},
//                    owner:USERS,
//                    category: {allocated},
//                    cpu:NAT1,
//                    hdd:NAT1,
//                    mem:NAT1
//                ) /\ ran(virtualMachineProperties) | vm'hdd)
            )
            & mem <= (
                (machineResourceProperties(machine))'mem
//                - SIGMA vm . (vm : struct(
//                    residentMachine: {machine},
//                    owner:USERS,
//                    category: {allocated},
//                    cpu:NAT1,
//                    hdd:NAT1,
//                    mem:NAT1
//                ) /\ ran(virtualMachineProperties) | vm'mem)
            )
        THEN
            virtualMachines := virtualMachines \/ {vm}
            || allocatedVirtualMachines := allocatedVirtualMachines \/ {vm}
            || virtualMachineProperties(vm) := rec(
                    residentMachine : machine,
                    owner : client,
                    category: allocated,
                    cpu : cpu,
                    hdd : hdd,
                    mem : mem
                )
        END
    END;
    
    vms <-- getAllocatedVmsOnMachine(machine) =
    PRE
        machine : machineResources
        & machine : dom(machineResourceProperties)
    THEN
        vms := struct(
            residentMachine: {machine},
            owner:USERS,
            category: VM_CATEGORIES,
            cpu:NAT1,
            hdd:NAT1,
            mem:NAT1
        ) /\ ran(virtualMachineProperties)
    END;
    
    totalCpu <-- getAllocatedCpuOnMachine(machine) =
    PRE
        machine : machineResources
        & machine : dom(machineResourceProperties)
    THEN // TODO: proove it's a finite set
        totalCpu := SIGMA vm . (
            vm : ran(virtualMachineProperties) 
            /\  struct(
                residentMachine: {machine},
                owner:USERS,
                category: VM_CATEGORIES,
                cpu:NAT1,
                hdd:NAT1,
                mem:NAT1
            ) | vm'cpu)
    END;

    vmList <-- listVmsForUser(resourceTypes, user, caller) =
    PRE
        resourceTypes <: VM_CATEGORIES
        & user : USERS
        & caller : USERS
        & caller : admins \/ {user}
    THEN
        vmList := struct(
            residentMachine: MACHINE_RESOURCES,
            owner: {user},
            category: resourceTypes,
            cpu:NAT1,
            hdd:NAT1,
            mem:NAT1
        ) /\ ran(virtualMachineProperties)
    END

END
