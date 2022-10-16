Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(awsEc2SimulatorImpl))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(awsEc2SimulatorImpl))==(Machine(awsEc2Simulator));
  Level(Implementation(awsEc2SimulatorImpl))==(1);
  Upper_Level(Implementation(awsEc2SimulatorImpl))==(Machine(awsEc2Simulator))
END
&
THEORY LoadedStructureX IS
  Implementation(awsEc2SimulatorImpl)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(awsEc2SimulatorImpl))==(awsEc2SimulatorCtx)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(awsEc2SimulatorImpl))==(?);
  Inherited_List_Includes(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(awsEc2SimulatorImpl))==(?);
  Context_List_Variables(Implementation(awsEc2SimulatorImpl))==(?);
  Abstract_List_Variables(Implementation(awsEc2SimulatorImpl))==(currentUser,finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  Local_List_Variables(Implementation(awsEc2SimulatorImpl))==(?);
  List_Variables(Implementation(awsEc2SimulatorImpl))==(?);
  External_List_Variables(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(?);
  Abstract_List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(?);
  External_List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(?);
  Expanded_List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(?);
  List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(vmSeq,mrSeq,userSeq,currentUser,finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources);
  Internal_List_VisibleVariables(Implementation(awsEc2SimulatorImpl))==(vmSeq,mrSeq,userSeq,currentUser,finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(awsEc2SimulatorImpl))==(btrue);
  Expanded_List_Invariant(Implementation(awsEc2SimulatorImpl))==(btrue);
  Abstract_List_Invariant(Implementation(awsEc2SimulatorImpl))==(currentUser: USERS & admins <: USERS & clients <: USERS & admins/\clients = {} & admins/={} & currentTime: NATURAL & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES) & machineResources <: MACHINE_RESOURCES & machineResourceProperties: machineResources --> struct(cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & VM_CATEGORIES: FIN(VM_CATEGORIES) & vmCategories <: VM_CATEGORIES & virtualMachines <: VIRTUAL_MACHINES & virtualMachines: FIN(virtualMachines) & virtualMachineProperties: virtualMachines --> struct(residentMachine>>MACHINE_RESOURCES,owner>>USERS,category>>VM_CATEGORIES,startTime>>NAT,cpu>>NAT1,hdd>>NAT1,mem>>NAT1) & virtualMachineProperties: FIN(virtualMachineProperties) & spotVirtualMachines <: virtualMachines & allocatedVirtualMachines <: virtualMachines & spotVirtualMachines\/allocatedVirtualMachines = virtualMachines & spotVirtualMachines/\allocatedVirtualMachines = {} & finishedInstanceCost: USERS +-> NAT & instanceRating: {allocated,spot} +-> struct(cpu>>NAT,hdd>>NAT,mem>>NAT));
  Context_List_Invariant(Implementation(awsEc2SimulatorImpl))==(USERS: FIN(USERS) & VM_CATEGORIES: FIN(VM_CATEGORIES) & VIRTUAL_MACHINES: FIN(VIRTUAL_MACHINES) & MACHINE_RESOURCES: FIN(MACHINE_RESOURCES));
  List_Invariant(Implementation(awsEc2SimulatorImpl))==(currentTime: NAT & userSeq: iseq(USERS) & mrSeq: iseq(MACHINE_RESOURCES) & vmSeq: iseq(VIRTUAL_MACHINES) & ran(userSeq) = USERS-clients-admins & ran(mrSeq) = MACHINE_RESOURCES-machineResources & ran(vmSeq) = VIRTUAL_MACHINES-virtualMachines)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(awsEc2SimulatorImpl))==(btrue);
  Abstract_List_Assertions(Implementation(awsEc2SimulatorImpl))==(btrue);
  Context_List_Assertions(Implementation(awsEc2SimulatorImpl))==(btrue);
  List_Assertions(Implementation(awsEc2SimulatorImpl))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(awsEc2SimulatorImpl))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(awsEc2SimulatorImpl))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(awsEc2SimulatorImpl))==(admins:={admin};currentUser:=none;clients:={};machineResources:={};machineResourceProperties:={};virtualMachines:={};virtualMachineProperties:={};vmCategories:={allocated,spot};spotVirtualMachines:={};allocatedVirtualMachines:={};(0: INT | currentTime:=0);instanceRating:={allocated|->rec(cpu>>2,hdd>>2,mem>>2),spot|->rec(cpu>>1,hdd>>1,mem>>1)};finishedInstanceCost:={};(ss-1: INT & ss: INT & 1: INT & (ss-1)*card(USERS): INT & card(USERS): INT & (ss-1)*card(USERS)+ss: INT & (ss-1)*card(USERS)+ss: dom((1..card(USERS))*USERS) | userSeq:=%ss.(ss: 1..card(USERS) | ((1..card(USERS))*USERS)((ss-1)*card(USERS)+ss)));(ss-1: INT & ss: INT & 1: INT & (ss-1)*card(MACHINE_RESOURCES): INT & card(MACHINE_RESOURCES): INT & (ss-1)*card(MACHINE_RESOURCES)+ss: INT & (ss-1)*card(MACHINE_RESOURCES)+ss: dom((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES) | mrSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss)));(ss-1: INT & ss: INT & 1: INT & (ss-1)*card(VIRTUAL_MACHINES): INT & card(VIRTUAL_MACHINES): INT & (ss-1)*card(VIRTUAL_MACHINES)+ss: INT & (ss-1)*card(VIRTUAL_MACHINES)+ss: dom((1..card(VIRTUAL_MACHINES))*VIRTUAL_MACHINES) | vmSeq:=%ss.(ss: 1..card(VIRTUAL_MACHINES) | ((1..card(VIRTUAL_MACHINES))*VIRTUAL_MACHINES)((ss-1)*card(VIRTUAL_MACHINES)+ss))));
  Context_List_Initialisation(Implementation(awsEc2SimulatorImpl))==(skip);
  List_Initialisation(Implementation(awsEc2SimulatorImpl))==(admins:={admin};currentUser:=none;clients:={};machineResources:={};machineResourceProperties:={};virtualMachines:={};virtualMachineProperties:={};vmCategories:={allocated,spot};spotVirtualMachines:={};allocatedVirtualMachines:={};currentTime:=0;instanceRating:={allocated|->rec(cpu>>2,hdd>>2,mem>>2),spot|->rec(cpu>>1,hdd>>1,mem>>1)};finishedInstanceCost:={};userSeq:=%ss.(ss: 1..card(USERS) | ((1..card(USERS))*USERS)((ss-1)*card(USERS)+ss));mrSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss));vmSeq:=%ss.(ss: 1..card(VIRTUAL_MACHINES) | ((1..card(VIRTUAL_MACHINES))*VIRTUAL_MACHINES)((ss-1)*card(VIRTUAL_MACHINES)+ss)))
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(awsEc2SimulatorImpl))==(btrue);
  List_Context_Constraints(Implementation(awsEc2SimulatorImpl))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(awsEc2SimulatorImpl))==(setInstanceRating,login,logout,addClient,addArbitraryClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser);
  List_Operations(Implementation(awsEc2SimulatorImpl))==(setInstanceRating,login,logout,addClient,addArbitraryClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser)
