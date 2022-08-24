Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(machineResourceManagerCtx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(machineResourceManagerCtx))==(Machine(machineResourceManagerCtx));
  Level(Machine(machineResourceManagerCtx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(machineResourceManagerCtx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(machineResourceManagerCtx))==(?);
  List_Includes(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(machineResourceManagerCtx))==(?);
  Context_List_Variables(Machine(machineResourceManagerCtx))==(?);
  Abstract_List_Variables(Machine(machineResourceManagerCtx))==(?);
  Local_List_Variables(Machine(machineResourceManagerCtx))==(?);
  List_Variables(Machine(machineResourceManagerCtx))==(?);
  External_List_Variables(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(machineResourceManagerCtx))==(?);
  Abstract_List_VisibleVariables(Machine(machineResourceManagerCtx))==(?);
  External_List_VisibleVariables(Machine(machineResourceManagerCtx))==(?);
  Expanded_List_VisibleVariables(Machine(machineResourceManagerCtx))==(?);
  List_VisibleVariables(Machine(machineResourceManagerCtx))==(?);
  Internal_List_VisibleVariables(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(machineResourceManagerCtx))==(btrue);
  Gluing_List_Invariant(Machine(machineResourceManagerCtx))==(btrue);
  Expanded_List_Invariant(Machine(machineResourceManagerCtx))==(btrue);
  Abstract_List_Invariant(Machine(machineResourceManagerCtx))==(btrue);
  Context_List_Invariant(Machine(machineResourceManagerCtx))==(btrue);
  List_Invariant(Machine(machineResourceManagerCtx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(machineResourceManagerCtx))==(btrue);
  Abstract_List_Assertions(Machine(machineResourceManagerCtx))==(btrue);
  Context_List_Assertions(Machine(machineResourceManagerCtx))==(btrue);
  List_Assertions(Machine(machineResourceManagerCtx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(machineResourceManagerCtx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(machineResourceManagerCtx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(machineResourceManagerCtx))==(skip);
  Context_List_Initialisation(Machine(machineResourceManagerCtx))==(skip);
  List_Initialisation(Machine(machineResourceManagerCtx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(machineResourceManagerCtx))==(btrue);
  List_Constraints(Machine(machineResourceManagerCtx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(machineResourceManagerCtx))==(?);
  List_Operations(Machine(machineResourceManagerCtx))==(?)
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
  List_Valuable_Constants(Machine(machineResourceManagerCtx))==(?);
  Inherited_List_Constants(Machine(machineResourceManagerCtx))==(?);
  List_Constants(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(machineResourceManagerCtx),MACHINE_RESOURCES)==(?);
  Context_List_Enumerated(Machine(machineResourceManagerCtx))==(?);
  Context_List_Defered(Machine(machineResourceManagerCtx))==(?);
  Context_List_Sets(Machine(machineResourceManagerCtx))==(?);
  List_Valuable_Sets(Machine(machineResourceManagerCtx))==(MACHINE_RESOURCES);
  Inherited_List_Enumerated(Machine(machineResourceManagerCtx))==(?);
  Inherited_List_Defered(Machine(machineResourceManagerCtx))==(?);
  Inherited_List_Sets(Machine(machineResourceManagerCtx))==(?);
  List_Enumerated(Machine(machineResourceManagerCtx))==(?);
  List_Defered(Machine(machineResourceManagerCtx))==(MACHINE_RESOURCES);
  List_Sets(Machine(machineResourceManagerCtx))==(MACHINE_RESOURCES)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(machineResourceManagerCtx))==(?);
  Expanded_List_HiddenConstants(Machine(machineResourceManagerCtx))==(?);
  List_HiddenConstants(Machine(machineResourceManagerCtx))==(?);
  External_List_HiddenConstants(Machine(machineResourceManagerCtx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(machineResourceManagerCtx))==(btrue);
  Context_List_Properties(Machine(machineResourceManagerCtx))==(btrue);
  Inherited_List_Properties(Machine(machineResourceManagerCtx))==(btrue);
  List_Properties(Machine(machineResourceManagerCtx))==(MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(machineResourceManagerCtx)) == (MACHINE_RESOURCES | ? | ? | ? | ? | ? | ? | ? | machineResourceManagerCtx);
  List_Of_HiddenCst_Ids(Machine(machineResourceManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(machineResourceManagerCtx)) == (?);
  List_Of_VisibleVar_Ids(Machine(machineResourceManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(machineResourceManagerCtx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(machineResourceManagerCtx)) == (Type(MACHINE_RESOURCES) == Cst(SetOf(atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES"))))
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
