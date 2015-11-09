IMPORT FGL lib_string

&include "test_inc.4gl"

FUNCTION test_lib_string()
    CALL test_replace()
    CALL test_proper()
    CALL test_center()

    #CALL test_number_suffix()
END FUNCTION

FUNCTION test_replace()
    test41(string_replace,"","","",0,"")
    test41(string_replace,"Informix Informix","Informix","Genero",0,"Genero Genero")
    test41(string_replace,"Informix Informix","Informix","Genero",1,"Genero Informix")
END FUNCTION
--
FUNCTION test_proper()
    test11(proper,"hello","Hello")
    test11(proper,"","")
    test11(proper,"a","A")
    test11(proper,"An","An")
    test11(proper,"hello","Hello")
    test11(proper,"hello world","Hello World")
    test11(proper,"HELLO WORLD","Hello World")
    test11(proper,"Hello World","Hello World")
END FUNCTION

FUNCTION test_center()
    test21(center,"toobig",2,"toobig")
    test21(center,"just right",10,"just right")
    test21(center,"odd",6," odd  ")
    test21(center,"even",8,"  even  ")
END FUNCTION



    