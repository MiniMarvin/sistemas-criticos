Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(userManagerCtx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(userManagerCtx))==(Machine(userManagerCtx));
  Level(Machine(userManagerCtx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(userManagerCtx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(userManagerCtx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(userManagerCtx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(userManagerCtx))==(?);
  List_Includes(Machine(userManagerCtx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(userManagerCtx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(userManagerCtx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(userManagerCtx))==(?);
  Context_List_Variables(Machine(userManagerCtx))==(?);
  Abstract_List_Variables(Machine(userManagerCtx))==(?);
  Local_List_Variables(Machine(userManagerCtx))==(?);
  List_Variables(Machine(userManagerCtx))==(?);
  External_List_Variables(Machine(userManagerCtx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(userManagerCtx))==(?);
  Abstract_List_VisibleVariables(Machine(userManagerCtx))==(?);
  External_List_VisibleVariables(Machine(userManagerCtx))==(?);
  Expanded_List_VisibleVariables(Machine(userManagerCtx))==(?);
  List_VisibleVariables(Machine(userManagerCtx))==(?);
  Internal_List_VisibleVariables(Machine(userManagerCtx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(userManagerCtx))==(btrue);
  Gluing_List_Invariant(Machine(userManagerCtx))==(btrue);
  Expanded_List_Invariant(Machine(userManagerCtx))==(btrue);
  Abstract_List_Invariant(Machine(userManagerCtx))==(btrue);
  Context_List_Invariant(Machine(userManagerCtx))==(btrue);
  List_Invariant(Machine(userManagerCtx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(userManagerCtx))==(btrue);
  Abstract_List_Assertions(Machine(userManagerCtx))==(btrue);
  Context_List_Assertions(Machine(userManagerCtx))==(btrue);
  List_Assertions(Machine(userManagerCtx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(userManagerCtx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(userManagerCtx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(userManagerCtx))==(skip);
  Context_List_Initialisation(Machine(userManagerCtx))==(skip);
  List_Initialisation(Machine(userManagerCtx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(userManagerCtx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(userManagerCtx))==(btrue);
  List_Constraints(Machine(userManagerCtx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(userManagerCtx))==(?);
  List_Operations(Machine(userManagerCtx))==(?)
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
  List_Valuable_Constants(Machine(userManagerCtx))==(?);
  Inherited_List_Constants(Machine(userManagerCtx))==(?);
  List_Constants(Machine(userManagerCtx))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(userManagerCtx),USERS)==(?);
  Context_List_Enumerated(Machine(userManagerCtx))==(?);
  Context_List_Defered(Machine(userManagerCtx))==(?);
  Context_List_Sets(Machine(userManagerCtx))==(?);
  List_Valuable_Sets(Machine(userManagerCtx))==(USERS);
  Inherited_List_Enumerated(Machine(userManagerCtx))==(?);
  Inherited_List_Defered(Machine(userManagerCtx))==(?);
  Inherited_List_Sets(Machine(userManagerCtx))==(?);
  List_Enumerated(Machine(userManagerCtx))==(?);
  List_Defered(Machine(userManagerCtx))==(USERS);
  List_Sets(Machine(userManagerCtx))==(USERS)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(userManagerCtx))==(?);
  Expanded_List_HiddenConstants(Machine(userManagerCtx))==(?);
  List_HiddenConstants(Machine(userManagerCtx))==(?);
  External_List_HiddenConstants(Machine(userManagerCtx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(userManagerCtx))==(btrue);
  Context_List_Properties(Machine(userManagerCtx))==(btrue);
  Inherited_List_Properties(Machine(userManagerCtx))==(btrue);
  List_Properties(Machine(userManagerCtx))==(USERS: FIN(INTEGER) & not(USERS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(userManagerCtx)) == (USERS | ? | ? | ? | ? | ? | ? | ? | userManagerCtx);
  List_Of_HiddenCst_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(userManagerCtx)) == (?);
  List_Of_VisibleVar_Ids(Machine(userManagerCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(userManagerCtx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(userManagerCtx)) == (Type(USERS) == Cst(SetOf(atype(USERS,"[USERS","]USERS"))))
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
