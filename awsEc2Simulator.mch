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
    instanceRating,
    finishedInstanceCost

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
    & finishedInstanceCost : USERS +-> NAT
    & instanceRating : {allocated, spot} +-> struct(cpu: NAT, hdd: NAT, mem: NAT)

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
    || instanceRating := {}
    || finishedInstanceCost := {}

OPERATIONS
    setInstanceRating(instanceType, cpuRating, hddRating, memRating, caller) =
    PRE
        instanceType : {allocated, spot}
        & cpuRating: NAT1
        & hddRating : NAT1
        & memRating : NAT1
        & hddRating : NAT1
        & caller : {admin}
    THEN
        instanceRating(instanceType) := rec(cpu: cpuRating, hdd: hddRating, mem: memRating)
    END;
    
    addClient(user, caller) =
    PRE
        user : USERS
        & user /: clients
        & user /: admins
        & caller : admins
    THEN
        clients := clients \/ {user}
        || finishedInstanceCost(user) := 0
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
        & {vmp | vmp : ran(virtualMachineProperties) & vmp'owner = user} = {}
    THEN
        clients := clients - {user}
        || finishedInstanceCost := {user} <<| finishedInstanceCost
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
                        - SIGMA virtualMachine . (
                            virtualMachine : virtualMachines
                            & (virtualMachineProperties(virtualMachine))'residentMachine = machine
                            & (virtualMachineProperties(virtualMachine))'category = allocated
                            | (virtualMachineProperties(virtualMachine))'cpu
                        )
            )
            & hdd <= (
                (machineResourceProperties(machine))'hdd
                    - SIGMA virtualMachine . (
                            virtualMachine : virtualMachines
                            & (virtualMachineProperties(virtualMachine))'residentMachine = machine
                            & (virtualMachineProperties(virtualMachine))'category = allocated
                            | (virtualMachineProperties(virtualMachine))'hdd
                        )
            )
            & mem <= (
                (machineResourceProperties(machine))'mem
                    - SIGMA virtualMachine . (
                            virtualMachine : virtualMachines
                            & (virtualMachineProperties(virtualMachine))'residentMachine = machine
                            & (virtualMachineProperties(virtualMachine))'category = allocated
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
                - SIGMA vm . (
                        vm : dom(virtualMachineProperties)
                        & (virtualMachineProperties(vm))'residentMachine = machine
                        | (virtualMachineProperties(vm))'cpu
                    )
            )
            & hdd <= (
                (machineResourceProperties(machine))'hdd
                -  SIGMA vm . (
                        vm : dom(virtualMachineProperties)
                        & (virtualMachineProperties(vm))'residentMachine = machine
                        | (virtualMachineProperties(vm))'hdd
                )
            )
            & mem <= (
                (machineResourceProperties(machine))'mem
                -  SIGMA vm . (
                    (    
                            vm : dom(virtualMachineProperties)
                            & ((virtualMachineProperties(vm))'residentMachine = machine)) 
                            | (virtualMachineProperties(vm))'mem
                        )
            )
        THEN
            virtualMachines := virtualMachines \/ {vm}
            || spotVirtualMachines := spotVirtualMachines \/ {vm}
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

    removeVirtualMachine(vm, caller) =
    PRE
        vm : virtualMachines
        & vm : dom(virtualMachineProperties)
        & caller : admins \/ {(virtualMachineProperties(vm))'owner}
        & (virtualMachineProperties(vm))'owner : USERS
        & (virtualMachineProperties(vm))'owner : dom(finishedInstanceCost) 
        & finishedInstanceCost((virtualMachineProperties(vm))'owner) > 0
        & (virtualMachineProperties(vm))'category : dom(instanceRating)
        &  ((instanceRating((virtualMachineProperties(vm))'category))'cpu)  > 0
        &  ((virtualMachineProperties(vm))'cpu)  > 0
        & currentTime >= (virtualMachineProperties(vm))'startTime
    THEN // all of those are necessarily true because they exists
        // TODO: remove from virtualMachineProperties
        virtualMachines := virtualMachines - {vm}
        || virtualMachineProperties := {vm} <<| virtualMachineProperties
        || allocatedVirtualMachines := allocatedVirtualMachines - {vm}
        || spotVirtualMachines := spotVirtualMachines - {vm}
        || finishedInstanceCost((virtualMachineProperties(vm))'owner) := 
            finishedInstanceCost((virtualMachineProperties(vm))'owner)
            + (((instanceRating((virtualMachineProperties(vm))'category))'cpu) 
                * ((virtualMachineProperties(vm))'cpu) 
                * (currentTime -  (virtualMachineProperties(vm))'startTime))
            + (((instanceRating((virtualMachineProperties(vm))'category))'hdd) 
                * ((virtualMachineProperties(vm))'hdd) 
                * (currentTime -  (virtualMachineProperties(vm))'startTime))
            + (((instanceRating((virtualMachineProperties(vm))'category))'mem) 
                * ((virtualMachineProperties(vm))'mem) 
                * (currentTime -  (virtualMachineProperties(vm))'startTime))
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
        totalCpu := SIGMA vm . (
            (
                vm : dom(virtualMachineProperties)
                & ((virtualMachineProperties(vm))'residentMachine = machine)
            ) | (virtualMachineProperties(vm))'cpu
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
                            (vm : dom(virtualMachineProperties))
                            & ((virtualMachineProperties(vm))'owner = user) 
                        }
    END;
    
    billing <-- getBillingForRunningVM(vm, caller) =
    PRE
        vm : virtualMachines
        & caller : USERS
        & caller : admins \/ {(virtualMachineProperties(vm))'owner}
        & ((virtualMachineProperties(vm))'category) : dom(instanceRating)
    THEN
        billing := (((instanceRating((virtualMachineProperties(vm))'category))'cpu) 
                        * ((virtualMachineProperties(vm))'cpu) 
                        * (currentTime -  (virtualMachineProperties(vm))'startTime))
                    + (((instanceRating((virtualMachineProperties(vm))'category))'hdd) 
                        * ((virtualMachineProperties(vm))'hdd) 
                        * (currentTime -  (virtualMachineProperties(vm))'startTime))
                    + (((instanceRating((virtualMachineProperties(vm))'category))'mem) 
                        * ((virtualMachineProperties(vm))'mem) 
                        * (currentTime -  (virtualMachineProperties(vm))'startTime))
    END;
    
    billing <-- getBillingForUser(user, caller) =
    PRE
        user : clients
        & user : dom(finishedInstanceCost)
        & caller : admins \/ {user}

    THEN
        // comprehension over finite set must be finite
        billing := SIGMA vm . (
            vm : dom(virtualMachineProperties)
            & (virtualMachineProperties(vm))'owner = user
            & (virtualMachineProperties(vm))'category : dom(instanceRating)
            | 
            (virtualMachineProperties(vm))'cpu 
                * ((instanceRating((virtualMachineProperties(vm))'category))'cpu) 
                * (currentTime - ((virtualMachineProperties(vm))'startTime))
            + (virtualMachineProperties(vm))'hdd 
                * ((instanceRating((virtualMachineProperties(vm))'category))'hdd) 
                * (currentTime - ((virtualMachineProperties(vm))'startTime))
            + (virtualMachineProperties(vm))'mem 
                * ((instanceRating((virtualMachineProperties(vm))'category))'mem) 
                * (currentTime - ((virtualMachineProperties(vm))'startTime))
        ) + finishedInstanceCost(user)
    END

END
