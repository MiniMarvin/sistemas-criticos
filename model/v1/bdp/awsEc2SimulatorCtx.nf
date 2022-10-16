Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(awsEc2SimulatorCtx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(awsEc2SimulatorCtx))==(Machine(awsEc2SimulatorCtx));
  Level(Machine(awsEc2SimulatorCtx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(awsEc2SimulatorCtx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(awsEc2SimulatorCtx))==(?);
  List_Includes(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(awsEc2SimulatorCtx))==(?);
  Context_List_Variables(Machine(awsEc2SimulatorCtx))==(?);
  Abstract_List_Variables(Machine(awsEc2SimulatorCtx))==(?);
  Local_List_Variables(Machine(awsEc2SimulatorCtx))==(?);
  List_Variables(Machine(awsEc2SimulatorCtx))==(?);
  External_List_Variables(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?);
  Abstract_List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?);
  External_List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?);
  Expanded_List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?);
  List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?);
  Internal_List_VisibleVariables(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(awsEc2SimulatorCtx))==(btrue);
  Gluing_List_Invariant(Machine(awsEc2SimulatorCtx))==(btrue);
  Expanded_List_Invariant(Machine(awsEc2SimulatorCtx))==(btrue);
  Abstract_List_Invariant(Machine(awsEc2SimulatorCtx))==(btrue);
  Context_List_Invariant(Machine(awsEc2SimulatorCtx))==(btrue);
  List_Invariant(Machine(awsEc2SimulatorCtx))==(USERS: FIN(USERS) & VM_CATEGORIES: FIN(VM_CATEGORIES) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(awsEc2SimulatorCtx))==(btrue);
  Abstract_List_Assertions(Machine(awsEc2SimulatorCtx))==(btrue);
  Context_List_Assertions(Machine(awsEc2SimulatorCtx))==(btrue);
  List_Assertions(Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(awsEc2SimulatorCtx))==(skip);
  Context_List_Initialisation(Machine(awsEc2SimulatorCtx))==(skip);
  List_Initialisation(Machine(awsEc2SimulatorCtx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(awsEc2SimulatorCtx))==(btrue);
  List_Constraints(Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(awsEc2SimulatorCtx))==(?);
  List_Operations(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(awsEc2SimulatorCtx))==(allocated,spot,admin,none);
  Inherited_List_Constants(Machine(awsEc2SimulatorCtx))==(?);
  List_Constants(Machine(awsEc2SimulatorCtx))==(allocated,spot,admin,none)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(awsEc2SimulatorCtx),USERS)==(?);
  Context_List_Enumerated(Machine(awsEc2SimulatorCtx))==(?);
  Context_List_Defered(Machine(awsEc2SimulatorCtx))==(?);
  Context_List_Sets(Machine(awsEc2SimulatorCtx))==(?);
  List_Valuable_Sets(Machine(awsEc2SimulatorCtx))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Inherited_List_Enumerated(Machine(awsEc2SimulatorCtx))==(?);
  Inherited_List_Defered(Machine(awsEc2SimulatorCtx))==(?);
  Inherited_List_Sets(Machine(awsEc2SimulatorCtx))==(?);
  List_Enumerated(Machine(awsEc2SimulatorCtx))==(?);
  List_Defered(Machine(awsEc2SimulatorCtx))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  List_Sets(Machine(awsEc2SimulatorCtx))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Set_Definition(Machine(awsEc2SimulatorCtx),MACHINE_RESOURCES)==(?);
  Set_Definition(Machine(awsEc2SimulatorCtx),VIRTUAL_MACHINES)==(?);
  Set_Definition(Machine(awsEc2SimulatorCtx),VM_CATEGORIES)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(awsEc2SimulatorCtx))==(?);
  Expanded_List_HiddenConstants(Machine(awsEc2SimulatorCtx))==(?);
  List_HiddenConstants(Machine(awsEc2SimulatorCtx))==(?);
  External_List_HiddenConstants(Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(awsEc2SimulatorCtx))==(btrue);
  Context_List_Properties(Machine(awsEc2SimulatorCtx))==(btrue);
  Inherited_List_Properties(Machine(awsEc2SimulatorCtx))==(btrue);
  List_Properties(Machine(awsEc2SimulatorCtx))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & allocated/=spot & admin: USERS & none: USERS & admin/=none & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none,USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | awsEc2SimulatorCtx);
  List_Of_HiddenCst_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none);
  List_Of_VisibleVar_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(awsEc2SimulatorCtx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(awsEc2SimulatorCtx)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS")));Type(MACHINE_RESOURCES) == Cst(SetOf(atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")));Type(VIRTUAL_MACHINES) == Cst(SetOf(atype(VIRTUAL_MACHINES,"[VIRTUAL_MACHINES","]VIRTUAL_MACHINES")));Type(VM_CATEGORIES) == Cst(SetOf(atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(awsEc2SimulatorCtx)) == (Type(allocated) == Cst(atype(VM_CATEGORIES,?,?));Type(spot) == Cst(atype(VM_CATEGORIES,?,?));Type(admin) == Cst(atype(USERS,?,?));Type(none) == Cst(atype(USERS,?,?)))
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
