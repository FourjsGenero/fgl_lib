&include "lib_operator.4gl"

&include "test_inc.4gl"
MAIN
    testconstant(_abs_(-1),1)
    testconstant(_abs_(1),1)
    testconstant(_min_(0,1),0)
    testconstant(_max_(0,1),1)
    testconstant(_min_("A","B"),"A")
    testconstant(_max_("A","B"),"B")
    testconstant(_max_(_max_(1,2),_max_(3,4)),4)
    testconstant(_and_(TRUE,TRUE), 1)
    testconstant(_and_(FALSE,FALSE), 0)
    testconstant(_and_(TRUE,FALSE), 0)
    testconstant(_and_(FALSE,TRUE), 0)
    testconstant(_or_(TRUE,TRUE), 1)
    testconstant(_or_(FALSE,FALSE), 0)
    testconstant(_or_(TRUE,FALSE), 1)
    testconstant(_or_(FALSE,TRUE), 1)
    testconstant(_xor_(TRUE,TRUE), 0)
    testconstant(_xor_(FALSE,FALSE), 0)
    testconstant(_xor_(TRUE,FALSE), 1)
    testconstant(_xor_(FALSE,TRUE), 1)
END MAIN