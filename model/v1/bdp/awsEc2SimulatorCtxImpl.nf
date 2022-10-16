Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(awsEc2SimulatorCtxImpl))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(awsEc2SimulatorCtxImpl))==(Machine(awsEc2SimulatorCtx));
  Level(Implementation(awsEc2SimulatorCtxImpl))==(1);
  Upper_Level(Implementation(awsEc2SimulatorCtxImpl))==(Machine(awsEc2SimulatorCtx))
END
&
THEORY LoadedStructureX IS
  Implementation(awsEc2SimulatorCtxImpl)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Inherited_List_Includes(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Context_List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Abstract_List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Local_List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  External_List_Variables(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Abstract_List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  External_List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Expanded_List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Internal_List_VisibleVariables(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Expanded_List_Invariant(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Abstract_List_Invariant(Implementation(awsEc2SimulatorCtxImpl))==(USERS: FIN(USERS) & VM_CATEGORIES: FIN(VM_CATEGORIES) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES));
  Context_List_Invariant(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  List_Invariant(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Abstract_List_Assertions(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Context_List_Assertions(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  List_Assertions(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(awsEc2SimulatorCtxImpl))==(skip);
  Context_List_Initialisation(Implementation(awsEc2SimulatorCtxImpl))==(skip);
  List_Initialisation(Implementation(awsEc2SimulatorCtxImpl))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  List_Context_Constraints(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Operations(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(awsEc2SimulatorCtxImpl))==(allocated,spot,admin,none);
  Inherited_List_Constants(Implementation(awsEc2SimulatorCtxImpl))==(allocated,spot,admin,none);
  List_Constants(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(awsEc2SimulatorCtxImpl),VM_CATEGORIES)==(?);
  Context_List_Enumerated(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Context_List_Defered(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Context_List_Sets(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Own_Enumerated(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Valuable_Sets(Implementation(awsEc2SimulatorCtxImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Inherited_List_Enumerated(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Inherited_List_Defered(Implementation(awsEc2SimulatorCtxImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Inherited_List_Sets(Implementation(awsEc2SimulatorCtxImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  List_Enumerated(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Defered(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_Sets(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Set_Definition(Implementation(awsEc2SimulatorCtxImpl),VIRTUAL_MACHINES)==(?);
  Set_Definition(Implementation(awsEc2SimulatorCtxImpl),MACHINE_RESOURCES)==(?);
  Set_Definition(Implementation(awsEc2SimulatorCtxImpl),USERS)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(awsEc2SimulatorCtxImpl))==(?);
  Expanded_List_HiddenConstants(Implementation(awsEc2SimulatorCtxImpl))==(?);
  List_HiddenConstants(Implementation(awsEc2SimulatorCtxImpl))==(?);
  External_List_HiddenConstants(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(awsEc2SimulatorCtxImpl))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & allocated/=spot & admin: USERS & none: USERS & admin/=none & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}));
  Context_List_Properties(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Inherited_List_Properties(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  List_Properties(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(awsEc2SimulatorCtxImpl))==(btrue);
  Values_Subs(Implementation(awsEc2SimulatorCtxImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES,allocated,spot,admin,none: 0..10000,0..10000,0..100000,{0,1},1,0,1,0);
  List_Values(Implementation(awsEc2SimulatorCtxImpl))==(USERS = 0..10000;MACHINE_RESOURCES = 0..10000;VIRTUAL_MACHINES = 0..100000;VM_CATEGORIES = {0,1};allocated = 1;spot = 0;admin = 1;none = 0)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Constants(Implementation(awsEc2SimulatorCtxImpl))==(Type(allocated) == Cst(atype(VM_CATEGORIES,?,?));Type(spot) == Cst(atype(VM_CATEGORIES,?,?));Type(admin) == Cst(atype(USERS,?,?));Type(none) == Cst(atype(USERS,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(awsEc2SimulatorCtxImpl)) == (? | ? | ? | ? | ? | ? | ? | ? | awsEc2SimulatorCtxImpl);
  List_Of_HiddenCst_Ids(Implementation(awsEc2SimulatorCtxImpl)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(awsEc2SimulatorCtxImpl)) == (?);
  List_Of_VisibleVar_Ids(Implementation(awsEc2SimulatorCtxImpl)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(awsEc2SimulatorCtxImpl)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(awsEc2SimulatorCtxImpl)) == (Type(VM_CATEGORIES) == Cst(SetOf(btype(INTEGER,"[VM_CATEGORIES","]VM_CATEGORIES")));Type(VIRTUAL_MACHINES) == Cst(SetOf(btype(INTEGER,"[VIRTUAL_MACHINES","]VIRTUAL_MACHINES")));Type(MACHINE_RESOURCES) == Cst(SetOf(btype(INTEGER,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")));Type(USERS) == Cst(SetOf(btype(INTEGER,"[USERS","]USERS"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(awsEc2SimulatorCtxImpl)) == (Type(none) == Cst(btype(INTEGER,?,?));Type(admin) == Cst(btype(INTEGER,?,?));Type(spot) == Cst(btype(INTEGER,?,?));Type(allocated) == Cst(btype(INTEGER,?,?)))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(awsEc2SimulatorCtxImpl))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(awsEc2SimulatorCtxImpl))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
