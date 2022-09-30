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
    none

INVARIANT
//    USERS : FIN(USERS)

    VM_CATEGORIES : FIN ( VM_CATEGORIES )
    & VIRTUAL_MACHINES : FIN ( VIRTUAL_MACHINES )

PROPERTIES
    allocated : VM_CATEGORIES
    & spot : VM_CATEGORIES
    & allocated /= spot
    & admin : USERS
    & none : USERS
    & admin /= none


END
