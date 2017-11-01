IMPORT FGL lib_number
IMPORT util

&include "test_inc.4gl"

FUNCTION test_lib_number()
    CALL test_constant()
    CALL test_abs()
    CALL test_min()
    CALL test_max()
    CALL test_number_suffix()
    CALL test_log()
END FUNCTION

FUNCTION test_constant()
    testconstant(MIN_TINYINT,-128)
    testconstant(MAX_TINYINT,127)
    testconstant(MIN_SMALLINT,-32767)
    testconstant(MAX_SMALLINT,32767)
    testconstant(MIN_INTEGER,-2147483647)
    testconstant(MAX_INTEGER,2147483647)
    testconstant(MIN_BIGINT,-9223372036854775807)
    testconstant(MAX_BIGINT,9223372036854775807)
END FUNCTION

FUNCTION test_abs()
    test11(abs,100,100)
    test11(abs,1,1)
    test11(abs,0.0001,0.0001)
    test11(abs,0,0)
    test11(abs,-1,1)
    test11(abs,-100,100)
    test11(abs,-0.0001,0.0001)
END FUNCTION

FUNCTION test_min()
    test21(min,1,2,1)
    test21(min,2,1,1)   
    test21(min,0,0,0)
    test21(min,-1,1,-1)
END FUNCTION

FUNCTION test_max()
    test21(max,1,2,2)
    test21(max,2,1,2)
    test21(max,0,0,0)
    test21(max,-1,1,1)
END FUNCTION

FUNCTION log(x,b)
DEFINE x,b FLOAT

    RETURN util.Math.log(x)/util.Math.log(b)
END FUNCTION

FUNCTION test_number_suffix()
DEFINE i INTEGER

    FOR i = 0 TO 121
       DISPLAY i, lib_number.number_suffix(i)
    END FOR
END FUNCTION

FUNCTION test_log()
    test21(log,100,10,2)
    test21(log,10000,10,4)
END FUNCTION

