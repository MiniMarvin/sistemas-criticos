Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(userManager))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(userManager))==(Machine(userManager));
  Level(Machine(userManager))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(userManager)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(userManager))==(userManagerCtx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(userManager))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(userManager))==(?);
  List_Includes(Machine(userManager))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(userManager))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(userManager))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(userManager))==(?);
  Context_List_Variables(Machine(userManager))==(?);
  Abstract_List_Variables(Machine(userManager))==(?);
  Local_List_Variables(Machine(userManager))==(clients,admins);
  List_Variables(Machine(userManager))==(clients,admins);
  External_List_Variables(Machine(userManager))==(clients,admins)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(userManager))==(?);
  Abstract_List_VisibleVariables(Machine(userManager))==(?);
  External_List_VisibleVariables(Machine(userManager))==(?);
  Expanded_List_VisibleVariables(Machine(userManager))==(?);
  List_VisibleVariables(Machine(userManager))==(?);
  Internal_List_VisibleVariables(Machine(userManager))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(userManager))==(btrue);
  Gluing_List_Invariant(Machine(userManager))==(btrue);
  Expanded_List_Invariant(Machine(userManager))==(btrue);
  Abstract_List_Invariant(Machine(userManager))==(btrue);
  Context_List_Invariant(Machine(userManager))==(btrue);
  List_Invariant(Machine(userManager))==(USERS: FIN(USERS) & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(userManager))==(btrue);
  Abstract_List_Assertions(Machine(userManager))==(btrue);
  Context_List_Assertions(Machine(userManager))==(btrue);
  List_Assertions(Machine(userManager))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(userManager))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(userManager))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(userManager))==(admins,clients:={admin},{});
  Context_List_Initialisation(Machine(userManager))==(skip);
  List_Initialisation(Machine(userManager))==(admins:={admin} || clients:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(userManager))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(userManager),Machine(userManagerCtx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(userManager))==(btrue);
  List_Constraints(Machine(userManager))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient);
  List_Operations(Machine(userManager))==(addClient,addAdmin,removeAdmin,removeClient)
END
&
THEORY ListInputX IS
  List_Input(Machine(userManager),addClient)==(user,caller);
  List_Input(Machine(userManager),addAdmin)==(user,caller);
  List_Input(Machine(userManager),removeAdmin)==(user,caller);
  List_Input(Machine(userManager),removeClient)==(user,caller)
END
&
THEORY ListOutputX IS
  List_Output(Machine(userManager),addClient)==(?);
  List_Output(Machine(userManager),addAdmin)==(?);
  List_Output(Machine(userManager),removeAdmin)==(?);
  List_Output(Machine(userManager),removeClient)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(userManager),addClient)==(addClient(user,caller));
  List_Header(Machine(userManager),addAdmin)==(addAdmin(user,caller));
  List_Header(Machine(userManager),removeAdmin)==(removeAdmin(user,caller));
  List_Header(Machine(userManager),removeClient)==(removeClient(user,caller))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(userManager),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(userManager),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins);
  List_Precondition(Machine(userManager),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins);
  List_Precondition(Machine(userManager),removeClient)==(user: USERS & user: clients & caller: admins)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(userManager),removeClient)==(user: USERS & user: clients & caller: admins | clients:=clients-{user});
  Expanded_List_Substitution(Machine(userManager),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & caller: admins | admins:=admins-{user});
  Expanded_List_Substitution(Machine(userManager),addAdmin)==(user: USERS & user/:clients & user/:admins & caller: admins | admins:=admins\/{user});
  Expanded_List_Substitution(Machine(userManager),addClient)==(user: USERS & user/:clients & user/:admins & caller: admins | clients:=clients\/{user});
  List_Substitution(Machine(userManager),addClient)==(clients:=clients\/{user});
  List_Substitution(Machine(userManager),addAdmin)==(admins:=admins\/{user});
  List_Substitution(Machine(userManager),removeAdmin)==(admins:=admins-{user});
  List_Substitution(Machine(userManager),removeClient)==(clients:=clients-{user})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(userManager))==(admin);
  Inherited_List_Constants(Machine(userManager))==(?);
  List_Constants(Machine(userManager))==(admin)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(userManager))==(?);
  Context_List_Defered(Machine(userManager))==(USERS);
  Context_List_Sets(Machine(userManager))==(USERS);
  List_Valuable_Sets(Machine(userManager))==(?);
  Inherited_List_Enumerated(Machine(userManager))==(?);
  Inherited_List_Defered(Machine(userManager))==(?);
  Inherited_List_Sets(Machine(userManager))==(?);
  List_Enumerated(Machine(userManager))==(?);
  List_Defered(Machine(userManager))==(?);
  List_Sets(Machine(userManager))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(userManager))==(?);
  Expanded_List_HiddenConstants(Machine(userManager))==(?);
  List_HiddenConstants(Machine(userManager))==(?);
  External_List_HiddenConstants(Machine(userManager))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(userManager))==(btrue);
  Context_List_Properties(Machine(userManager))==(USERS: FIN(INTEGER) & not(USERS = {}));
  Inherited_List_Properties(Machine(userManager))==(btrue);
  List_Properties(Machine(userManager))==(admin: USERS)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(userManager),Machine(userManagerCtx))==(?);
  Seen_Context_List_Enumerated(Machine(userManager))==(?);
  Seen_Context_List_Invariant(Machine(userManager))==(btrue);
  Seen_Context_List_Assertions(Machine(userManager))==(btrue);
  Seen_Context_List_Properties(Machine(userManager))==(btrue);
  Seen_List_Constraints(Machine(userManager))==(btrue);
  Seen_List_Operations(Machine(userManager),Machine(userManagerCtx))==(?);
  Seen_Expanded_List_Invariant(Machine(userManager),Machine(userManagerCtx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(userManager),addClient)==(?);
  List_ANY_Var(Machine(userManager),addAdmin)==(?);
  List_ANY_Var(Machine(userManager),removeAdmin)==(?);
  List_ANY_Var(Machine(userManager),removeClient)==(?)
END
&
THEORY ListOfIdsX IS
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
THEORY ConstantsEnvX IS
  Constants(Machine(userManager)) == (Type(admin) == Cst(atype(USERS,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(userManager)) == (Type(clients) == Mvl(SetOf(atype(USERS,?,?)));Type(admins) == Mvl(SetOf(atype(USERS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(userManager)) == (Type(removeClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(removeAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addAdmin) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?));Type(addClient) == Cst(No_type,atype(USERS,?,?)*atype(USERS,?,?)))
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
