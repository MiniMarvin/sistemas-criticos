/* awsEc2Simulator
 * Author: 
 * Creation date: 27/08/2022
 */
MACHINE
    awsEc2Simulator

SEES
    awsEc2SimulatorCtx

CONSTANTS
    admin
    
PROPERTIES
    admin : USERS

VARIABLES
    machineResources,
    machineResourceProperties,
    admins,
    clients,
    virtualMachines,
    virtualMachineProperties,
    vmCategories,
    spotVirtualMachines,
    allocatedVirtualMachines

INVARIANT
    USERS: FIN(USERS)
    & admins <: USERS
    & clients <: USERS
    & admins /\ clients = {}
    & admins /= {}
    & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES)
    & machineResources <: MACHINE_RESOURCES
    & machineResourceProperties : machineResources +-> struct(
            cpu : NAT1, 
            hdd : NAT1, 
            mem : NAT1
        )
    & VIRTUAL_MACHINES : FIN(VIRTUAL_MACHINES)
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
    admins := {admin}
    || clients := {}
    || machineResources := {}
    || machineResourceProperties := {}
    || virtualMachines := {}
    || virtualMachineProperties := {}
    || vmCategories := {allocated, spot}
    || spotVirtualMachines := {}
    || allocatedVirtualMachines := {}

OPERATIONS
    addClient(user, caller) =
    PRE
        user : USERS
        & user /: clients
        & user /: admins
        & caller : admins
    THEN
        clients := clients \/ {user}
    END;
    
    addAdmin(user, caller) =
    PRE
        user : USERS
        & user /: clients
        & user /: admins
        & caller : admins
    THEN
        admins := admins \/ {user}
    END;
    
    removeAdmin(user, caller) =
    PRE
        user: USERS
        & user: admins
        & admins - {user} /= {}
        & caller : admins
    THEN
        admins := admins - {user}
    END;
    
    removeClient(user, caller) =
    PRE
        // TODO guarantee the shutdown of every service owned by this client
        user : USERS
        & user : clients
        & caller : admins
    THEN
        clients := clients - {user}
    END;
    
    clientList <-- listClients(user, caller) =
    PRE
        user : USERS
        & caller : admins
    THEN
        clientList := clients
    END;
    
    addResource(cpu, hdd, mem, caller) =
    PRE
        cpu : NAT1
        & hdd : NAT1
        & mem : NAT1
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
    END;
    
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
