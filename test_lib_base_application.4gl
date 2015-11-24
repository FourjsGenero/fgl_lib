IMPORT FGL lib_base_application

&include "test_inc.4gl"

MAIN
    IF base.Application.getArgumentCount() = 0 THEN
        CALL do_test()
    ELSE
        test11(getArgumentExists,"-x", TRUE)
        test11(getArgumentExists,"-y", TRUE)
        test11(getArgumentExists,"-z", TRUE)
        test11(getArgumentExists,"-w", FALSE)
        test11(getArgumentPosition, "-x", 1)
        test11(getArgumentPosition, "-y", 3)
        test11(getArgumentPosition, "-z", 6)
        test11(getArgumentPosition, "-w", 0)
        test11(getArgumentParameterCount, "-x", 1)
        test11(getArgumentParameterCount, "-y", 2)
        test11(getArgumentParameterCount, "-z", 0)
        test11(getArgumentParameterCount, "-w", 0)
        test21(getArgumentParameter, "-x", 1, 1)
        test21(getArgumentParameter, "-y", 1, 2)
        test21(getArgumentParameter, "-y", 2, 3)
        test21(getArgumentParameter, "-x", 0, "NULL")
        test21(getArgumentParameter, "-x", -1, "NULL")
        test21(getArgumentParameter, "-w", 1, "NULL")
       
    END IF
END MAIN

FUNCTION do_test()
    RUN "fglrun test_lib_base_application -x 1 -y 2 3 -z"

END FUNCTION