END
&
THEORY ListInputX IS
  List_Input(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(instanceType,cpuRating,hddRating,memRating);
  List_Input(Implementation(awsEc2SimulatorImpl),login)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),logout)==(?);
  List_Input(Implementation(awsEc2SimulatorImpl),addClient)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(?);
  List_Input(Implementation(awsEc2SimulatorImpl),addAdmin)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),removeAdmin)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),removeClient)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),listClients)==(user);
  List_Input(Implementation(awsEc2SimulatorImpl),tickTimer)==(?);
  List_Input(Implementation(awsEc2SimulatorImpl),addResource)==(cpu,hdd,mem);
  List_Input(Implementation(awsEc2SimulatorImpl),removeResource)==(resource);
  List_Input(Implementation(awsEc2SimulatorImpl),listResources)==(?);
  List_Input(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(cpu,hdd,mem,client);
  List_Input(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(vm);
  List_Input(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(machine);
  List_Input(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(machine);
  List_Input(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(resourceTypes,user);
  List_Input(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(vm);
  List_Input(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(user)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),login)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),logout)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),addClient)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),addAdmin)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),removeAdmin)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),removeClient)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),listClients)==(clientList);
  List_Output(Implementation(awsEc2SimulatorImpl),tickTimer)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),addResource)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),removeResource)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),listResources)==(resourceList);
  List_Output(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(?);
  List_Output(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(vms);
  List_Output(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(totalCpu);
  List_Output(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(vmList);
  List_Output(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(billing);
  List_Output(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(billing)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(setInstanceRating(instanceType,cpuRating,hddRating,memRating));
  List_Header(Implementation(awsEc2SimulatorImpl),login)==(login(user));
  List_Header(Implementation(awsEc2SimulatorImpl),logout)==(logout);
  List_Header(Implementation(awsEc2SimulatorImpl),addClient)==(addClient(user));
  List_Header(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(addArbitraryClient);
  List_Header(Implementation(awsEc2SimulatorImpl),addAdmin)==(addAdmin(user));
  List_Header(Implementation(awsEc2SimulatorImpl),removeAdmin)==(removeAdmin(user));
  List_Header(Implementation(awsEc2SimulatorImpl),removeClient)==(removeClient(user));
  List_Header(Implementation(awsEc2SimulatorImpl),listClients)==(clientList <-- listClients(user));
  List_Header(Implementation(awsEc2SimulatorImpl),tickTimer)==(tickTimer);
  List_Header(Implementation(awsEc2SimulatorImpl),addResource)==(addResource(cpu,hdd,mem));
  List_Header(Implementation(awsEc2SimulatorImpl),removeResource)==(removeResource(resource));
  List_Header(Implementation(awsEc2SimulatorImpl),listResources)==(resourceList <-- listResources);
  List_Header(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(addAllocatedVirtualMachine(cpu,hdd,mem,client));
  List_Header(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(addSpotVirtualMachine(cpu,hdd,mem,client));
  List_Header(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(removeVirtualMachine(vm));
  List_Header(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(vms <-- getAllocatedVmsOnMachine(machine));
  List_Header(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(totalCpu <-- getAllocatedCpuOnMachine(machine));
  List_Header(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(vmList <-- listVmsForUser(resourceTypes,user));
  List_Header(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(billing <-- getBillingForRunningVM(vm));
  List_Header(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(billing <-- getBillingForUser(user))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(instanceType: {allocated,spot} & cpuRating: NAT1 & hddRating: NAT1 & memRating: NAT1 & hddRating: NAT1 & currentUser: {admin});
  Own_Precondition(Implementation(awsEc2SimulatorImpl),login)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),login)==(currentUser = none & user: admins\/clients);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),logout)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),logout)==(currentUser/=none);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addClient)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addClient)==(user: USERS & user/:clients & user/:admins & currentUser: admins & user/=none);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(currentUser: admins);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addAdmin)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addAdmin)==(user: USERS & user/:clients & user/:admins & currentUser: admins & user/=none);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),removeAdmin)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & currentUser: admins);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),removeClient)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),removeClient)==(user: USERS & user: clients & currentUser: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {});
  Own_Precondition(Implementation(awsEc2SimulatorImpl),listClients)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),listClients)==(user: USERS & currentUser: admins);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),tickTimer)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),tickTimer)==(btrue);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addResource)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & currentUser: admins);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),removeResource)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),removeResource)==(resource: machineResources & resource: machineResources & currentUser: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {});
  Own_Precondition(Implementation(awsEc2SimulatorImpl),listResources)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),listResources)==(btrue);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(vm: virtualMachines & vm: dom(virtualMachineProperties) & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime);
  Own_Precondition(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  Own_Precondition(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties));
  Own_Precondition(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & currentUser: admins\/{user});
  Own_Precondition(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(vm: virtualMachines & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating));
  Own_Precondition(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(btrue);
  List_Precondition(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(user: clients & user: dom(finishedInstanceCost) & currentUser: admins\/{user})
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(user: clients & user: dom(finishedInstanceCost) & currentUser: admins\/{user} | user: clients & user: dom(finishedInstanceCost) & currentUser: admins\/{user} ==> (SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime))+finishedInstanceCost(user): INT & vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category: dom(instanceRating) & virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu: INT & virtualMachineProperties(vm)'cpu: INT & instanceRating(virtualMachineProperties(vm)'category)'cpu: INT & currentTime-virtualMachineProperties(vm)'startTime: INT & currentTime: INT & virtualMachineProperties(vm)'startTime: INT & virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime): INT & virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd: INT & virtualMachineProperties(vm)'hdd: INT & instanceRating(virtualMachineProperties(vm)'category)'hdd: INT & virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem: INT & virtualMachineProperties(vm)'mem: INT & instanceRating(virtualMachineProperties(vm)'category)'mem: INT & virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT & virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT & user: dom(finishedInstanceCost) & SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime)): INT & finishedInstanceCost(user): INT | billing:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime))+finishedInstanceCost(user)) [] not(user: clients & user: dom(finishedInstanceCost) & currentUser: admins\/{user}) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(vm: virtualMachines & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating) | vm: virtualMachines & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating) ==> (instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT & vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu: INT & instanceRating(virtualMachineProperties(vm)'category)'cpu: INT & virtualMachineProperties(vm)'cpu: INT & currentTime-virtualMachineProperties(vm)'startTime: INT & currentTime: INT & virtualMachineProperties(vm)'startTime: INT & instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime): INT & instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd: INT & instanceRating(virtualMachineProperties(vm)'category)'hdd: INT & virtualMachineProperties(vm)'hdd: INT & instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem: INT & instanceRating(virtualMachineProperties(vm)'category)'mem: INT & virtualMachineProperties(vm)'mem: INT & instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT | billing:=instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime)) [] not(vm: virtualMachines & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating)) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(resourceTypes <: VM_CATEGORIES & user: USERS & currentUser: admins\/{user} | resourceTypes <: VM_CATEGORIES & user: USERS & currentUser: admins\/{user} ==> (vm: dom(virtualMachineProperties) | vmList:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user}) [] not(resourceTypes <: VM_CATEGORIES & user: USERS & currentUser: admins\/{user}) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | machine: machineResources & machine: dom(machineResourceProperties) ==> (SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu): INT & vm: dom(virtualMachineProperties) | totalCpu:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu)) [] not(machine: machineResources & machine: dom(machineResourceProperties)) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(machine: machineResources & machine: dom(machineResourceProperties) | machine: machineResources & machine: dom(machineResourceProperties) ==> (vm: dom(virtualMachineProperties) | vms:={vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = machine}) [] not(machine: machineResources & machine: dom(machineResourceProperties)) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(vm: virtualMachines & vm: dom(virtualMachineProperties) & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime | vm: virtualMachines & vm: dom(virtualMachineProperties) & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime ==> (virtualMachines:=virtualMachines-{vm};virtualMachineProperties:={vm}<<|virtualMachineProperties;allocatedVirtualMachines:=allocatedVirtualMachines-{vm};spotVirtualMachines:=spotVirtualMachines-{vm};(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu: INT & instanceRating(virtualMachineProperties(vm)'category)'cpu: INT & virtualMachineProperties(vm)'cpu: INT & currentTime-virtualMachineProperties(vm)'startTime: INT & currentTime: INT & virtualMachineProperties(vm)'startTime: INT & instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime): INT & finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime): INT & finishedInstanceCost(virtualMachineProperties(vm)'owner): INT & instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd: INT & instanceRating(virtualMachineProperties(vm)'category)'hdd: INT & virtualMachineProperties(vm)'hdd: INT & instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime): INT & instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem: INT & instanceRating(virtualMachineProperties(vm)'category)'mem: INT & virtualMachineProperties(vm)'mem: INT & instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime): INT | finishedInstanceCost:=finishedInstanceCost<+{virtualMachineProperties(vm)'owner|->finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime)})) [] not(vm: virtualMachines & vm: dom(virtualMachineProperties) & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients | cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients ==> @(machine,machineSeq).((ss-1: INT & ss: INT & 1: INT & (ss-1)*card(MACHINE_RESOURCES): INT & card(MACHINE_RESOURCES): INT & (ss-1)*card(MACHINE_RESOURCES)+ss: INT & (ss-1)*card(MACHINE_RESOURCES)+ss: dom((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES) | machineSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss)));machine:=first(machineSeq);WHILE machineSeq/=<> DO @(cpuTotal,hddTotal,memTotal,vm).((virtualMachine: dom(virtualMachineProperties) | cpuTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'cpu));(virtualMachine: dom(virtualMachineProperties) | hddTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'hdd));(virtualMachine: dom(virtualMachineProperties) | memTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'mem));vm:=first(vmSeq);(machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal ==> (vmSeq:=tail(vmSeq);virtualMachines:=virtualMachines\/{vm};spotVirtualMachines:=spotVirtualMachines\/{vm};(vm: dom(virtualMachineProperties) | virtualMachineProperties:=virtualMachineProperties<+{vm|->rec(residentMachine>>machine,owner>>client,category>>spot,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem)});machineSeq:=<>) [] not(machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal) ==> machineSeq:=tail(machineSeq))) INVARIANT machine: machineResources VARIANT card(machineResources)-size(machineSeq) END) [] not(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients | cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients ==> @(machine,machineSeq).((ss-1: INT & ss: INT & 1: INT & (ss-1)*card(MACHINE_RESOURCES): INT & card(MACHINE_RESOURCES): INT & (ss-1)*card(MACHINE_RESOURCES)+ss: INT & (ss-1)*card(MACHINE_RESOURCES)+ss: dom((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES) | machineSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss)));machine:=first(machineSeq);WHILE machineSeq/=<> DO @(cpuTotal,hddTotal,memTotal,vm).((virtualMachine: dom(virtualMachineProperties) | cpuTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'cpu));(virtualMachine: dom(virtualMachineProperties) | hddTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'hdd));(virtualMachine: dom(virtualMachineProperties) | memTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'mem));vm:=first(vmSeq);(machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal ==> (vmSeq:=tail(vmSeq);(vm: dom(virtualMachineProperties) | virtualMachines:=(virtualMachines\/{vm})-{vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine});allocatedVirtualMachines:=allocatedVirtualMachines\/{vm};(vm: dom(virtualMachineProperties) | virtualMachineProperties:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine}<<|(virtualMachineProperties\/{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem)}));(vm: dom(virtualMachineProperties) | spotVirtualMachines:=spotVirtualMachines-{vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine});machineSeq:=<>) [] not(machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal) ==> machineSeq:=tail(machineSeq))) INVARIANT machine: machineResources VARIANT card(machineResources)-size(machineSeq) END) [] not(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),listResources)==(btrue | resourceList:=machineResourceProperties);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),removeResource)==(resource: machineResources & resource: machineResources & currentUser: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {} | resource: machineResources & resource: machineResources & currentUser: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {} ==> (machineResources:=machineResources-{resource};machineResourceProperties:={resource}<<|machineResourceProperties) [] not(resource: machineResources & resource: machineResources & currentUser: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {}) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addResource)==(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & currentUser: admins | cpu: NAT1 & hdd: NAT1 & mem: NAT1 & currentUser: admins ==> (machineResources:=machineResources\/{first(mrSeq)};(first(mrSeq): dom(machineResourceProperties) | machineResourceProperties:=machineResourceProperties<+{first(mrSeq)|->rec(cpu>>cpu,hdd>>hdd,mem>>mem)});mrSeq:=tail(mrSeq)) [] not(cpu: NAT1 & hdd: NAT1 & mem: NAT1 & currentUser: admins) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),tickTimer)==(btrue & currentTime+1: INT & currentTime: INT & 1: INT | currentTime:=currentTime+1);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),listClients)==(user: USERS & currentUser: admins | user: USERS & currentUser: admins ==> clientList:=clients [] not(user: USERS & currentUser: admins) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),removeClient)==(user: USERS & user: clients & currentUser: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {} | user: USERS & user: clients & currentUser: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {} ==> (clients:=clients-{user};finishedInstanceCost:={user}<<|finishedInstanceCost) [] not(user: USERS & user: clients & currentUser: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {}) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),removeAdmin)==(user: USERS & user: admins & admins-{user}/={} & currentUser: admins | user: USERS & user: admins & card(admins)>1 & currentUser: admins ==> admins:=admins-{user} [] not(user: USERS & user: admins & card(admins)>1 & currentUser: admins) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addAdmin)==(user: USERS & user/:clients & user/:admins & currentUser: admins & user/=none | user: USERS & user/:clients & user/:admins & user/=none ==> admins:=admins\/{user} [] not(user: USERS & user/:clients & user/:admins & user/=none) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(currentUser: admins | currentUser: admins ==> (clients:=clients\/{first(userSeq)};(first(userSeq): dom(finishedInstanceCost) & 0: INT | finishedInstanceCost:=finishedInstanceCost<+{first(userSeq)|->0});userSeq:=tail(userSeq)) [] not(currentUser: admins) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),addClient)==(user: USERS & user/:clients & user/:admins & currentUser: admins & user/=none | user/:clients & user/:admins & currentUser: admins & user/=none ==> (clients:=clients\/{user};(user: dom(finishedInstanceCost) & 0: INT | finishedInstanceCost:=finishedInstanceCost<+{user|->0})) [] not(user/:clients & user/:admins & currentUser: admins & user/=none) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),logout)==(currentUser/=none | currentUser:=none);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),login)==(currentUser = none & user: admins\/clients | user/=none ==> currentUser:=user [] not(user/=none) ==> skip);
  Expanded_List_Substitution(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(instanceType: {allocated,spot} & cpuRating: NAT1 & hddRating: NAT1 & memRating: NAT1 & hddRating: NAT1 & currentUser: {admin} | cpuRating>0 & hddRating>0 & memRating>0 ==> (instanceType: dom(instanceRating) | instanceRating:=instanceRating<+{instanceType|->rec(cpu>>cpuRating,hdd>>hddRating,mem>>memRating)}) [] not(cpuRating>0 & hddRating>0 & memRating>0) ==> skip);
  List_Substitution(Implementation(awsEc2SimulatorImpl),setInstanceRating)==(IF cpuRating>0 & hddRating>0 & memRating>0 THEN instanceRating(instanceType):=rec(cpu>>cpuRating,hdd>>hddRating,mem>>memRating) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),login)==(IF user/=none THEN currentUser:=user END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),logout)==(currentUser:=none);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addClient)==(IF user/:clients & user/:admins & currentUser: admins & user/=none THEN clients:=clients\/{user};finishedInstanceCost(user):=0 END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addArbitraryClient)==(IF currentUser: admins THEN clients:=clients\/{first(userSeq)};finishedInstanceCost(first(userSeq)):=0;userSeq:=tail(userSeq) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addAdmin)==(IF user: USERS & user/:clients & user/:admins & user/=none THEN admins:=admins\/{user} END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),removeAdmin)==(IF user: USERS & user: admins & card(admins)>1 & currentUser: admins THEN admins:=admins-{user} END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),removeClient)==(IF user: USERS & user: clients & currentUser: admins & {vmp | vmp: ran(virtualMachineProperties) & vmp'owner = user} = {} THEN clients:=clients-{user};finishedInstanceCost:={user}<<|finishedInstanceCost END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),listClients)==(IF user: USERS & currentUser: admins THEN clientList:=clients END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),tickTimer)==(currentTime:=currentTime+1);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addResource)==(IF cpu: NAT1 & hdd: NAT1 & mem: NAT1 & currentUser: admins THEN machineResources:=machineResources\/{first(mrSeq)};machineResourceProperties(first(mrSeq)):=rec(cpu>>cpu,hdd>>hdd,mem>>mem);mrSeq:=tail(mrSeq) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),removeResource)==(IF resource: machineResources & resource: machineResources & currentUser: admins & {vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = resource} = {} THEN machineResources:=machineResources-{resource};machineResourceProperties:={resource}<<|machineResourceProperties END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),listResources)==(resourceList:=machineResourceProperties);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine)==(IF cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients THEN VAR machine,machineSeq IN machineSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss));machine:=first(machineSeq);WHILE machineSeq/=<> DO VAR cpuTotal,hddTotal,memTotal,vm IN cpuTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'cpu);hddTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'hdd);memTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine & virtualMachineProperties(virtualMachine)'category = allocated | virtualMachineProperties(virtualMachine)'mem);vm:=first(vmSeq);IF machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal THEN vmSeq:=tail(vmSeq);virtualMachines:=(virtualMachines\/{vm})-{vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine};allocatedVirtualMachines:=allocatedVirtualMachines\/{vm};virtualMachineProperties:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine}<<|(virtualMachineProperties\/{vm|->rec(residentMachine>>machine,owner>>client,category>>allocated,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem)});spotVirtualMachines:=spotVirtualMachines-{vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'category = spot & virtualMachineProperties(vm)'residentMachine = machine};machineSeq:=<> ELSE machineSeq:=tail(machineSeq) END END INVARIANT machine: machineResources VARIANT card(machineResources)-size(machineSeq) END END END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine)==(IF cpu: NAT1 & hdd: NAT1 & mem: NAT1 & client: clients THEN VAR machine,machineSeq IN machineSeq:=%ss.(ss: 1..card(MACHINE_RESOURCES) | ((1..card(MACHINE_RESOURCES))*MACHINE_RESOURCES)((ss-1)*card(MACHINE_RESOURCES)+ss));machine:=first(machineSeq);WHILE machineSeq/=<> DO VAR cpuTotal,hddTotal,memTotal,vm IN cpuTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'cpu);hddTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'hdd);memTotal:=SIGMA(virtualMachine).(virtualMachine: virtualMachines & virtualMachineProperties(virtualMachine)'residentMachine = machine | virtualMachineProperties(virtualMachine)'mem);vm:=first(vmSeq);IF machineResourceProperties(first(machineSeq))'cpu>cpuTotal & machineResourceProperties(first(machineSeq))'mem>memTotal & machineResourceProperties(first(machineSeq))'hdd>hddTotal THEN vmSeq:=tail(vmSeq);virtualMachines:=virtualMachines\/{vm};spotVirtualMachines:=spotVirtualMachines\/{vm};virtualMachineProperties(vm):=rec(residentMachine>>machine,owner>>client,category>>spot,startTime>>currentTime,cpu>>cpu,hdd>>hdd,mem>>mem);machineSeq:=<> ELSE machineSeq:=tail(machineSeq) END END INVARIANT machine: machineResources VARIANT card(machineResources)-size(machineSeq) END END END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),removeVirtualMachine)==(IF vm: virtualMachines & vm: dom(virtualMachineProperties) & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'owner: USERS & virtualMachineProperties(vm)'owner: dom(finishedInstanceCost) & virtualMachineProperties(vm)'category: dom(instanceRating) & instanceRating(virtualMachineProperties(vm)'category)'cpu>0 & virtualMachineProperties(vm)'cpu>0 & currentTime>=virtualMachineProperties(vm)'startTime THEN virtualMachines:=virtualMachines-{vm};virtualMachineProperties:={vm}<<|virtualMachineProperties;allocatedVirtualMachines:=allocatedVirtualMachines-{vm};spotVirtualMachines:=spotVirtualMachines-{vm};finishedInstanceCost(virtualMachineProperties(vm)'owner):=finishedInstanceCost(virtualMachineProperties(vm)'owner)+instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),getAllocatedVmsOnMachine)==(IF machine: machineResources & machine: dom(machineResourceProperties) THEN vms:={vm | vm: virtualMachines & virtualMachineProperties(vm)'residentMachine = machine} END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),getAllocatedCpuOnMachine)==(IF machine: machineResources & machine: dom(machineResourceProperties) THEN totalCpu:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'residentMachine = machine | virtualMachineProperties(vm)'cpu) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),listVmsForUser)==(IF resourceTypes <: VM_CATEGORIES & user: USERS & currentUser: admins\/{user} THEN vmList:={vm | vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user} END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),getBillingForRunningVM)==(IF vm: virtualMachines & currentUser: admins\/{virtualMachineProperties(vm)'owner} & virtualMachineProperties(vm)'category: dom(instanceRating) THEN billing:=instanceRating(virtualMachineProperties(vm)'category)'cpu*virtualMachineProperties(vm)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'hdd*virtualMachineProperties(vm)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+instanceRating(virtualMachineProperties(vm)'category)'mem*virtualMachineProperties(vm)'mem*(currentTime-virtualMachineProperties(vm)'startTime) END);
  List_Substitution(Implementation(awsEc2SimulatorImpl),getBillingForUser)==(IF user: clients & user: dom(finishedInstanceCost) & currentUser: admins\/{user} THEN billing:=SIGMA(vm).(vm: dom(virtualMachineProperties) & virtualMachineProperties(vm)'owner = user & virtualMachineProperties(vm)'category: dom(instanceRating) | virtualMachineProperties(vm)'cpu*instanceRating(virtualMachineProperties(vm)'category)'cpu*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'hdd*instanceRating(virtualMachineProperties(vm)'category)'hdd*(currentTime-virtualMachineProperties(vm)'startTime)+virtualMachineProperties(vm)'mem*instanceRating(virtualMachineProperties(vm)'category)'mem*(currentTime-virtualMachineProperties(vm)'startTime))+finishedInstanceCost(user) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(awsEc2SimulatorImpl))==(?);
  Inherited_List_Constants(Implementation(awsEc2SimulatorImpl))==(?);
  List_Constants(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Implementation(awsEc2SimulatorImpl))==(?);
  Context_List_Defered(Implementation(awsEc2SimulatorImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  Context_List_Sets(Implementation(awsEc2SimulatorImpl))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES);
  List_Own_Enumerated(Implementation(awsEc2SimulatorImpl))==(?);
  List_Valuable_Sets(Implementation(awsEc2SimulatorImpl))==(?);
  Inherited_List_Enumerated(Implementation(awsEc2SimulatorImpl))==(?);
  Inherited_List_Defered(Implementation(awsEc2SimulatorImpl))==(?);
  Inherited_List_Sets(Implementation(awsEc2SimulatorImpl))==(?);
  List_Enumerated(Implementation(awsEc2SimulatorImpl))==(?);
  List_Defered(Implementation(awsEc2SimulatorImpl))==(?);
  List_Sets(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(awsEc2SimulatorImpl))==(?);
  Expanded_List_HiddenConstants(Implementation(awsEc2SimulatorImpl))==(?);
  List_HiddenConstants(Implementation(awsEc2SimulatorImpl))==(?);
  External_List_HiddenConstants(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(awsEc2SimulatorImpl))==(btrue);
  Context_List_Properties(Implementation(awsEc2SimulatorImpl))==(allocated: VM_CATEGORIES & spot: VM_CATEGORIES & allocated/=spot & admin: USERS & none: USERS & admin/=none & USERS: FIN(INTEGER) & not(USERS = {}) & MACHINE_RESOURCES: FIN(INTEGER) & not(MACHINE_RESOURCES = {}) & VIRTUAL_MACHINES: FIN(INTEGER) & not(VIRTUAL_MACHINES = {}) & VM_CATEGORIES: FIN(INTEGER) & not(VM_CATEGORIES = {}));
  Inherited_List_Properties(Implementation(awsEc2SimulatorImpl))==(btrue);
  List_Properties(Implementation(awsEc2SimulatorImpl))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(awsEc2SimulatorImpl))==(aa: aa);
  List_Values(Implementation(awsEc2SimulatorImpl))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(?);
  Seen_Context_List_Enumerated(Implementation(awsEc2SimulatorImpl))==(?);
  Seen_Context_List_Invariant(Implementation(awsEc2SimulatorImpl))==(btrue);
  Seen_Context_List_Assertions(Implementation(awsEc2SimulatorImpl))==(btrue);
  Seen_Context_List_Properties(Implementation(awsEc2SimulatorImpl))==(btrue);
  Seen_List_Constraints(Implementation(awsEc2SimulatorImpl))==(btrue);
  Seen_List_Operations(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(?);
  Seen_Expanded_List_Invariant(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(btrue)
END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(awsEc2SimulatorImpl))==(Type(machineResources) == Mvv(SetOf(atype(MACHINE_RESOURCES,?,?)));Type(machineResourceProperties) == Mvv(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(admins) == Mvv(SetOf(atype(USERS,?,?)));Type(clients) == Mvv(SetOf(atype(USERS,?,?)));Type(virtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(virtualMachineProperties) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)*rtype(((((((residentMachine: atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")),owner: atype(USERS,"[USERS","]USERS")),category: atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES")),startTime: btype(INTEGER,0,MAXINT)),cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(vmCategories) == Mvv(SetOf(atype(VM_CATEGORIES,?,?)));Type(spotVirtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(allocatedVirtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(currentTime) == Mvv(btype(INTEGER,?,?));Type(instanceRating) == Mvv(SetOf(atype(VM_CATEGORIES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(finishedInstanceCost) == Mvv(SetOf(atype(USERS,?,?)*btype(INTEGER,?,?)));Type(currentUser) == Mvv(atype(USERS,?,?));Type(userSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(USERS,?,?)));Type(mrSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(MACHINE_RESOURCES,?,?)));Type(vmSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(VIRTUAL_MACHINES,?,?))));
  Operations(Implementation(awsEc2SimulatorImpl))==(Type(getBillingForUser) == Cst(btype(INTEGER,?,?),atype(USERS,?,?));Type(getBillingForRunningVM) == Cst(btype(INTEGER,?,?),atype(VIRTUAL_MACHINES,?,?));Type(listVmsForUser) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),SetOf(atype(VM_CATEGORIES,?,?))*atype(USERS,?,?));Type(getAllocatedCpuOnMachine) == Cst(btype(INTEGER,?,?),atype(MACHINE_RESOURCES,?,?));Type(getAllocatedVmsOnMachine) == Cst(SetOf(atype(VIRTUAL_MACHINES,?,?)),atype(MACHINE_RESOURCES,?,?));Type(removeVirtualMachine) == Cst(No_type,atype(VIRTUAL_MACHINES,?,?));Type(addSpotVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(addAllocatedVirtualMachine) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*atype(USERS,?,?));Type(listResources) == Cst(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))),No_type);Type(removeResource) == Cst(No_type,atype(MACHINE_RESOURCES,?,?));Type(addResource) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(tickTimer) == Cst(No_type,No_type);Type(listClients) == Cst(SetOf(atype(USERS,?,?)),atype(USERS,?,?));Type(removeClient) == Cst(No_type,atype(USERS,?,?));Type(removeAdmin) == Cst(No_type,atype(USERS,?,?));Type(addAdmin) == Cst(No_type,atype(USERS,?,?));Type(addArbitraryClient) == Cst(No_type,No_type);Type(addClient) == Cst(No_type,atype(USERS,?,?));Type(logout) == Cst(No_type,No_type);Type(login) == Cst(No_type,atype(USERS,?,?));Type(setInstanceRating) == Cst(No_type,atype(VM_CATEGORIES,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(allocated,spot,admin,none);
  List_Constants_Env(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(Type(allocated) == Cst(atype(VM_CATEGORIES,?,?));Type(spot) == Cst(atype(VM_CATEGORIES,?,?));Type(admin) == Cst(atype(USERS,?,?));Type(none) == Cst(atype(USERS,?,?)));
  List_Defered_Sets(Implementation(awsEc2SimulatorImpl),Machine(awsEc2SimulatorCtx))==(USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(awsEc2SimulatorImpl)) == (? | ? | ? | ? | setInstanceRating,login,logout,addClient,addArbitraryClient,addAdmin,removeAdmin,removeClient,listClients,tickTimer,addResource,removeResource,listResources,addAllocatedVirtualMachine,addSpotVirtualMachine,removeVirtualMachine,getAllocatedVmsOnMachine,getAllocatedCpuOnMachine,listVmsForUser,getBillingForRunningVM,getBillingForUser | ? | seen(Machine(awsEc2SimulatorCtx)) | ? | awsEc2SimulatorImpl);
  List_Of_HiddenCst_Ids(Implementation(awsEc2SimulatorImpl)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(awsEc2SimulatorImpl)) == (?);
  List_Of_VisibleVar_Ids(Implementation(awsEc2SimulatorImpl)) == (vmSeq,mrSeq,userSeq,currentUser,finishedInstanceCost,instanceRating,currentTime,allocatedVirtualMachines,spotVirtualMachines,vmCategories,virtualMachineProperties,virtualMachines,clients,admins,machineResourceProperties,machineResources | ?);
  List_Of_Ids_SeenBNU(Implementation(awsEc2SimulatorImpl)) == (?: ?);
  List_Of_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none,USERS,MACHINE_RESOURCES,VIRTUAL_MACHINES,VM_CATEGORIES | ? | ? | ? | ? | ? | ? | ? | awsEc2SimulatorCtx);
  List_Of_HiddenCst_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(awsEc2SimulatorCtx)) == (allocated,spot,admin,none);
  List_Of_VisibleVar_Ids(Machine(awsEc2SimulatorCtx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(awsEc2SimulatorCtx)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(awsEc2SimulatorImpl)) == (Type(vmSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(VIRTUAL_MACHINES,?,?)));Type(mrSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(MACHINE_RESOURCES,?,?)));Type(userSeq) == Mvv(SetOf(btype(INTEGER,?,?)*atype(USERS,?,?)));Type(currentUser) == Mvv(atype(USERS,?,?));Type(finishedInstanceCost) == Mvv(SetOf(atype(USERS,?,?)*btype(INTEGER,?,?)));Type(instanceRating) == Mvv(SetOf(atype(VM_CATEGORIES,?,?)*rtype(((cpu: btype(INTEGER,?,?)),hdd: btype(INTEGER,?,?)),mem: btype(INTEGER,?,?))));Type(currentTime) == Mvv(btype(INTEGER,?,?));Type(allocatedVirtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(spotVirtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(vmCategories) == Mvv(SetOf(atype(VM_CATEGORIES,?,?)));Type(virtualMachineProperties) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)*rtype(((((((residentMachine: atype(MACHINE_RESOURCES,"[MACHINE_RESOURCES","]MACHINE_RESOURCES")),owner: atype(USERS,"[USERS","]USERS")),category: atype(VM_CATEGORIES,"[VM_CATEGORIES","]VM_CATEGORIES")),startTime: btype(INTEGER,0,MAXINT)),cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(virtualMachines) == Mvv(SetOf(atype(VIRTUAL_MACHINES,?,?)));Type(clients) == Mvv(SetOf(atype(USERS,?,?)));Type(admins) == Mvv(SetOf(atype(USERS,?,?)));Type(machineResourceProperties) == Mvv(SetOf(atype(MACHINE_RESOURCES,?,?)*rtype(((cpu: btype(INTEGER,1,MAXINT)),hdd: btype(INTEGER,1,MAXINT)),mem: btype(INTEGER,1,MAXINT))));Type(machineResources) == Mvv(SetOf(atype(MACHINE_RESOURCES,?,?))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine, 2) == (Type(cpuTotal) == Lvl(btype(INTEGER,?,?));Type(hddTotal) == Lvl(btype(INTEGER,?,?));Type(memTotal) == Lvl(btype(INTEGER,?,?));Type(vm) == Lvl(atype(VIRTUAL_MACHINES,?,?)));
  Variables_Loc(Implementation(awsEc2SimulatorImpl),addAllocatedVirtualMachine, 1) == (Type(machine) == Lvl(atype(MACHINE_RESOURCES,?,?));Type(machineSeq) == Lvl(SetOf(btype(INTEGER,?,?)*atype(MACHINE_RESOURCES,?,?))));
  Variables_Loc(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine, 2) == (Type(cpuTotal) == Lvl(btype(INTEGER,?,?));Type(hddTotal) == Lvl(btype(INTEGER,?,?));Type(memTotal) == Lvl(btype(INTEGER,?,?));Type(vm) == Lvl(atype(VIRTUAL_MACHINES,?,?)));
  Variables_Loc(Implementation(awsEc2SimulatorImpl),addSpotVirtualMachine, 1) == (Type(machine) == Lvl(atype(MACHINE_RESOURCES,?,?));Type(machineSeq) == Lvl(SetOf(btype(INTEGER,?,?)*atype(MACHINE_RESOURCES,?,?))))
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
  List_Local_Operations(Implementation(awsEc2SimulatorImpl))==(?)
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
  TypingPredicate(Implementation(awsEc2SimulatorImpl))==(machineResources: POW(MACHINE_RESOURCES) & machineResourceProperties: POW(MACHINE_RESOURCES*struct(cpu>>INTEGER,hdd>>INTEGER,mem>>INTEGER)) & admins: POW(USERS) & clients: POW(USERS) & virtualMachines: POW(VIRTUAL_MACHINES) & virtualMachineProperties: POW(VIRTUAL_MACHINES*struct(residentMachine>>MACHINE_RESOURCES,owner>>USERS,category>>VM_CATEGORIES,startTime>>INTEGER,cpu>>INTEGER,hdd>>INTEGER,mem>>INTEGER)) & vmCategories: POW(VM_CATEGORIES) & spotVirtualMachines: POW(VIRTUAL_MACHINES) & allocatedVirtualMachines: POW(VIRTUAL_MACHINES) & currentTime: INTEGER & instanceRating: POW(VM_CATEGORIES*struct(cpu>>INTEGER,hdd>>INTEGER,mem>>INTEGER)) & finishedInstanceCost: POW(USERS*INTEGER) & currentUser: USERS & userSeq: POW(INTEGER*USERS) & mrSeq: POW(INTEGER*MACHINE_RESOURCES) & vmSeq: POW(INTEGER*VIRTUAL_MACHINES))
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
