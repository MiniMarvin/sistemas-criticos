/* virtualMachineManagerCtx
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    virtualMachineManagerCtx

SETS
    VIRTUAL_MACHINES;
    VM_CATEGORIES

CONSTANTS
    allocated,
    spot,
    vmLimit

PROPERTIES
    allocated : VM_CATEGORIES
    & spot : VM_CATEGORIES
    & vmLimit : NAT1

INVARIANT
    VM_CATEGORIES : FIN(VM_CATEGORIES)
    & VIRTUAL_MACHINES : FIN(VIRTUAL_MACHINES)

END
