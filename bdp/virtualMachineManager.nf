Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(virtualMachineManager))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(virtualMachineManager))==(Machine(virtualMachineManager));
  Level(Machine(virtualMachineManager))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(virtualMachineManager)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(virtualMachineManager))==(virtualMachineManagerCtx,userManagerCtx,machineResourceManagerCtx,machineResourceManager,userManager)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(virtualMachineManager))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(virtualMachineManager))==(?);
  List_Includes(Machine(virtualMachineManager))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(virtualMachineManager))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(virtualMachineManager))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(virtualMachineManager))==(?);
  Context_List_Variables(Machine(virtualMachineManager))==(?);
  Abstract_List_Variables(Machine(virtualMachineManager))==(?);
  Local_List_Variables(Machine(virtualMachineManager))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines);
  List_Variables(Machine(virtualMachineManager))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines);
  External_List_Variables(Machine(virtualMachineManager))==(allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(virtualMachineManager))==(?);
  Abstract_List_VisibleVariables(Machine(virtualMachineManager))==(?);
  External_List_VisibleVariables(Machine(virtualMachineManager))==(?);
  Expanded_List_VisibleVariables(Machine(virtualMachineManager))==(?);
  List_VisibleVariables(Machine(virtualMachineManager))==(?);
  Internal_List_VisibleVariables(Machine(virtualMachineManager))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(virtualMachineManager))==(btrue);
  Gluing_List_Invariant(Machine(virtualMachineManager))==(btrue);
  Expanded_List_Invariant(Machine(virtualMachineManager))==(btrue);
  Abstract_List_Invariant(Machine(virtualMachineManager))==(btrue);
  Context_List_Invariant(Machine(virtualMachineManager))==(MACHINE_RESOURCES: FIN(MACHINE_RESOURCES) & machineResources <: MACHINE_RESOURCES & machineResourceProperties: machineResources +-> struct(cpu>>NAT,hdd>>NAT,mem>>NAT) & USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={});
  List_Invariant(Machine(virtualMachineManager))==(VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & VM_CATEGORIES: FIN(VM_CATEGORIES) & vmCategories <: VM_CATEGORIES & virtualMachines <: VIRTUAL_MACHINES & virtualMachineProperties: virtualMachines +-> struct(residentMachine>>MACHINE_RESOURCES,owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT,hdd>>NAT,mem>>NAT) & spotVirtualMachines <: virtualMachines & allocatedVirtualMachines <: virtualMachines & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines & spotVirtualMachines/\allocatedVirtualMachines = {})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(virtualMachineManager))==(btrue);
  Abstract_List_Assertions(Machine(virtualMachineManager))==(btrue);
  Context_List_Assertions(Machine(virtualMachineManager))==(btrue);
  List_Assertions(Machine(virtualMachineManager))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(virtualMachineManager))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(virtualMachineManager))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(virtualMachineManager))==(virtualMachines,virtualMachineProperties,vmCategories,spotVirtualMachines,allocatedVirtualMachines:={},{},{allocated,spot},{},{});
  Context_List_Initialisation(Machine(virtualMachineManager))==(skip);
  List_Initialisation(Machine(virtualMachineManager))==(virtualMachines:={} || virtualMachineProperties:={} || vmCategories:={allocated,spot} || spotVirtualMachines:={} || allocatedVirtualMachines:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(virtualMachineManager))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(virtualMachineManager),Machine(virtualMachineManagerCtx))==(?);
  List_Instanciated_Parameters(Machine(virtualMachineManager),Machine(userManagerCtx))==(?);
  List_Instanciated_Parameters(Machine(virtualMachineManager),Machine(machineResourceManagerCtx))==(?);
  List_Instanciated_Parameters(Machine(virtualMachineManager),Machine(machineResourceManager))==(?);
  List_Instanciated_Parameters(Machine(virtualMachineManager),Machine(userManager))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(virtualMachineManager))==(btrue);
  List_Constraints(Machine(virtualMachineManager))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(virtualMachineManager))==(addAllocatedVirtualMachine,getAllocatedVmsOnMachine);
  List_Operations(Machine(virtualMachineManager))==(addAllocatedVirtualMachine,getAllocatedVmsOnMachine)
