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
    allocatedVirtualMachines,
    currentTime,
    vmHistory,
    instanceRating

INVARIANT
    USERS: FIN(USERS)
    & admins <: USERS
    & clients <: USERS
    & admins /\ clients = {}
    & admins /= {}
    & currentTime : NAT
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
    & virtualMachines : FIN(virtualMachines)
    & virtualMachineProperties : virtualMachines --> struct(
            residentMachine: MACHINE_RESOURCES,
            owner: USERS,
            category: VM_CATEGORIES,
            startTime: NAT,
            cpu: NAT1,
            hdd : NAT1,
            mem: NAT1
        )
    & virtualMachineProperties : FIN(virtualMachineProperties)
    & spotVirtualMachines <: virtualMachines
    & allocatedVirtualMachines <: virtualMachines
    & spotVirtualMachines \/ allocatedVirtualMachines = virtualMachines
    & spotVirtualMachines /\ allocatedVirtualMachines = {}
    & vmHistory : clients +-> struct(
            category: VM_CATEGORIES, 
            startTime: NAT, 
            endTime: NAT
        )
    & instanceRating : {allocated, spot} <-> NAT


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
    || currentTime := 0
    || vmHistory := {}
    || instanceRating := {allocated |-> 2, spot |-> 1}

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
        || vmHistory := {user} <<| vmHistory
    END;
    
    clientList <-- listClients(user, caller) =
    PRE
        user : USERS
        & caller : admins
    THEN
        clientList := clients
    END;
    
    tickTimer = 
    BEGIN
        currentTime := (currentTime + 1) mod (MAXINT - 1)
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
            || machineResourceProperties(resource) := rec(cpu: cpu, hdd: hdd, mem: mem)
        END
    END;
    
    removeResource(resource, caller) = 
    PRE
        resource : machineResources
        & resource : machineResources
        & caller : admins
        & {  vm | 
                (vm : virtualMachines)
                & ((virtualMachineProperties(vm))'residentMachine = resource) 
            } = {}
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
                    -  SIGMA virtualMachine . (
                    (virtualMachine : 
                        {  vm | 
                            (vm : virtualMachines)
                            & ((virtualMachineProperties(vm))'residentMachine = machine) 
                            & ((virtualMachineProperties(vm))'category = allocated) 
                        }
                    ) | (virtualMachineProperties(virtualMachine))'cpu)
            )
            & hdd <= (
                (machineResourceProperties(machine))'hdd
                    -  SIGMA virtualMachine . (
                    (virtualMachine : 
                        {  vm | 
                            (vm : virtualMachines)
                            & ((virtualMachineProperties(vm))'residentMachine = machine) 
                            & ((virtualMachineProperties(vm))'category = allocated) 
                        }
                    ) | (virtualMachineProperties(virtualMachine))'hdd)
            )
            & mem <= (
                (machineResourceProperties(machine))'mem
                -  SIGMA virtualMachine . (
                    (virtualMachine : 
                        {  vm | 
                            (vm : virtualMachines)
                            & ((virtualMachineProperties(vm))'residentMachine = machine) 
                            & ((virtualMachineProperties(vm))'category = allocated) 
                        }
                    ) | (virtualMachineProperties(virtualMachine))'mem)
            )
        THEN
            virtualMachines := virtualMachines \/ {vm}
            || allocatedVirtualMachines := allocatedVirtualMachines \/ {vm}
            || virtualMachineProperties(vm) := rec(
                    residentMachine : machine,
                    owner : client,
                    category: allocated,
                    startTime: currentTime,
                    cpu : cpu,
                    hdd : hdd,
                    mem : mem
                )
            // || dealocate all the necessary Spot machines necessary
        END
    END;
    
    addSpotVirtualMachine(cpu, hdd, mem, client) = 
    PRE
        cpu : NAT1
        & hdd : NAT1
        & mem : NAT1
        & client : clients
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
                -  SIGMA virtualMachine . (
                    (    
                            virtualMachine : virtualMachines
                            & ((virtualMachineProperties(virtualMachine))'residentMachine = machine)) 
                            | (virtualMachineProperties(virtualMachine))'cpu
                        )
            )
            & hdd <= (
                (machineResourceProperties(machine))'hdd
                -  SIGMA virtualMachine . (
                    (    
                            virtualMachine : virtualMachines
                            & ((virtualMachineProperties(virtualMachine))'residentMachine = machine)) 
                            | (virtualMachineProperties(virtualMachine))'hdd
                        )
            )
            & mem <= (
                (machineResourceProperties(machine))'mem
                -  SIGMA virtualMachine . (
                    (    
                            virtualMachine : virtualMachines
                            & ((virtualMachineProperties(virtualMachine))'residentMachine = machine)) 
                            | (virtualMachineProperties(virtualMachine))'mem
                        )
            )
        THEN
            virtualMachines := virtualMachines \/ {vm}
            || allocatedVirtualMachines := allocatedVirtualMachines \/ {vm}
            || virtualMachineProperties(vm) := rec(
                    residentMachine : machine,
                    owner : client,
                    category: allocated,
                    startTime: currentTime,
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
        vms := {  vm | 
                        (vm : virtualMachines)
                        & ((virtualMachineProperties(vm))'residentMachine = machine) 
                    }
    END;
    
    totalCpu <-- getAllocatedCpuOnMachine(machine) =
    PRE
        machine : machineResources
        & machine : dom(machineResourceProperties)
    THEN // TODO: proove it's a finite set
        // That's a finite set because it's a subset of ran(virtualMachineProperties)
        // which is finite itself
        totalCpu := SIGMA virtualMachine . (
            (
                virtualMachine : virtualMachines
                & ((virtualMachineProperties(virtualMachine))'residentMachine = machine)) 
                | (virtualMachineProperties(virtualMachine))'cpu
            )
    END;

    vmList <-- listVmsForUser(resourceTypes, user, caller) =
    PRE
        resourceTypes <: VM_CATEGORIES
        & user : USERS
        & caller : USERS
        & caller : admins \/ {user}
    THEN
        vmList := {  vm | 
                            (vm : virtualMachines)
                            & ((virtualMachineProperties(vm))'owner = user) 
                        }
    END
    
//    billing <-- getBillingForVM(vm, caller) =
//    PRE
//        vm : virtualMachines
//        & caller : USERS
//        & caller : admins \/ {(virtualMachineProperties(vm))'owner}
//        & (virtualMachineProperties(vm))'owner : dom(vmHistory)
//    THEN
//        billing := SIGMA vmd . (
//            vmd : vmHistory((virtualMachineProperties(vm))'owner)
//            | instanceRating(vmd'category) //*(vmd'endTime - vmd'startTime)
//        )
//    END

END
