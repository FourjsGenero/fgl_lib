IMPORT FGL lib_date

&include "test_inc.4gl"

FUNCTION test_lib_date()
    CALL test_is_leapyear()
    CALL test_days_in_month()
    CALL test_first_of_month()
    CALL test_last_of_month()
    CALL test_add_months()
END FUNCTION

FUNCTION test_is_leapyear()
    test11(is_leapyear,2016, TRUE)
    test11(is_leapyear,2015, FALSE)
    test11(is_leapyear,2015, FALSE)
    test11(is_leapyear,2015, FALSE)
    test11(is_leapyear,2000, TRUE)
    test11(is_leapyear,2100, FALSE)

END FUNCTION

FUNCTION test_days_in_month()
    test21(days_in_month,1,2016,31)
    test21(days_in_month,2,2015,28)
    test21(days_in_month,2,2016,29)
    test21(days_in_month,3,2016,31)
    test21(days_in_month,4,2016,30)
    test21(days_in_month,5,2016,31)
    test21(days_in_month,6,2016,30)
    test21(days_in_month,7,2016,31)
    test21(days_in_month,8,2016,31)
    test21(days_in_month,9,2016,30)
    test21(days_in_month,10,2016,31)
    test21(days_in_month,11,2016,30)
    test21(days_in_month,12,2016,31)
END FUNCTION

FUNCTION test_first_of_month()
    test21(first_of_month,2,2015,"01/02/2015")
    test21(first_of_month,3,2015,"01/03/2015")
END FUNCTION

FUNCTION test_last_of_month()
    test21(last_of_month,1,2015,"31/01/2015")
    test21(last_of_month,2,2015,"28/02/2015")
    test21(last_of_month,2,2016,"29/02/2016")
    test21(last_of_month,3,2015,"31/03/2015")
    test21(last_of_month,4,2015,"30/04/2015")
END FUNCTION

FUNCTION test_add_months()
    test31(add_months,"01/01/2015",0,FALSE,"01/01/2015")
    test31(add_months,"01/01/2015",1,FALSE,"01/02/2015")
    test31(add_months,"01/01/2015",6,FALSE,"01/07/2015")
    test31(add_months,"01/01/2015",12,FALSE,"01/01/2016")
    test31(add_months,"01/01/2015",-1,FALSE,"01/12/2014")
    test31(add_months,"31/01/2015",1,FALSE,"28/02/2015")
    test31(add_months,"31/01/2015",1,TRUE,"01/03/2015")
    test31(add_months,"31/08/2015",-2,FALSE,"30/06/2015")
    test31(add_months,"31/08/2015",-2,TRUE,"01/07/2015")
    
END FUNCTION