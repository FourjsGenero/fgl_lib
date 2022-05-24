&include "lib_operator.4gl"

&include "test_inc.4gl"
MAIN
    testconstant(ABS(-1),1)
    testconstant(ABS(1),1)
    testconstant(MIN(0,1),0)
    testconstant(MAX(0,1),1)
    testconstant(MIN("A","B"),"A")
    testconstant(MAX("A","B"),"B")
    testconstant(MAX(MAX(1,2),MAX(3,4)),4)
    testconstant(AND(TRUE,TRUE), 1)
    testconstant(AND(FALSE,FALSE), 0)
    testconstant(AND(TRUE,FALSE), 0)
    testconstant(AND(FALSE,TRUE), 0)
    testconstant(OR(TRUE,TRUE), 1)
    testconstant(OR(FALSE,FALSE), 0)
    testconstant(OR(TRUE,FALSE), 1)
    testconstant(OR(FALSE,TRUE), 1)
    testconstant(XOR(TRUE,TRUE), 0)
    testconstant(XOR(FALSE,FALSE), 0)
    testconstant(XOR(TRUE,FALSE), 1)
    testconstant(XOR(FALSE,TRUE), 1)
    testconstant(DMY(11,9,2001), "11/09/2001")-- assumses DBBDATE=DMY
    testconstant(YMD(2001,9,11),"11/09/2001") -- assumses DBBDATE=DMY 
END MAIN