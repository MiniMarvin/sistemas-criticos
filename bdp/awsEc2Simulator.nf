Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(awsEc2Simulator))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(awsEc2Simulator))==(Machine(awsEc2Simulator));
  Level(Machine(awsEc2Simulator))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(awsEc2Simulator)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(awsEc2Simulator))==(awsEc2SimulatorCtx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(awsEc2Simulator))==(?);
  List_Includes(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(awsEc2Simulator))==(?);
  Context_List_Variables(Machine(awsEc2Simulator))==(?);
  Abstract_List_Variables(Machine(awsEc2Simulator))==(?);
  Local_List_Variables(Machine(awsEc2Simulator))==(finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  List_Variables(Machine(awsEc2Simulator))==(finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  External_List_Variables(Machine(awsEc2Simulator))==(finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(awsEc2Simulator))==(?);
  Abstract_List_VisibleVariables(Machine(awsEc2Simulator))==(?);
  External_List_VisibleVariables(Machine(awsEc2Simulator))==(?);
  Expanded_List_VisibleVariables(Machine(awsEc2Simulator))==(?);
  List_VisibleVariables(Machine(awsEc2Simulator))==(?);
  Internal_List_VisibleVariables(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(awsEc2Simulator))==(btrue);
  Gluing_List_Invariant(Machine(awsEc2Simulator))==(btrue);
  Expanded_List_Invariant(Machine(awsEc2Simulator))==(btrue);
  Abstract_List_Invariant(Machine(awsEc2Simulator))==(btrue);
  Context_List_Invariant(Machine(awsEc2Simulator))==(USERS: FIN(USERS) & VM_CATEGORIES: FIN(VM_CATEGORIES) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES));
  List_Invariant(Machine(awsEc2Simulator))==(USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={} & currentTime: NAT & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES) & machineResources <: MACHINE_RESOURCES & machineResourceProperties: machineResources +-> struct(cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & VM_CATEGORIES: FIN(VM_CATEGORIES) & vmCategories <: VM_CATEGORIES & virtualMachines <: VIRTUAL_MACHINES & virtualMachines: FIN(virtualMachines) & virtualMachineProperties: virtualMachines --> struct(residentMachine>>MACHINE_RESOURCES,owner>>USERS,category>>VM_CATEGORIES,startTime>>NAT,cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & virtualMachineProperties: FIN(virtualMachineProperties) & spotVirtualMachines <: virtualMachines & allocatedVirtualMachines <: virtualMachines & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines & spotVirtualMachines/\allocatedVirtualMachines = {} & finishedInstanceCost: USERS +-> NAT & instanceRating: {allocated,spot} +-> struct(cpu>>NAT,hdd>>NAT,mem>>NAT))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(awsEc2Simulator))==(btrue);
  Abstract_List_Assertions(Machine(awsEc2Simulator))==(btrue);
  Context_List_Assertions(Machine(awsEc2Simulator))==(btrue);
  List_Assertions(Machine(awsEc2Simulator))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(awsEc2Simulator))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(awsEc2Simulator))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(awsEc2Simulator))==(admins,clients,machineResources,machineResourceProperties,virtualMachines,virtualMachineProperties,vmCategories,spotVirtualMachines,allocatedVirtualMachines,currentTime,instanceRating,finishedInstanceCost:={admin},{},{},{},{},{},{allocated,spot},{},{},0,{},{});
  Context_List_Initialisation(Machine(awsEc2Simulator))==(skip);
  List_Initialisation(Machine(awsEc2Simulator))==(admins:={admin} || clients:={} || machineResources:={} || machineResourceProperties:={} || virtualMachines:={} || virtualMachineProperties:={} || vmCategories:={allocated,spot} || spotVirtualMachines:={} || allocatedVirtualMachines:={} || currentTime:=0 || instanceRating:={} || finishedInstanceCost:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(awsEc2Simulator),Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(awsEc2Simulator))==(btrue);
  List_Constraints(Machine(awsEc2Simulator))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(awsEc2Simulator))==(setInstanceRating,addClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser);
  List_Operations(Machine(awsEc2Simulator))==(setInstanceRating,addClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser)
