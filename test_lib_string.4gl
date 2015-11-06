IMPORT FGL lib_string

DEFINE rs1 STRING

&define test11(fc,p1,r1) \
    CALL fc(p1) RETURNING rs1 \
    DISPLAY SFMT("%5 %1(%2)=\"%3\".  Expected Result=%4",#fc,#p1,rs1,#r1, IIF(rs1=r1,"PASS","FAIL"))

&define test41(fc,p1,p2,p3,p4,r1) \
    CALL fc(p1,p2,p3,p4) RETURNING rs1 \
    DISPLAY SFMT("%8 %1(%2,%3,%4,%5)=\"%6\".  Expected Result=%7",#fc,#p1,#p2,#p3,#p4,rs1,#r1, IIF(rs1=r1,"PASS","FAIL"))

MAIN
    CALL test_replace()
    CALL test_proper()
    #CALL test_number_suffix()
END MAIN

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
    