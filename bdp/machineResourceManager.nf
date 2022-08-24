Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(machineResourceManager))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(machineResourceManager))==(Machine(machineResourceManager));
  Level(Machine(machineResourceManager))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(machineResourceManager)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(machineResourceManager))==(userManager,machineResourceManagerCtx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(machineResourceManager))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(machineResourceManager))==(?);
  List_Includes(Machine(machineResourceManager))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(machineResourceManager))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(machineResourceManager))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(machineResourceManager))==(?);
  Context_List_Variables(Machine(machineResourceManager))==(?);
  Abstract_List_Variables(Machine(machineResourceManager))==(?);
  Local_List_Variables(Machine(machineResourceManager))==(machineResourceProperties,machineResources);
  List_Variables(Machine(machineResourceManager))==(machineResourceProperties,machineResources);
  External_List_Variables(Machine(machineResourceManager))==(machineResourceProperties,machineResources)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(machineResourceManager))==(?);
  Abstract_List_VisibleVariables(Machine(machineResourceManager))==(?);
  External_List_VisibleVariables(Machine(machineResourceManager))==(?);
  Expanded_List_VisibleVariables(Machine(machineResourceManager))==(?);
  List_VisibleVariables(Machine(machineResourceManager))==(?);
  Internal_List_VisibleVariables(Machine(machineResourceManager))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(machineResourceManager))==(btrue);
  Gluing_List_Invariant(Machine(machineResourceManager))==(btrue);
  Expanded_List_Invariant(Machine(machineResourceManager))==(btrue);
  Abstract_List_Invariant(Machine(machineResourceManager))==(btrue);
  Context_List_Invariant(Machine(machineResourceManager))==(USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={});
  List_Invariant(Machine(machineResourceManager))==(MACHINE_RESOURCES: FIN(MACHINE_RESOURCES) & machineResources <: MACHINE_RESOURCES & machineResourceProperties: machineResources +-> struct(cpu>>NAT,hdd>>NAT,mem>>NAT))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(machineResourceManager))==(btrue);
  Abstract_List_Assertions(Machine(machineResourceManager))==(btrue);
  Context_List_Assertions(Machine(machineResourceManager))==(btrue);
  List_Assertions(Machine(machineResourceManager))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(machineResourceManager))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(machineResourceManager))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(machineResourceManager))==(machineResources,machineResourceProperties:={},{});
  Context_List_Initialisation(Machine(machineResourceManager))==(skip);
  List_Initialisation(Machine(machineResourceManager))==(machineResources:={} || machineResourceProperties:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(machineResourceManager))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(machineResourceManager),Machine(userManager))==(?);
  List_Instanciated_Parameters(Machine(machineResourceManager),Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(machineResourceManager))==(btrue);
  List_Constraints(Machine(machineResourceManager))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(machineResourceManager))==(addResource,removeResource,listResources);
  List_Operations(Machine(machineResourceManager))==(addResource,removeResource,listResources)
