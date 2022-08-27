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
  Local_List_Variables(Machine(awsEc2Simulator))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  List_Variables(Machine(awsEc2Simulator))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  External_List_Variables(Machine(awsEc2Simulator))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources)
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
  List_Invariant(Machine(awsEc2Simulator))==(USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={} & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES) & machineResources <: MACHINE_RESOURCES & machineResourceProperties: machineResources +-> struct(cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & VM_CATEGORIES: FIN(VM_CATEGORIES) & vmCategories <: VM_CATEGORIES & virtualMachines <: VIRTUAL_MACHINES & virtualMachineProperties: virtualMachines --> struct(residentMachine>>MACHINE_RESOURCES,owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & virtualMachineProperties: FIN(virtualMachineProperties) & card(virtualMachineProperties)<card(VIRTUAL_MACHINES) & spotVirtualMachines <: virtualMachines & allocatedVirtualMachines <: virtualMachines & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines & spotVirtualMachines/\allocatedVirtualMachines = {})
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
  Expanded_List_Initialisation(Machine(awsEc2Simulator))==(admins,clients,machineResources,machineResourceProperties,virtualMachines,virtualMachineProperties,vmCategories,spotVirtualMachines,allocatedVirtualMachines:={admin},{},{},{},{},{},{allocated,spot},{},{});
  Context_List_Initialisation(Machine(awsEc2Simulator))==(skip);
  List_Initialisation(Machine(awsEc2Simulator))==(admins:={admin} || clients:={} || machineResources:={} || machineResourceProperties:={} || virtualMachines:={} || virtualMachineProperties:={} || vmCategories:={allocated,spot} || spotVirtualMachines:={} || allocatedVirtualMachines:={})
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
  Internal_List_Operations(Machine(awsEc2Simulator))==(addClient,addAdmin,removeAdmin,removeClient,listClients,addResource,removeResource,listResources,addAllocatedVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser);
  List_Operations(Machine(awsEc2Simulator))==(addClient,addAdmin,removeAdmin,removeClient,listClients,addResource,removeResource,listResources,addAllocatedVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser)
END
&
THEORY ListInputX IS
  List_Input(Machine(awsEc2Simulator),addClient)==(user,caller);
  List_Input(Machine(awsEc2Simulator),addAdmin)==(user,caller);
  List_Input(Machine(awsEc2Simulator),removeAdmin)==(user,caller);
  List_Input(Machine(awsEc2Simulator),removeClient)==(user,caller);
  List_Input(Machine(awsEc2Simulator),listClients)==(user,caller);
  List_Input(Machine(awsEc2Simulator),addResource)==(cpu,hdd,mem,caller);
  List_Input(Machine(awsEc2Simulator),removeResource)==(resource,caller);
  List_Input(Machine(awsEc2Simulator),listResources)==(?);
  List_Input(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine);
  List_Input(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine);
  List_Input(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes,user,caller)
END
&
THEORY ListOutputX IS
  List_Output(Machine(awsEc2Simulator),addClient)==(?);
  List_Output(Machine(awsEc2Simulator),addAdmin)==(?);
  List_Output(Machine(awsEc2Simulator),removeAdmin)==(?);
  List_Output(Machine(awsEc2Simulator),removeClient)==(?);
  List_Output(Machine(awsEc2Simulator),listClients)==(clientList);
  List_Output(Machine(awsEc2Simulator),addResource)==(?);
  List_Output(Machine(awsEc2Simulator),removeResource)==(?);
  List_Output(Machine(awsEc2Simulator),listResources)==(resourceList);
  List_Output(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(?);
  List_Output(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms);
  List_Output(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu);
  List_Output(Machine(awsEc2Simulator),listVmsForUser)==(vmList)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(awsEc2Simulator),addClient)==(addClient(user,caller));
  List_Header(Machine(awsEc2Simulator),addAdmin)==(addAdmin(user,caller));
  List_Header(Machine(awsEc2Simulator),removeAdmin)==(removeAdmin(user,caller));
  List_Header(Machine(awsEc2Simulator),removeClient)==(removeClient(user,caller));
  List_Header(Machine(awsEc2Simulator),listClients)==(clientList <-- listClients(user,caller));
  List_Header(Machine(awsEc2Simulator),addResource)==(addResource(cpu,hdd,mem,caller));
  List_Header(Machine(awsEc2Simulator),removeResource)==(removeResource(resource,caller));
  List_Header(Machine(awsEc2Simulator),listResources)==(resourceList <-- listResources);
  List_Header(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(addAllocatedVirtualMachine(cpu,hdd,mem,client));
  List_Header(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms <-- getAllocatedVmsOnMachine(machine));
  List_Header(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu <-- getAllocatedCpuOnMachine(machine));
  List_Header(Machine(awsEc2Simulator),listVmsForUser)==(vmList <-- listVmsForUser(resourceTypes,user,caller))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(awsEc2Simulator),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeClient)==(user: USERS & user: clients & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),listClients)==(user: USERS & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),removeResource)==(resource: MACHINE_RESOURCES & resource: machineResources & caller: admins);
  List_Precondition(Machine(awsEc2Simulator),listResources)==(btrue);
  List_Precondition(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients & card(virtualMachineProperties)<vmLimit);
  List_Precondition(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  List_Precondition(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  List_Precondition(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & caller: USERS & caller: admins\/{user})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(awsEc2Simulator),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & caller: USERS & caller: admins\/{user} | vmList:=struct(residentMachine>>MACHINE_RESOURCES,owner>>{user},category>>resourceTypes,cpu>>NAT1,hdd>>NAT1,mem>>NAT1)/\ran(virtualMachineProperties));
  Expanded_List_Substitution(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | totalCpu:=SIGMA(vm).(vm: ran(virtualMachineProperties)/\struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT1,hdd>>NAT1,mem>>NAT1) | vm'cpu));
  Expanded_List_Substitution(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | vms:=struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT1,hdd>>NAT1,mem>>NAT1)/\ran(virtualMachineProperties));
  Expanded_List_Substitution(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients & card(virtualMachineProperties)<vmLimit | @(machine,vm).(vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu & hdd<=machineResourceProperties(machine)'hdd & mem<=machineResourceProperties(machine)'mem ==> virtualMachines,allocatedVirtualMachines,virtualMachineProperties:=virtualMachines\/{vm},allocatedVirtualMachines\/{vm},virtualMachineProperties<+{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Expanded_List_Substitution(Machine(awsEc2Simulator),listResources)==(btrue | resourceList:=machineResourceProperties);
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeResource)==(resource: MACHINE_RESOURCES & resource: machineResources & caller: admins | machineResources,machineResourceProperties:=machineResources-{resource},{resource}<<|machineResourceProperties);
  Expanded_List_Substitution(Machine(awsEc2Simulator),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & caller: admins | @resource.(resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) ==> machineResources,machineResourceProperties:=machineResources\/{resource},machineResourceProperties<+{resource|->rec(cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Expanded_List_Substitution(Machine(awsEc2Simulator),listClients)==(user: USERS & caller: admins | clientList:=clients);
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeClient)==(user: USERS & user: clients & caller: admins | clients:=clients-{user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins | admins:=admins-{user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins | admins:=admins\/{user});
  Expanded_List_Substitution(Machine(awsEc2Simulator),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins | clients:=clients\/{user});
  List_Substitution(Machine(awsEc2Simulator),addClient)==(clients:=clients\/{user});
  List_Substitution(Machine(awsEc2Simulator),addAdmin)==(admins:=admins\/{user});
  List_Substitution(Machine(awsEc2Simulator),removeAdmin)==(admins:=admins-{user});
  List_Substitution(Machine(awsEc2Simulator),removeClient)==(clients:=clients-{user});
  List_Substitution(Machine(awsEc2Simulator),listClients)==(clientList:=clients);
  List_Substitution(Machine(awsEc2Simulator),addResource)==(ANY resource WHERE resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) THEN machineResources:=machineResources\/{resource} || machineResourceProperties(resource):=rec(cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(awsEc2Simulator),removeResource)==(machineResources:=machineResources-{resource} || machineResourceProperties:={resource}<<|machineResourceProperties);
  List_Substitution(Machine(awsEc2Simulator),listResources)==(resourceList:=machineResourceProperties);
  List_Substitution(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==(ANY machine,vm WHERE vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu & hdd<=machineResourceProperties(machine)'hdd & mem<=machineResourceProperties(machine)'mem THEN virtualMachines:=virtualMachines\/{vm} || allocatedVirtualMachines:=allocatedVirtualMachines\/{vm} || virtualMachineProperties(vm):=rec(residentMachine>>machine,owner>>client,category>>allocated,cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(vms:=struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT1,hdd>>NAT1,mem>>NAT1)/\ran(virtualMachineProperties));
  List_Substitution(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(totalCpu:=SIGMA(vm).(vm: ran(virtualMachineProperties)/\struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT1,hdd>>NAT1,mem>>NAT1) | vm'cpu));
  List_Substitution(Machine(awsEc2Simulator),listVmsForUser)==(vmList:=struct(residentMachine>>MACHINE_RESOURCES,owner>>{user},category>>resourceTypes,cpu>>NAT1,hdd>>NAT1,mem>>NAT1)/\ran(virtualMachineProperties))
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
  List_ANY_Var(Machine(awsEc2Simulator),addClient)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addAdmin)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),removeAdmin)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),removeClient)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listClients)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addResource)==(Var(resource) == atype(MACHINE_RESOURCES,?,?));
  List_ANY_Var(Machine(awsEc2Simulator),removeResource)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listResources)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),addAllocatedVirtualMachine)==((Var(machine) == atype(MACHINE_RESOURCES,?,?)),(Var(vm) == atype(VIRTUAL_MACHINES,?,?)));
  List_ANY_Var(Machine(awsEc2Simulator),getAllocatedVmsOnMachine)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),getAllocatedCpuOnMachine)==(?);
  List_ANY_Var(Machine(awsEc2Simulator),listVmsForUser)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(awsEc2Simulator)) == (admin | ? | allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources | ? | addClient,addAdmin,removeAdmin,removeClient,listClients,addResource,removeResource,listResources,addAllocatedVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser | ? | seen(Machine(awsEc2SimulatorCtx)) | ? | awsEc2Simulator);
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
  Variables(Machine(awsEc2Simulator)) == (Type(allocatedVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(spotVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(vmCategories) == Mvl(SetOf(atype(VM_CATEGORIES,?,?)));Type(virtualMachineProperties) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)*rtype((((((residentMachine: atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")),owner: atype(USERS,"[USERS","]USERS")),category: atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES")),cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(virtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(clients) == Mvl(SetOf(atype(USERS,?,?)));Type(admins) == Mvl(SetOf(atype(USERS,?,?)));Type(machineResourceProperties) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(machineResources) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(awsEc2Simulator)) == (Type(listVmsForUser) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),SetOf(atype(VM_CATEGORIES,?,?))*atype(USERS,?,?)*atype(USERS,?,?));Type(getAllocatedCpuOnMachine) == Cst(btype(INTEGER,?,?),atype(MACHINE_RESOURCES,?,?));Type(getAllocatedVmsOnMachine) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),atype(MACHINE_RESOURCES,?,?));Type(addAllocatedVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type);Type(removeResource) == Cst(No_type,atype(MACHINE_RESOURCES,?,?)*atype(USERS,?,?));Type(addResource) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(listClients) == Cst(SetOf(atype(USERS,?,?)),atype(USERS,?,?)*atype(USERS,?,?));Type(removeClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(removeAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?)));
  Observers(Machine(awsEc2Simulator)) == (Type(listVmsForUser) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),SetOf(atype(VM_CATEGORIES,?,?))*atype(USERS,?,?)*atype(USERS,?,?));Type(getAllocatedCpuOnMachine) == Cst(btype(INTEGER,?,?),atype(MACHINE_RESOURCES,?,?));Type(getAllocatedVmsOnMachine) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),atype(MACHINE_RESOURCES,?,?));Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type);Type(listClients) == Cst(SetOf(atype(USERS,?,?)),atype(USERS,?,?)*atype(USERS,?,?)))
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