END
&
THEORY ListInputX IS
  List_Input(Machine(awsEc2Simulator),setInstanceRating)==(instanceType,cpuRating,hddRating,memRating,caller);
  List_Input(Machine(awsEc2Simulator),addClient)==(user,caller);
  List_Input(Machine(awsEc2Simulator),addAdmin)==(user,caller);
  List_Input(Machine(awsEc2Simulator),removeAdmin)==(user,caller);
  List_Input(Machine(awsEc2Simulator),removeClient)==(user,caller);
  List_Input(Machine(awsEc2Simulator),listClients)==(user,caller);
  List_Input(Machine(awsEc2Simulator),tickTimer)==(?);
  List_Input(Machine(awsEc2Simulator),addResource)==(cpu,hdd,mem,caller);
  List_Input(Machine(awsEc2Simulator),removeResource)==(resource,caller);
  List_Input(Machine(awsEc2Simulator),listResources)==(?);
  List_Input(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Machine(awsEc2Simulator),addSpotVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Machine(awsEc2Simulator),removeVirtualMachine)==(vm,caller);
  List_Input(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine);
  List_Input(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine);
  List_Input(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes,user,caller);
  List_Input(Machine(awsEc2Simulator),getBillingForRunningVM)==(vm,caller);
  List_Input(Machine(awsEc2Simulator),getBillingForUser)==(user,caller)
