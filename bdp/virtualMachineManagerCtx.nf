Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(virtualMachineManagerCtx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(virtualMachineManagerCtx))==(Machine(virtualMachineManagerCtx));
  Level(Machine(virtualMachineManagerCtx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(virtualMachineManagerCtx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(virtualMachineManagerCtx))==(?);
  List_Includes(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(virtualMachineManagerCtx))==(?);
  Context_List_Variables(Machine(virtualMachineManagerCtx))==(?);
  Abstract_List_Variables(Machine(virtualMachineManagerCtx))==(?);
  Local_List_Variables(Machine(virtualMachineManagerCtx))==(?);
  List_Variables(Machine(virtualMachineManagerCtx))==(?);
  External_List_Variables(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?);
  Abstract_List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?);
  External_List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?);
  Expanded_List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?);
  List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?);
  Internal_List_VisibleVariables(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(virtualMachineManagerCtx))==(btrue);
  Gluing_List_Invariant(Machine(virtualMachineManagerCtx))==(btrue);
  Expanded_List_Invariant(Machine(virtualMachineManagerCtx))==(btrue);
  Abstract_List_Invariant(Machine(virtualMachineManagerCtx))==(btrue);
  Context_List_Invariant(Machine(virtualMachineManagerCtx))==(btrue);
  List_Invariant(Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(virtualMachineManagerCtx))==(btrue);
  Abstract_List_Assertions(Machine(virtualMachineManagerCtx))==(btrue);
  Context_List_Assertions(Machine(virtualMachineManagerCtx))==(btrue);
  List_Assertions(Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(virtualMachineManagerCtx))==(skip);
  Context_List_Initialisation(Machine(virtualMachineManagerCtx))==(skip);
  List_Initialisation(Machine(virtualMachineManagerCtx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(virtualMachineManagerCtx))==(btrue);
  List_Constraints(Machine(virtualMachineManagerCtx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(virtualMachineManagerCtx))==(?);
  List_Operations(Machine(virtualMachineManagerCtx))==(?)
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
  List_Valuable_Constants(Machine(virtualMachineManagerCtx))==(allocated,spot);
  Inherited_List_Constants(Machine(virtualMachineManagerCtx))==(?);
  List_Constants(Machine(virtualMachineManagerCtx))==(allocated,spot)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(virtualMachineManagerCtx),VIRTUAL_MACHINES)==(?);
  Context_List_Enumerated(Machine(virtualMachineManagerCtx))==(?);
  Context_List_Defered(Machine(virtualMachineManagerCtx))==(?);
  Context_List_Sets(Machine(virtualMachineManagerCtx))==(?);
  List_Valuable_Sets(Machine(virtualMachineManagerCtx))==(VIRTUAL_MACHINES,VM_CATEGORIES);
  Inherited_List_Enumerated(Machine(virtualMachineManagerCtx))==(?);
  Inherited_List_Defered(Machine(virtualMachineManagerCtx))==(?);
  Inherited_List_Sets(Machine(virtualMachineManagerCtx))==(?);
  List_Enumerated(Machine(virtualMachineManagerCtx))==(?);
  List_Defered(Machine(virtualMachineManagerCtx))==(VIRTUAL_MACHINES,VM_CATEGORIES);
  List_Sets(Machine(virtualMachineManagerCtx))==(VIRTUAL_MACHINES,VM_CATEGORIES);
  Set_Definition(Machine(virtualMachineManagerCtx),VM_CATEGORIES)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(virtualMachineManagerCtx))==(?);
  Expanded_List_HiddenConstants(Machine(virtualMachineManagerCtx))==(?);
  List_HiddenConstants(Machine(virtualMachineManagerCtx))==(?);
  External_List_HiddenConstants(Machine(virtualMachineManagerCtx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(virtualMachineManagerCtx))==(btrue);
  Context_List_Properties(Machine(virtualMachineManagerCtx))==(btrue);
  Inherited_List_Properties(Machine(virtualMachineManagerCtx))==(btrue);
  List_Properties(Machine(virtualMachineManagerCtx))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(virtualMachineManagerCtx)) == (allocated,spot,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | virtualMachineManagerCtx);
  List_Of_HiddenCst_Ids(Machine(virtualMachineManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(virtualMachineManagerCtx)) == (allocated,spot);
  List_Of_VisibleVar_Ids(Machine(virtualMachineManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(virtualMachineManagerCtx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(virtualMachineManagerCtx)) == (Type(VIRTUAL_MACHINES) == Cst(SetOf(atype(VIRTUAL_MACHINES,"[VIRTUAL_MACHINES","]VIRTUAL_MACHINES")));Type(VM_CATEGORIES) == Cst(SetOf(atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(virtualMachineManagerCtx)) == (Type(allocated) == Cst(atype(VM_CATEGORIES,?,?));Type(spot) == Cst(atype(VM_CATEGORIES,?,?)))
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