END
&
THEORY ListInputX IS
  List_Input(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(machine)
END
&
THEORY ListOutputX IS
  List_Output(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(?);
  List_Output(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(vms)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(addAllocatedVirtualMachine(cpu,hdd,mem,client));
  List_Header(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(vms <-- getAllocatedVmsOnMachine(machine))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(cpu: NAT & hdd: NAT & mem: NAT & client: clients);
  List_Precondition(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | vms:=struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT,hdd>>NAT,mem>>NAT)/\ran(virtualMachineProperties));
  Expanded_List_Substitution(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(cpu: NAT & hdd: NAT & mem: NAT & client: clients | @(machine,vm).(vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu & hdd<=machineResourceProperties(machine)'hdd & mem<=machineResourceProperties(machine)'mem & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines ==> virtualMachines,allocatedVirtualMachines,virtualMachineProperties:=virtualMachines\/{vm},allocatedVirtualMachines\/{vm},virtualMachineProperties<+{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,cpu>>cpu,hdd>>hdd,mem>>mem)}));
  List_Substitution(Machine(virtualMachineManager),addAllocatedVirtualMachine)==(ANY machine,vm WHERE vm: VIRTUAL_MACHINES & vm/:virtualMachines & vm/:spotVirtualMachines & vm/:allocatedVirtualMachines & machine: machineResources & machine: dom(machineResourceProperties) & cpu<=machineResourceProperties(machine)'cpu & hdd<=machineResourceProperties(machine)'hdd & mem<=machineResourceProperties(machine)'mem & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines THEN virtualMachines:=virtualMachines\/{vm} || allocatedVirtualMachines:=allocatedVirtualMachines\/{vm} || virtualMachineProperties(vm):=rec(residentMachine>>machine,owner>>client,category>>allocated,cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(vms:=struct(residentMachine>>{machine},owner>>USERS,category>>VM_CATEGORIES,cpu>>NAT,hdd>>NAT,mem>>NAT)/\ran(virtualMachineProperties))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(virtualMachineManager))==(?);
  Inherited_List_Constants(Machine(virtualMachineManager))==(?);
  List_Constants(Machine(virtualMachineManager))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(virtualMachineManager))==(?);
  Context_List_Defered(Machine(virtualMachineManager))==(VIRTUAL_MACHINES,VM_CATEGORIES,USERS,MACHINE_RESOURCES);
  Context_List_Sets(Machine(virtualMachineManager))==(VIRTUAL_MACHINES,VM_CATEGORIES,USERS,MACHINE_RESOURCES);
  List_Valuable_Sets(Machine(virtualMachineManager))==(?);
  Inherited_List_Enumerated(Machine(virtualMachineManager))==(?);
  Inherited_List_Defered(Machine(virtualMachineManager))==(?);
  Inherited_List_Sets(Machine(virtualMachineManager))==(?);
  List_Enumerated(Machine(virtualMachineManager))==(?);
  List_Defered(Machine(virtualMachineManager))==(?);
  List_Sets(Machine(virtualMachineManager))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(virtualMachineManager))==(?);
  Expanded_List_HiddenConstants(Machine(virtualMachineManager))==(?);
  List_HiddenConstants(Machine(virtualMachineManager))==(?);
  External_List_HiddenConstants(Machine(virtualMachineManager))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(virtualMachineManager))==(btrue);
  Context_List_Properties(Machine(virtualMachineManager))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}) & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & admin: USERS);
  Inherited_List_Properties(Machine(virtualMachineManager))==(btrue);
  List_Properties(Machine(virtualMachineManager))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(virtualMachineManager),Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient);
  Seen_Context_List_Enumerated(Machine(virtualMachineManager))==(?);
  Seen_Context_List_Invariant(Machine(virtualMachineManager))==(USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={});
  Seen_Context_List_Assertions(Machine(virtualMachineManager))==(btrue);
  Seen_Context_List_Properties(Machine(virtualMachineManager))==(admin: USERS & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & USERS: FIN(INTEGER) & not(USERS = {}));
  Seen_List_Constraints(Machine(virtualMachineManager))==(btrue);
  Seen_List_Precondition(Machine(virtualMachineManager),removeClient)==(user: USERS & user: clients & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),removeClient)==(clients:=clients-{user});
  Seen_List_Precondition(Machine(virtualMachineManager),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),removeAdmin)==(admins:=admins-{user});
  Seen_List_Precondition(Machine(virtualMachineManager),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),addAdmin)==(admins:=admins\/{user});
  Seen_List_Precondition(Machine(virtualMachineManager),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),addClient)==(clients:=clients\/{user});
  Seen_List_Operations(Machine(virtualMachineManager),Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient);
  Seen_Expanded_List_Invariant(Machine(virtualMachineManager),Machine(userManager))==(btrue);
  Seen_Internal_List_Operations(Machine(virtualMachineManager),Machine(machineResourceManager))==(addResource,removeResource,listResources);
  Seen_List_Precondition(Machine(virtualMachineManager),listResources)==(btrue);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),listResources)==(resourceList:=machineResourceProperties);
  Seen_List_Precondition(Machine(virtualMachineManager),removeResource)==(resource: MACHINE_RESOURCES & resource: machineResources & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),removeResource)==(machineResources,machineResourceProperties:=machineResources-{resource},{resource}<<|machineResourceProperties);
  Seen_List_Precondition(Machine(virtualMachineManager),addResource)==(cpu: NAT & hdd: NAT & mem: NAT & caller: admins);
  Seen_Expanded_List_Substitution(Machine(virtualMachineManager),addResource)==(@resource.(resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) ==> machineResources,machineResourceProperties:=machineResources\/{resource},machineResourceProperties<+{resource|->rec(cpu>>cpu,hdd>>hdd,mem>>mem)}));
  Seen_List_Operations(Machine(virtualMachineManager),Machine(machineResourceManager))==(addResource,removeResource,listResources);
  Seen_Expanded_List_Invariant(Machine(virtualMachineManager),Machine(machineResourceManager))==(btrue);
  Seen_Internal_List_Operations(Machine(virtualMachineManager),Machine(machineResourceManagerCtx))==(?);
  Seen_List_Operations(Machine(virtualMachineManager),Machine(machineResourceManagerCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(virtualMachineManager),Machine(machineResourceManagerCtx))==(btrue);
  Seen_Internal_List_Operations(Machine(virtualMachineManager),Machine(userManagerCtx))==(?);
  Seen_List_Operations(Machine(virtualMachineManager),Machine(userManagerCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(virtualMachineManager),Machine(userManagerCtx))==(btrue);
  Seen_Internal_List_Operations(Machine(virtualMachineManager),Machine(virtualMachineManagerCtx))==(?);
  Seen_List_Operations(Machine(virtualMachineManager),Machine(virtualMachineManagerCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(virtualMachineManager),Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(virtualMachineManager),addAllocatedVirtualMachine)==((Var(machine) == atype(MACHINE_RESOURCES,?,?)),(Var(vm) == atype(VIRTUAL_MACHINES,?,?)));
  List_ANY_Var(Machine(virtualMachineManager),getAllocatedVmsOnMachine)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(virtualMachineManager)) == (? | ? | allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines | ? | addAllocatedVirtualMachine,getAllocatedVmsOnMachine | ? | seen(Machine(virtualMachineManagerCtx)),seen(Machine(userManagerCtx)),seen(Machine(machineResourceManagerCtx)),seen(Machine(machineResourceManager)),seen(Machine(userManager)) | ? | virtualMachineManager);
  List_Of_HiddenCst_Ids(Machine(virtualMachineManager)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(virtualMachineManager)) == (?);
  List_Of_VisibleVar_Ids(Machine(virtualMachineManager)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(virtualMachineManager)) == (?: ?);
  List_Of_Ids(Machine(userManager)) == (admin | ? | clients,admins | ? | addClient,addAdmin,removeAdmin,removeClient | ? | seen(Machine(userManagerCtx)) | ? | userManager);
  List_Of_HiddenCst_Ids(Machine(userManager)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(userManager)) == (admin);
  List_Of_VisibleVar_Ids(Machine(userManager)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(userManager)) == (?: ?);
  List_Of_Ids(Machine(userManagerCtx)) == (USERS | ? | ? | ? | ? | ? | ? | ? | userManagerCtx);
  List_Of_HiddenCst_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(userManagerCtx)) == (?);
  List_Of_VisibleVar_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(userManagerCtx)) == (?: ?);
  List_Of_Ids(Machine(machineResourceManager)) == (? | ? | machineResourceProperties,machineResources | ? | addResource,removeResource,listResources | ? | seen(Machine(userManager)),seen(Machine(machineResourceManagerCtx)) | ? | machineResourceManager);
  List_Of_HiddenCst_Ids(Machine(machineResourceManager)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(machineResourceManager)) == (?);
  List_Of_VisibleVar_Ids(Machine(machineResourceManager)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(machineResourceManager)) == (?: ?);
  List_Of_Ids(Machine(machineResourceManagerCtx)) == (MACHINE_RESOURCES | ? | ? | ? | ? | ? | ? | ? | machineResourceManagerCtx);
  List_Of_HiddenCst_Ids(Machine(machineResourceManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(machineResourceManagerCtx)) == (?);
  List_Of_VisibleVar_Ids(Machine(machineResourceManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(machineResourceManagerCtx)) == (?: ?);
  List_Of_Ids(Machine(virtualMachineManagerCtx)) == (allocated,spot,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | virtualMachineManagerCtx);
  List_Of_HiddenCst_Ids(Machine(virtualMachineManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(virtualMachineManagerCtx)) == (allocated,spot);
  List_Of_VisibleVar_Ids(Machine(virtualMachineManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(virtualMachineManagerCtx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(virtualMachineManager)) == (Type(allocatedVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(spotVirtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(vmCategories) == Mvl(SetOf(atype(VM_CATEGORIES,?,?)));Type(virtualMachineProperties) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?)*rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(virtualMachines) == Mvl(SetOf(atype(VIRTUAL_MACHINES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(virtualMachineManager)) == (Type(getAllocatedVmsOnMachine) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),atype(MACHINE_RESOURCES,?,?));Type(addAllocatedVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?)));
  Observers(Machine(virtualMachineManager)) == (Type(getAllocatedVmsOnMachine) == Cst(SetOf(rtype((((((residentMachine: atype(MACHINE_RESOURCES,?,?)),owner: atype(USERS,?,?)),category: atype(VM_CATEGORIES,?,?)),cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),atype(MACHINE_RESOURCES,?,?)))
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