END
&
THEORY ListOutputX IS
  List_Output(Machine(awsEc2Simulator),setInstanceRating)==(?);
  List_Output(Machine(awsEc2Simulator),addClient)==(?);
  List_Output(Machine(awsEc2Simulator),addAdmin)==(?);
  List_Output(Machine(awsEc2Simulator),removeAdmin)==(?);
  List_Output(Machine(awsEc2Simulator),removeClient)==(?);
  List_Output(Machine(awsEc2Simulator),listClients)==(clientList);
  List_Output(Machine(awsEc2Simulator),tickTimer)==(?);
  List_Output(Machine(awsEc2Simulator),addResource)==(?);
  List_Output(Machine(awsEc2Simulator),removeResource)==(?);
  List_Output(Machine(awsEc2Simulator),listResources)==(resourceList);
  List_Output(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(?);
  List_Output(Machine(awsEc2Simulator),addSpotVirtualMachine)==(?);
  List_Output(Machine(awsEc2Simulator),removeVirtualMachine)==(?);
  List_Output(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms);
  List_Output(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu);
  List_Output(Machine(awsEc2Simulator),listVmsForUser)==(vmList);
  List_Output(Machine(awsEc2Simulator),getBillingForRunningVM)==(billing);
  List_Output(Machine(awsEc2Simulator),getBillingForUser)==(billing)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(awsEc2Simulator),setInstanceRating)==(setInstanceRating(instanceType,cpuRating,hddRating,memRating,caller));
  List_Header(Machine(awsEc2Simulator),addClient)==(addClient(user,caller));
  List_Header(Machine(awsEc2Simulator),addAdmin)==(addAdmin(user,caller));
  List_Header(Machine(awsEc2Simulator),removeAdmin)==(removeAdmin(user,caller));
  List_Header(Machine(awsEc2Simulator),removeClient)==(removeClient(user,caller));
  List_Header(Machine(awsEc2Simulator),listClients)==(clientList <-- listClients(user,caller));
  List_Header(Machine(awsEc2Simulator),tickTimer)==(tickTimer);
  List_Header(Machine(awsEc2Simulator),addResource)==(addResource(cpu,hdd,mem,caller));
  List_Header(Machine(awsEc2Simulator),removeResource)==(removeResource(resource,caller));
  List_Header(Machine(awsEc2Simulator),listResources)==(resourceList <-- listResources);
  List_Header(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(addAllocatedVirtualMachine(cpu,hdd,mem,client));
  List_Header(Machine(awsEc2Simulator),addSpotVirtualMachine)==(addSpotVirtualMachine(cpu,hdd,mem,client));
  List_Header(Machine(awsEc2Simulator),removeVirtualMachine)==(removeVirtualMachine(vm,caller));
  List_Header(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms <-- getAllocatedVmsOnMachine(machine));
  List_Header(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu <-- getAllocatedCpuOnMachine(machine));
  List_Header(Machine(awsEc2Simulator),listVmsForUser)==(vmList <-- listVmsForUser(resourceTypes,user,caller));
  List_Header(Machine(awsEc2Simulator),getBillingForRunningVM)==(billing <-- getBillingForRunningVM(vm,caller));
  List_Header(Machine(awsEc2Simulator),getBillingForUser)==(billing <-- getBillingForUser(user,caller))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(awsEc2Simulator),setInstanceRating)==(instanceType: {allocated,spot} & cpuRating: NAT1 & hddRating: NAT1 & memRating: NAT1 & hddRating: NAT1 & caller: {admin});
  List_Precondition(Machine(awsEc2Simulator),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeClient)==(user: USERS & user: clients & caller: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {});
  List_Precondition(Machine(awsEc2Simulator),listClients)==(user: USERS & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),tickTimer)==(btrue);
  List_Precondition(Machine(awsEc2Simulator),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeResource)==(resource: machineResources & resource: machineResources & caller: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {});
  List_Precondition(Machine(awsEc2Simulator),listResources)==(btrue);
  List_Precondition(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients);
  List_Precondition(Machine(awsEc2Simulator),addSpotVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients);
  List_Precondition(Machine(awsEc2Simulator),removeVirtualMachine)==(vm: virtualMachines & vm: dom(virtualMachineProperties) & caller: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & finishedInstanceCost(virtualMachineProperties(vm)'owner)>0 & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime);
  List_Precondition(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  List_Precondition(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  List_Precondition(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & caller: USERS & caller: admins\/{user});
  List_Precondition(Machine(awsEc2Simulator),getBillingForRunningVM)==(vm: virtualMachines & caller: USERS & caller: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating));
  List_Precondition(Machine(awsEc2Simulator),getBillingForUser)==(user: clients & user: dom(finishedInstanceCost) & caller: admins\/{user})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(awsEc2Simulator),getBillingForUser)==(user: clients & user: dom(finishedInstanceCost) & caller: admins\/{user} | billing:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime))+finishedInstanceCost(user));
  Expanded_List_Substitution(Machine(awsEc2Simulator),getBillingForRunningVM)==(vm: virtualMachines & caller: USERS & caller: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating) | billing:=instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime));
  Expanded_List_Substitution(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & caller: USERS & caller: admins\/{user} | vmList:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | totalCpu:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu));
  Expanded_List_Substitution(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | vms:={vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = machine});
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeVirtualMachine)==(vm: virtualMachines & vm: dom(virtualMachineProperties) & caller: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & finishedInstanceCost(virtualMachineProperties(vm)'owner)>0 & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime | virtualMachines,virtualMachineProperties,allocatedVirtualMachines,spotVirtualMachines,finishedInstanceCost:=virtualMachines-{vm},{vm}<<|virtualMachineProperties,allocatedVirtualMachines-{vm},spotVirtualMachines-{vm},finishedInstanceCost<+{virtualMachineProperties(vm)'owner|->finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime)});
  Expanded_List_Substitution(Machine(awsEc2Simulator),addSpotVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients | @(machine,vm).(vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu-SIGMA(vm$1).(vm$1: dom(virtualMachineProperties) & virtualMachineProperties(vm$1)'residentMachine = machine | virtualMachineProperties(vm$1)'cpu) & hdd<=machineResourceProperties(machine)'hdd-SIGMA(vm$1).(vm$1: dom(virtualMachineProperties) & virtualMachineProperties(vm$1)'residentMachine = machine | virtualMachineProperties(vm$1)'hdd) & mem<=machineResourceProperties(machine)'mem-SIGMA(vm$1).(vm$1: dom(virtualMachineProperties) & virtualMachineProperties(vm$1)'residentMachine = machine | virtualMachineProperties(vm$1)'mem) ==> virtualMachines,spotVirtualMachines,virtualMachineProperties:=virtualMachines\/{vm},spotVirtualMachines\/{vm},virtualMachineProperties<+{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Expanded_List_Substitution(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients | @(machine,vm).(vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'cpu) & hdd<=machineResourceProperties(machine)'hdd-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'hdd) & mem<=machineResourceProperties(machine)'mem-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'mem) ==> virtualMachines,allocatedVirtualMachines,virtualMachineProperties:=virtualMachines\/{vm},allocatedVirtualMachines\/{vm},virtualMachineProperties<+{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Expanded_List_Substitution(Machine(awsEc2Simulator),listResources)==(btrue | resourceList:=machineResourceProperties);
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeResource)==(resource: machineResources & resource: machineResources & caller: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {} | machineResources,machineResourceProperties:=machineResources-{resource},{resource}<<|machineResourceProperties);
  Expanded_List_Substitution(Machine(awsEc2Simulator),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & caller: admins | @resource.(resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) ==> machineResources,machineResourceProperties:=machineResources\/{resource},machineResourceProperties<+{resource|->rec(cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Expanded_List_Substitution(Machine(awsEc2Simulator),tickTimer)==(btrue | currentTime:=(currentTime+1) mod (MAXINT-1));
  Expanded_List_Substitution(Machine(awsEc2Simulator),listClients)==(user: USERS & caller: admins | clientList:=clients);
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeClient)==(user: USERS & user: clients & caller: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {} | clients,finishedInstanceCost:=clients-{user},{user}<<|finishedInstanceCost);
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins | admins:=admins-{user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins | admins:=admins\/{user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins | clients,finishedInstanceCost:=clients\/{user},finishedInstanceCost<+{user|->0});
  Expanded_List_Substitution(Machine(awsEc2Simulator),setInstanceRating)==(instanceType: {allocated,spot} & cpuRating: NAT1 & hddRating: NAT1 & memRating: NAT1 & hddRating: NAT1 & caller: {admin} | instanceRating:=instanceRating<+{instanceType|->rec(cpu>>cpuRating,hdd>>hddRating,mem>>memRating)});
  List_Substitution(Machine(awsEc2Simulator),setInstanceRating)==(instanceRating(instanceType):=rec(cpu>>cpuRating,hdd>>hddRating,mem>>memRating));
  List_Substitution(Machine(awsEc2Simulator),addClient)==(clients:=clients\/{user} || finishedInstanceCost(user):=0);
  List_Substitution(Machine(awsEc2Simulator),addAdmin)==(admins:=admins\/{user});
  List_Substitution(Machine(awsEc2Simulator),removeAdmin)==(admins:=admins-{user});
  List_Substitution(Machine(awsEc2Simulator),removeClient)==(clients:=clients-{user} || finishedInstanceCost:={user}<<|finishedInstanceCost);
  List_Substitution(Machine(awsEc2Simulator),listClients)==(clientList:=clients);
  List_Substitution(Machine(awsEc2Simulator),tickTimer)==(currentTime:=(currentTime+1) mod (MAXINT-1));
  List_Substitution(Machine(awsEc2Simulator),addResource)==(ANY resource WHERE resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) THEN machineResources:=machineResources\/{resource} || machineResourceProperties(resource):=rec(cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(awsEc2Simulator),removeResource)==(machineResources:=machineResources-{resource} || machineResourceProperties:={resource}<<|machineResourceProperties);
  List_Substitution(Machine(awsEc2Simulator),listResources)==(resourceList:=machineResourceProperties);
  List_Substitution(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(ANY machine,vm WHERE vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'cpu) & hdd<=machineResourceProperties(machine)'hdd-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'hdd) & mem<=machineResourceProperties(machine)'mem-SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'mem) THEN virtualMachines:=virtualMachines\/{vm} || allocatedVirtualMachines:=allocatedVirtualMachines\/{vm} || virtualMachineProperties(vm):=rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(awsEc2Simulator),addSpotVirtualMachine)==(ANY machine,vm WHERE vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu-SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu) & hdd<=machineResourceProperties(machine)'hdd-SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'hdd) & mem<=machineResourceProperties(machine)'mem-SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'mem) THEN virtualMachines:=virtualMachines\/{vm} || spotVirtualMachines:=spotVirtualMachines\/{vm} || virtualMachineProperties(vm):=rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(awsEc2Simulator),removeVirtualMachine)==(virtualMachines:=virtualMachines-{vm} || virtualMachineProperties:={vm}<<|virtualMachineProperties || allocatedVirtualMachines:=allocatedVirtualMachines-{vm} || spotVirtualMachines:=spotVirtualMachines-{vm} || finishedInstanceCost(virtualMachineProperties(vm)'owner):=finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime));
  List_Substitution(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms:={vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = machine});
  List_Substitution(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu));
  List_Substitution(Machine(awsEc2Simulator),listVmsForUser)==(vmList:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user});
  List_Substitution(Machine(awsEc2Simulator),getBillingForRunningVM)==(billing:=instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime));
  List_Substitution(Machine(awsEc2Simulator),getBillingForUser)==(billing:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime))+finishedInstanceCost(user))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(awsEc2Simulator))==(admin);
  Inherited_List_Constants(Machine(awsEc2Simulator))==(?);
  List_Constants(Machine(awsEc2Simulator))==(admin)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(awsEc2Simulator))==(?);
  Context_List_Defered(Machine(awsEc2Simulator))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Context_List_Sets(Machine(awsEc2Simulator))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  List_Valuable_Sets(Machine(awsEc2Simulator))==(?);
  Inherited_List_Enumerated(Machine(awsEc2Simulator))==(?);
  Inherited_List_Defered(Machine(awsEc2Simulator))==(?);
  Inherited_List_Sets(Machine(awsEc2Simulator))==(?);
  List_Enumerated(Machine(awsEc2Simulator))==(?);
  List_Defered(Machine(awsEc2Simulator))==(?);
  List_Sets(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(awsEc2Simulator))==(?);
  Expanded_List_HiddenConstants(Machine(awsEc2Simulator))==(?);
  List_HiddenConstants(Machine(awsEc2Simulator))==(?);
  External_List_HiddenConstants(Machine(awsEc2Simulator))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(awsEc2Simulator))==(btrue);
  Context_List_Properties(Machine(awsEc2Simulator))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & vmLimit: NAT1 & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}));
  Inherited_List_Properties(Machine(awsEc2Simulator))==(btrue);
  List_Properties(Machine(awsEc2Simulator))==(admin: USERS)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(awsEc2Simulator),Machine(awsEc2SimulatorCtx))==(?);
  Seen_Context_List_Enumerated(Machine(awsEc2Simulator))==(?);
  Seen_Context_List_Invariant(Machine(awsEc2Simulator))==(btrue);
  Seen_Context_List_Assertions(Machine(awsEc2Simulator))==(btrue);
  Seen_Context_List_Properties(Machine(awsEc2Simulator))==(btrue);
  Seen_List_Constraints(Machine(awsEc2Simulator))==(btrue);
  Seen_List_Operations(Machine(awsEc2Simulator),Machine(awsEc2SimulatorCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(awsEc2Simulator),Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(awsEc2Simulator),setInstanceRating)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addClient)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addAdmin)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),removeAdmin)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),removeClient)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listClients)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),tickTimer)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addResource)==(Var(resource) == atype(MACHINE_RESOURCES,?,?));
  List_ANY_Var(Machine(awsEc2Simulator),removeResource)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listResources)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==((Var(machine) == atype(MACHINE_RESOURCES,?,?)),(Var(vm) == atype(VIRTUAL_MACHINES,?,?)));
  List_ANY_Var(Machine(awsEc2Simulator),addSpotVirtualMachine)==((Var(machine) == atype(MACHINE_RESOURCES,?,?)),(Var(vm) == atype(VIRTUAL_MACHINES,?,?)));
  List_ANY_Var(Machine(awsEc2Simulator),removeVirtualMachine)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listVmsForUser)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),getBillingForRunningVM)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),getBillingForUser)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(awsEc2Simulator)) == (admin | ? | finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources | ? | setInstanceRating,addClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser | ? | seen(Machine(awsEc2SimulatorCtx)) | ? | awsEc2Simulator);
  List_Of_HiddenCst_Ids(Machine(awsEc2Simulator)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(awsEc2Simulator)) == (admin);
  List_Of_VisibleVar_Ids(Machine(awsEc2Simulator)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(awsEc2Simulator)) == (?: ?);
  List_Of_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,vmLimit,USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | awsEc2SimulatorCtx);
  List_Of_HiddenCst_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,vmLimit);
  List_Of_VisibleVar_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(awsEc2SimulatorCtx)) == (?: ?)
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(awsEc2Simulator)) == (Type(admin) == Cst(atype(USERS,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(awsEc2Simulator)) == (Type(finishedInstanceCost) == Mvl(SetOf(atype(USERS,?,?)*btype(INTEGER,?,?)));Type(instanceRating) == Mvl(SetOf(atype(VM_CATEGORIES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(currentTime) == Mvl(btype(INTEGER,?,?));Type(allocatedVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(spotVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(vmCategories) == Mvl(SetOf(atype(VM_CATEGORIES,?,?)));Type(virtualMachineProperties) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)*rtype(((((((residentMachine: atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")),owner: atype(USERS,"[USERS","]USERS")),category: atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES")),startTime: btype(INTEGER,0,MAXINT)),cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(virtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(clients) == Mvl(SetOf(atype(USERS,?,?)));Type(admins) == Mvl(SetOf(atype(USERS,?,?)));Type(machineResourceProperties) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(machineResources) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(awsEc2Simulator)) == (Type(getBillingForUser) == Cst(btype(INTEGER,?,?),atype(USERS,?,?)*atype(USERS,?,?));Type(getBillingForRunningVM) == Cst(btype(INTEGER,?,?),atype(VIRTUAL_MACHINES,?,?)*atype(USERS,?,?));Type(listVmsForUser) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),SetOf(atype(VM_CATEGORIES,?,?))*atype(USERS,?,?)*atype(USERS,?,?));Type(getAllocatedCpuOnMachine) == Cst(btype(INTEGER,?,?),atype(MACHINE_RESOURCES,?,?));Type(getAllocatedVmsOnMachine) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),atype(MACHINE_RESOURCES,?,?));Type(removeVirtualMachine) == Cst(No_type,atype(VIRTUAL_MACHINES,?,?)*atype(USERS,?,?));Type(addSpotVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(addAllocatedVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type);Type(removeResource) == Cst(No_type,atype(MACHINE_RESOURCES,?,?)*atype(USERS,?,?));Type(addResource) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(tickTimer) == Cst(No_type,No_type);Type(listClients) == Cst(SetOf(atype(USERS,?,?)),atype(USERS,?,?)*atype(USERS,?,?));Type(removeClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(removeAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(setInstanceRating) == Cst(No_type,atype(VM_CATEGORIES,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?)));
  Observers(Machine(awsEc2Simulator)) == (Type(getBillingForUser) == Cst(btype(INTEGER,?,?),atype(USERS,?,?)*atype(USERS,?,?));Type(getBillingForRunningVM) == Cst(btype(INTEGER,?,?),atype(VIRTUAL_MACHINES,?,?)*atype(USERS,?,?));Type(listVmsForUser) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),SetOf(atype(VM_CATEGORIES,?,?))*atype(USERS,?,?)*atype(USERS,?,?));Type(getAllocatedCpuOnMachine) == Cst(btype(INTEGER,?,?),atype(MACHINE_RESOURCES,?,?));Type(getAllocatedVmsOnMachine) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),atype(MACHINE_RESOURCES,?,?));Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type);Type(listClients) == Cst(SetOf(atype(USERS,?,?)),atype(USERS,?,?)*atype(USERS,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