END
&
THEORY ListInputX IS
  List_Input(Machine(machineResourceManager),addResource)==(cpu,hdd,mem,caller);
  List_Input(Machine(machineResourceManager),removeResource)==(resource,caller);
  List_Input(Machine(machineResourceManager),listResources)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(machineResourceManager),addResource)==(?);
  List_Output(Machine(machineResourceManager),removeResource)==(?);
  List_Output(Machine(machineResourceManager),listResources)==(resourceList)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(machineResourceManager),addResource)==(addResource(cpu,hdd,mem,caller));
  List_Header(Machine(machineResourceManager),removeResource)==(removeResource(resource,caller));
  List_Header(Machine(machineResourceManager),listResources)==(resourceList <-- listResources)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(machineResourceManager),addResource)==(cpu: NAT & hdd: NAT & mem: NAT & caller: admins);
  List_Precondition(Machine(machineResourceManager),removeResource)==(resource: MACHINE_RESOURCES & resource: machineResources & caller: admins);
  List_Precondition(Machine(machineResourceManager),listResources)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(machineResourceManager),listResources)==(btrue | resourceList:=machineResourceProperties);
  Expanded_List_Substitution(Machine(machineResourceManager),removeResource)==(resource: MACHINE_RESOURCES & resource: machineResources & caller: admins | machineResources,machineResourceProperties:=machineResources-{resource},{resource}<<|machineResourceProperties);
  Expanded_List_Substitution(Machine(machineResourceManager),addResource)==(cpu: NAT & hdd: NAT & mem: NAT & caller: admins | @resource.(resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) ==> machineResources,machineResourceProperties:=machineResources\/{resource},machineResourceProperties<+{resource|->rec(cpu>>cpu,hdd>>hdd,mem>>mem)}));
  List_Substitution(Machine(machineResourceManager),addResource)==(ANY resource WHERE resource: MACHINE_RESOURCES & resource/:machineResources & resource/:dom(machineResourceProperties) THEN machineResources:=machineResources\/{resource} || machineResourceProperties(resource):=rec(cpu>>cpu,hdd>>hdd,mem>>mem) END);
  List_Substitution(Machine(machineResourceManager),removeResource)==(machineResources:=machineResources-{resource} || machineResourceProperties:={resource}<<|machineResourceProperties);
  List_Substitution(Machine(machineResourceManager),listResources)==(resourceList:=machineResourceProperties)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(machineResourceManager))==(?);
  Inherited_List_Constants(Machine(machineResourceManager))==(?);
  List_Constants(Machine(machineResourceManager))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(machineResourceManager))==(?);
  Context_List_Defered(Machine(machineResourceManager))==(MACHINE_RESOURCES);
  Context_List_Sets(Machine(machineResourceManager))==(MACHINE_RESOURCES);
  List_Valuable_Sets(Machine(machineResourceManager))==(?);
  Inherited_List_Enumerated(Machine(machineResourceManager))==(?);
  Inherited_List_Defered(Machine(machineResourceManager))==(?);
  Inherited_List_Sets(Machine(machineResourceManager))==(?);
  List_Enumerated(Machine(machineResourceManager))==(?);
  List_Defered(Machine(machineResourceManager))==(?);
  List_Sets(Machine(machineResourceManager))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(machineResourceManager))==(?);
  Expanded_List_HiddenConstants(Machine(machineResourceManager))==(?);
  List_HiddenConstants(Machine(machineResourceManager))==(?);
  External_List_HiddenConstants(Machine(machineResourceManager))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(machineResourceManager))==(btrue);
  Context_List_Properties(Machine(machineResourceManager))==(admin: USERS & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}));
  Inherited_List_Properties(Machine(machineResourceManager))==(btrue);
  List_Properties(Machine(machineResourceManager))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(machineResourceManager),Machine(machineResourceManagerCtx))==(?);
  Seen_Context_List_Enumerated(Machine(machineResourceManager))==(?);
  Seen_Context_List_Invariant(Machine(machineResourceManager))==(btrue);
  Seen_Context_List_Assertions(Machine(machineResourceManager))==(btrue);
  Seen_Context_List_Properties(Machine(machineResourceManager))==(USERS: FIN(INTEGER) & not(USERS = {}));
  Seen_List_Constraints(Machine(machineResourceManager))==(btrue);
  Seen_List_Operations(Machine(machineResourceManager),Machine(machineResourceManagerCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(machineResourceManager),Machine(machineResourceManagerCtx))==(btrue);
  Seen_Internal_List_Operations(Machine(machineResourceManager),Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient);
  Seen_List_Precondition(Machine(machineResourceManager),removeClient)==(user: USERS & user: clients & caller: admins);
  Seen_Expanded_List_Substitution(Machine(machineResourceManager),removeClient)==(clients:=clients-{user});
  Seen_List_Precondition(Machine(machineResourceManager),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins);
  Seen_Expanded_List_Substitution(Machine(machineResourceManager),removeAdmin)==(admins:=admins-{user});
  Seen_List_Precondition(Machine(machineResourceManager),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins);
  Seen_Expanded_List_Substitution(Machine(machineResourceManager),addAdmin)==(admins:=admins\/{user});
  Seen_List_Precondition(Machine(machineResourceManager),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins);
  Seen_Expanded_List_Substitution(Machine(machineResourceManager),addClient)==(clients:=clients\/{user});
  Seen_List_Operations(Machine(machineResourceManager),Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient);
  Seen_Expanded_List_Invariant(Machine(machineResourceManager),Machine(userManager))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(machineResourceManager),addResource)==(Var(resource) == atype(MACHINE_RESOURCES,?,?));
  List_ANY_Var(Machine(machineResourceManager),removeResource)==(?);
  List_ANY_Var(Machine(machineResourceManager),listResources)==(?)
END
&
THEORY ListOfIdsX IS
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
  List_Of_Ids(Machine(userManager)) == (admin | ? | clients,admins | ? | addClient,addAdmin,removeAdmin,removeClient | ? | seen(Machine(userManagerCtx)) | ? | userManager);
  List_Of_HiddenCst_Ids(Machine(userManager)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(userManager)) == (admin);
  List_Of_VisibleVar_Ids(Machine(userManager)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(userManager)) == (?: ?);
  List_Of_Ids(Machine(userManagerCtx)) == (USERS | ? | ? | ? | ? | ? | ? | ? | userManagerCtx);
  List_Of_HiddenCst_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(userManagerCtx)) == (?);
  List_Of_VisibleVar_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(userManagerCtx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(machineResourceManager)) == (Type(machineResourceProperties) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(machineResources) == Mvl(SetOf(atype(MACHINE_RESOURCES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(machineResourceManager)) == (Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type);Type(removeResource) == Cst(No_type,atype(MACHINE_RESOURCES,?,?)*atype(USERS,?,?));Type(addResource) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?)));
  Observers(Machine(machineResourceManager)) == (Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))),No_type))
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
