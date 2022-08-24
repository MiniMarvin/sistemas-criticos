/* user
 * Author: 
 * Creation date: 24/08/2022
 */
MACHINE
    userManager

SEES
    userManagerCtx

CONCRETE_CONSTANTS
    admin

PROPERTIES
    admin : USERS

ABSTRACT_VARIABLES
    admins ,
    clients

INVARIANT
    USERS : FIN ( USERS )
    & admins <: USERS
    & clients <: USERS
    & admins /\ clients = {}
    & admins /= {}

INITIALISATION
    admins := { admin }
    || clients := {}

OPERATIONS
    addClient ( user , caller ) =
    PRE
        user : USERS
        & user /: clients
        & user /: admins
        & caller : admins
    THEN
        clients := clients \/ { user }
    END ;

    addAdmin ( user , caller ) =
    PRE
        user : USERS
        & user /: clients
        & user /: admins
        & caller : admins
    THEN
        admins := admins \/ { user }
    END ;

    removeAdmin ( user , caller ) =
    PRE
        user : USERS
        & user : admins
        & admins - { user } /= {}
        & caller : admins
    THEN
        admins := admins - { user }
    END ;

    removeClient ( user , caller ) =
    PRE
        // TODO guarantee the shutdown of every service owned by this client
        user : USERS
        & user : clients
        & caller : admins
    THEN
        clients := clients - { user }
    END

END
