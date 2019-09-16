IMPORT util

PUBLIC CONSTANT MIN_TINYINT = -128
PUBLIC CONSTANT MAX_TINYINT = 127
PUBLIC CONSTANT MIN_SMALLINT = -32767
PUBLIC CONSTANT MAX_SMALLINT = 32767
PUBLIC CONSTANT MIN_INTEGER = -2147483647
PUBLIC CONSTANT MAX_INTEGER = 2147483647
PUBLIC CONSTANT MIN_BIGINT = -9223372036854775807
PUBLIC CONSTANT MAX_BIGINT = 9223372036854775807



FUNCTION abs(f FLOAT) RETURNS FLOAT

    RETURN IIF(f<0.0,0.0-f,f)
END FUNCTION



FUNCTION min(f1 FLOAT,f2 FLOAT) RETURNS FLOAT
    RETURN IIF(f1<=f2,f1,f2)
END FUNCTION



FUNCTION max(f1 FLOAT,f2 FLOAT) RETURNS FLOAT
    RETURN IIF(f2>=f1,f2,f1)
END FUNCTION




FUNCTION number_suffix(l_number INTEGER) RETURNS STRING

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



FUNCTION log(x FLOAT,b FLOAT)

    RETURN util.Math.log(x)/util.Math.log(b)
END FUNCTION