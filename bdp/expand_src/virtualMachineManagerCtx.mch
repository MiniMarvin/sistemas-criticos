/* virtualMachineManagerCtx
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    virtualMachineManagerCtx

SETS
    VIRTUAL_MACHINES ;
    VM_CATEGORIES

CONCRETE_CONSTANTS
    allocated ,
    spot

PROPERTIES
    allocated : VM_CATEGORIES
    & spot : VM_CATEGORIES

END
