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
  List_Valuable_Constants(Machine(awsEc2SimulatorCtx))==(allocated,spot,admin,none,user0,user1,user2,user3,mr0,mr1,mr2,mr3,vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,vm8,vm9);
  Inherited_List_Constants(Machine(awsEc2SimulatorCtx))==(?);
  List_Constants(Machine(awsEc2SimulatorCtx))==(allocated,spot,admin,none,user0,user1,user2,user3,mr0,mr1,mr2,mr3,vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,vm8,vm9)
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
  List_Properties(Machine(awsEc2SimulatorCtx))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & allocated/=spot & admin: USERS & none: USERS & admin/=none & user0: USERS & user1: USERS & user2: USERS & user3: USERS & user0/=admin & user0/=none & user0/=user1 & user0/=user2 & user0/=user3 & user1/=admin & user1/=none & user1/=user2 & user1/=user3 & user2/=admin & user2/=none & user2/=user3 & user3/=admin & user3/=none & mr0: MACHINE_RESOURCES & mr1: MACHINE_RESOURCES & mr2: MACHINE_RESOURCES & mr3: MACHINE_RESOURCES & mr0/=mr1 & mr0/=mr2 & mr0/=mr3 & mr1/=mr2 & mr1/=mr3 & mr2/=mr3 & vm0: VIRTUAL_MACHINES & vm1: VIRTUAL_MACHINES & vm2: VIRTUAL_MACHINES & vm3: VIRTUAL_MACHINES & vm4: VIRTUAL_MACHINES & vm5: VIRTUAL_MACHINES & vm6: VIRTUAL_MACHINES & vm7: VIRTUAL_MACHINES & vm8: VIRTUAL_MACHINES & vm9: VIRTUAL_MACHINES & vm0/=vm1 & vm0/=vm2 & vm0/=vm3 & vm0/=vm4 & vm0/=vm5 & vm0/=vm6 & vm0/=vm7 & vm0/=vm8 & vm0/=vm9 & vm1/=vm2 & vm1/=vm3 & vm1/=vm4 & vm1/=vm5 & vm1/=vm6 & vm1/=vm7 & vm1/=vm8 & vm1/=vm9 & vm2/=vm3 & vm2/=vm4 & vm2/=vm5 & vm2/=vm6 & vm2/=vm7 & vm2/=vm8 & vm2/=vm9 & vm3/=vm4 & vm3/=vm5 & vm3/=vm6 & vm3/=vm7 & vm3/=vm8 & vm3/=vm9 & vm4/=vm5 & vm4/=vm6 & vm4/=vm7 & vm4/=vm8 & vm4/=vm9 & vm5/=vm6 & vm5/=vm7 & vm5/=vm8 & vm5/=vm9 & vm6/=vm7 & vm6/=vm8 & vm6/=vm9 & vm7/=vm8 & vm7/=vm9 & vm8/=vm9 & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none,user0,user1,user2,user3,mr0,mr1,mr2,mr3,vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,vm8,vm9,USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | awsEc2SimulatorCtx);
  List_Of_HiddenCst_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none,user0,user1,user2,user3,mr0,mr1,mr2,mr3,vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,vm8,vm9);
  List_Of_VisibleVar_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(awsEc2SimulatorCtx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(awsEc2SimulatorCtx)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS")));Type(MACHINE_RESOURCES) == Cst(SetOf(atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")));Type(VIRTUAL_MACHINES) == Cst(SetOf(atype(VIRTUAL_MACHINES,"[VIRTUAL_MACHINES","]VIRTUAL_MACHINES")));Type(VM_CATEGORIES) == Cst(SetOf(atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(awsEc2SimulatorCtx)) == (Type(allocated) == Cst(atype(VM_CATEGORIES,?,?));Type(spot) == Cst(atype(VM_CATEGORIES,?,?));Type(admin) == Cst(atype(USERS,?,?));Type(none) == Cst(atype(USERS,?,?));Type(user0) == Cst(atype(USERS,?,?));Type(user1) == Cst(atype(USERS,?,?));Type(user2) == Cst(atype(USERS,?,?));Type(user3) == Cst(atype(USERS,?,?));Type(mr0) == Cst(atype(MACHINE_RESOURCES,?,?));Type(mr1) == Cst(atype(MACHINE_RESOURCES,?,?));Type(mr2) == Cst(atype(MACHINE_RESOURCES,?,?));Type(mr3) == Cst(atype(MACHINE_RESOURCES,?,?));Type(vm0) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm1) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm2) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm3) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm4) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm5) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm6) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm7) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm8) == Cst(atype(VIRTUAL_MACHINES,?,?));Type(vm9) == Cst(atype(VIRTUAL_MACHINES,?,?)))
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
