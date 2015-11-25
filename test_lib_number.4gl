IMPORT FGL lib_number
IMPORT util

&include "test_inc.4gl"

FUNCTION test_lib_number()
    CALL test_constant()
    CALL test_big_random()
    CALL test_abs()
    CALL test_min()
    CALL test_max()
    CALL test_number_suffix()
    CALL test_log()
    CALL test_digit_2_hex()
    CALL test_hex_2_digit()
    CALL test_number_2_hex()
    CALL test_hex_2_number()
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

FUNCTION test_big_random()
CONSTANT TEST = 10000
CONSTANT VALUE = 100000
DEFINE i INTEGER
DEFINE min, max, sum BIGINT
DEFINE average, median FLOAT

DEFINE result_list DYNAMIC ARRAY OF BIGINT
DEFINE ad2_sum BIGINT
DEFINE a2d_average FLOAT

    #http://xkcd.com/221/

    FOR i = 1 TO TEST
        LET result_list[result_list.getLength()+1] = big_random(VALUE)
    END FOR

    LET min = result_list[1]
    LET max = result_list[1]
    LET sum = result_list[1]
    FOR i = 2 TO result_list.getLength()
        IF result_list[i] < min THEN
            LET min = result_list[i]
        END IF
        IF result_list[i] > max THEN
            LET max = result_list[i]
        END IF
        LET sum = sum + result_list[i]
    END FOR
    LET average = sum / TEST
    
    LET ad2_sum = 0
    FOR i = 1 TO TEST
        LET ad2_sum = ad2_sum + (result_list[util.Math.rand(TEST)+1]-result_list[util.math.rand(TEST)+1])
    END FOR
    LET a2d_average = ad2_sum / TEST

    CALL result_list.sort(NULL, FALSE)
    IF TEST MOD 2 = 0 THEN
        LET median = (result_list[TEST/2] + result_list[TEST/2+1])/2
    ELSE
        LET median = result_list[TEST/2]
    END IF

    DISPLAY SFMT("Min:%1", min)
    DISPLAY SFMT("Max:%1", max)
    DISPLAY SFMT("Average:%1", average)
    DISPLAY SFMT("Median:%1", median)
    DISPLAY SFMT("Any 2 diff average:%1",a2d_average)
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

FUNCTION test_digit_2_hex()
    test11(digit_2_hex,0,0)
    test11(digit_2_hex,1,1)
    test11(digit_2_hex,2,2)
    test11(digit_2_hex,3,3)
    test11(digit_2_hex,4,4)
    test11(digit_2_hex,5,5)
    test11(digit_2_hex,6,6)
    test11(digit_2_hex,7,7)
    test11(digit_2_hex,8,8)
    test11(digit_2_hex,9,9)
    test11(digit_2_hex,10,"A")
    test11(digit_2_hex,11,"B")
    test11(digit_2_hex,12,"C")
    test11(digit_2_hex,13,"D")
    test11(digit_2_hex,14,"E")
    test11(digit_2_hex,15,"F")
    test11(digit_2_hex,-1,"")
    test11(digit_2_hex,16,"")
END FUNCTION

FUNCTION test_hex_2_digit()
    test11(hex_2_digit,0,0)
    test11(hex_2_digit,1,1)
    test11(hex_2_digit,2,2)
    test11(hex_2_digit,3,3)
    test11(hex_2_digit,4,4)
    test11(hex_2_digit,5,5)
    test11(hex_2_digit,6,6)
    test11(hex_2_digit,7,7)
    test11(hex_2_digit,8,8)
    test11(hex_2_digit,9,9)
    test11(hex_2_digit,"A",10)
    test11(hex_2_digit,"B",11)
    test11(hex_2_digit,"C",12)
    test11(hex_2_digit,"D",13)
    test11(hex_2_digit,"E",14)
    test11(hex_2_digit,"F",15)
    test11(hex_2_digit,-1,"")
    test11(hex_2_digit,"G","")
END FUNCTION

FUNCTION test_number_2_hex()
    test21(number_2_hex,0,1,"0")
    test21(number_2_hex,0,2,"00")
    test21(number_2_hex,15,2,"0F")
    test21(number_2_hex,16,2,"10")
END FUNCTION

FUNCTION test_hex_2_number()
    test11(hex_2_number,"A",10)
    test11(hex_2_number,"FF",255)
    test11(hex_2_number,"100",256)
    test11(hex_2_number,"FFFF",65535)
END FUNCTION
