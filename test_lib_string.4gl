IMPORT FGL lib_string

&include "test_inc.4gl"

FUNCTION test_lib_string()
    CALL test_replace()
    CALL test_proper()
    #CALL test_number_suffix()
END FUNCTION

FUNCTION test_replace()
    test41(string_replace,"","","",0,"")
    test41(string_replace,"Informix Informix","Informix","Genero",0,"Genero Genero")
    test41(string_replace,"Informix Informix","Informix","Genero",1,"Genero Informix")
END FUNCTION
--
FUNCTION test_proper()
    test11(toProperCase,"hello","Hello")
    test11(toProperCase,"","")
    test11(toProperCase,"a","A")
    test11(toProperCase,"An","An")
    test11(toProperCase,"hello","Hello")
    test11(toProperCase,"hello world","Hello World")
    test11(toProperCase,"HELLO WORLD","Hello World")
    test11(toProperCase,"Hello World","Hello World")
END FUNCTION
--
--FUNCTION test_number_suffix()
--DEFINE i INTEGER
--
    --FOR i = 0 TO 120
        --DISPLAY i, lib_string.number_suffix(i)
    --END FOR
--END FUNCTION
    