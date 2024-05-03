processor pic16f877a
include <p16f877a.inc>

    ORG 00h

INIT 
    BCF STATUS, RP1    ;BANCO 1
    BSF STATUS 