/* awsEc2SimulatorCtx
 * Author: 
 * Creation date: 27/08/2022
 */
MACHINE
    awsEc2SimulatorCtx

SETS
    USERS ;
    MACHINE_RESOURCES ;
    VIRTUAL_MACHINES ;
    VM_CATEGORIES

CONCRETE_CONSTANTS
    allocated ,
    spot ,
    admin ,
    none ,
    user0 , user1 , user2 , user3 ,
    mr0 , mr1 , mr2 , mr3 ,
    vm0 , vm1 , vm2 , vm3 , vm4 , vm5 , vm6 , vm7 , vm8 , vm9

INVARIANT
    USERS : FIN ( USERS )
    & VM_CATEGORIES : FIN ( VM_CATEGORIES )
    & VIRTUAL_MACHINES : FIN ( VIRTUAL_MACHINES )
    & MACHINE_RESOURCES : FIN ( MACHINE_RESOURCES )

PROPERTIES
    allocated : VM_CATEGORIES
    & spot : VM_CATEGORIES
    & allocated /= spot
    & admin : USERS
    & none : USERS
    & admin /= none
    & user0 : USERS & user1 : USERS & user2 : USERS & user3 : USERS
    & user0 /= admin & user0 /= none & user0 /= user1 & user0 /= user2 & user0 /= user3
    & user1 /= admin & user1 /= none & user1 /= user2 & user1 /= user3
    & user2 /= admin & user2 /= none & user2 /= user3
    & user3 /= admin & user3 /= none
    & mr0 : MACHINE_RESOURCES & mr1 : MACHINE_RESOURCES & mr2 : MACHINE_RESOURCES & mr3 : MACHINE_RESOURCES
    & mr0 /= mr1 & mr0 /= mr2 & mr0 /= mr3 & mr1 /= mr2 & mr1 /= mr3 & mr2 /= mr3
    & vm0 : VIRTUAL_MACHINES & vm1 : VIRTUAL_MACHINES & vm2 : VIRTUAL_MACHINES
    & vm3 : VIRTUAL_MACHINES & vm4 : VIRTUAL_MACHINES & vm5 : VIRTUAL_MACHINES
    & vm6 : VIRTUAL_MACHINES & vm7 : VIRTUAL_MACHINES & vm8 : VIRTUAL_MACHINES
    & vm9 : VIRTUAL_MACHINES
    & vm0 /= vm1 & vm0 /= vm2 & vm0 /= vm3 & vm0 /= vm4 & vm0 /= vm5 & vm0 /= vm6
    & vm0 /= vm7 & vm0 /= vm8 & vm0 /= vm9 & vm1 /= vm2 & vm1 /= vm3 & vm1 /= vm4
    & vm1 /= vm5 & vm1 /= vm6 & vm1 /= vm7 & vm1 /= vm8 & vm1 /= vm9 & vm2 /= vm3
    & vm2 /= vm4 & vm2 /= vm5 & vm2 /= vm6 & vm2 /= vm7 & vm2 /= vm8 & vm2 /= vm9
    & vm3 /= vm4 & vm3 /= vm5 & vm3 /= vm6 & vm3 /= vm7 & vm3 /= vm8 & vm3 /= vm9
    & vm4 /= vm5 & vm4 /= vm6 & vm4 /= vm7 & vm4 /= vm8 & vm4 /= vm9 & vm5 /= vm6
    & vm5 /= vm7 & vm5 /= vm8 & vm5 /= vm9 & vm6 /= vm7 & vm6 /= vm8 & vm6 /= vm9
    & vm7 /= vm8 & vm7 /= vm9 & vm8 /= vm9


END
