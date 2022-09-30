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
    user0 , user1 , user2 , user3

INVARIANT
    USERS : FIN ( USERS )
    & VM_CATEGORIES : FIN ( VM_CATEGORIES )
    & VIRTUAL_MACHINES : FIN ( VIRTUAL_MACHINES )

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


END
