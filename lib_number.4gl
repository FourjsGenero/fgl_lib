IMPORT util

PUBLIC CONSTANT MIN_TINYINT = -128
PUBLIC CONSTANT MAX_TINYINT = 127
PUBLIC CONSTANT MIN_SMALLINT = -32767
PUBLIC CONSTANT MAX_SMALLINT = 32767
PUBLIC CONSTANT MIN_INTEGER = -2147483647
PUBLIC CONSTANT MAX_INTEGER = 2147483647
PUBLIC CONSTANT MIN_BIGINT = -9223372036854775807
PUBLIC CONSTANT MAX_BIGINT = 9223372036854775807

# supplied random has max of 32767, use this for bigger values
FUNCTION big_random(b)
DEFINE b BIGINT
DEFINE i SMALLINT
DEFINE d CHAR(1)
DEFINE s STRING
DEFINE r BIGINT
DEFINE l_digits SMALLINT

    IF b <= MAX_SMALLINT THEN
        RETURN util.Math.rand(b)
    END IF
    LET s = "0."
    LET l_digits = log(b,10)*2
    FOR i = 1 TO l_digits
        LET d = util.Math.rand(10) USING "&"
        LET s = s,d
    END FOR
    
    LET r = b*s
    RETURN r
END FUNCTION



FUNCTION abs(f)
DEFINE f DECIMAL
    RETURN IIF(f<0.0,0.0-f,f)
END FUNCTION



FUNCTION min(f1,f2)
DEFINE f1, f2 FLOAT
    RETURN IIF(f1<=f2,f1,f2)
END FUNCTION



FUNCTION max(f1,f2)
DEFINE f1, f2 FLOAT
    RETURN IIF(f2>=f1,f2,f1)
END FUNCTION




FUNCTION number_suffix(l_number)
DEFINE l_number INTEGER

DEFINE l_result STRING

    IF l_number = 0 THEN
        RETURN ""
    END IF
    # special case for last 2 digits
    LET l_number = l_number MOD 100
    LET l_result = LSTR(SFMT("lib_number.suffix.%1", l_number USING "<&"))
    IF l_result MATCHES "lib_number*" THEN
        # carry on
    ELSE
        RETURN l_result
    END IF

    # use last digit
    LET l_number = l_number MOD 10
    LET l_result = LSTR(SFMT("lib_number.suffix.%1", l_number USING "<&"))
    RETURN l_result
    
END FUNCTION



FUNCTION log(x,b)
DEFINE x,b FLOAT

    RETURN util.Math.log(x)/util.Math.log(b)
END FUNCTION




#TODO functions for floor, round, ceil
#TODO functions for int2hex and hex2int






