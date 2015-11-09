IMPORT FGL lib_date

&include "test_inc.4gl"

FUNCTION test_lib_date()
    CALL test_is_leapyear()
    CALL test_days_in_month()
    CALL test_days_in_year()
    CALL test_first_of_month()
    CALL test_last_of_month()
    CALL test_add_months()
    CALL test_add_years()
    CALL test_dddd()
    CALL test_dd()
    CALL test_ddd()
    CALL test_mmmm()
    CALL test_mmm()
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

FUNCTION test_days_in_year()
    test11(days_in_year,2013,365)
    test11(days_in_year,2014,365)
    test11(days_in_year,2015,365)
    test11(days_in_year,2016,366)
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

FUNCTION test_add_years()
    test31(add_years,"01/01/2015",0,FALSE,"01/01/2015")
    test31(add_years,"01/01/2015",1,FALSE,"01/01/2016")
    test31(add_years,"01/01/2015",6,FALSE,"01/01/2021")
    test31(add_years,"01/01/2015",12,FALSE,"01/01/2027")
    test31(add_years,"01/01/2015",-1,FALSE,"01/01/2014")
    test31(add_years,"29/02/2016",1,FALSE,"28/02/2017")
    test31(add_years,"29/02/2016",1,TRUE,"01/03/2017")
    test31(add_years,"29/02/2016",-2,FALSE,"28/02/2014")
    test31(add_years,"29/02/2016",-2,TRUE,"01/03/2014")
    
END FUNCTION

FUNCTION test_dddd()
    test11(dddd,-1,"")
    test11(dddd,0,"Sunday")
    test11(dddd,1,"Monday")
    test11(dddd,2,"Tuesday")
    test11(dddd,3,"Wednesday")
    test11(dddd,4,"Thursday")
    test11(dddd,5,"Friday")
    test11(dddd,6,"Saturday")
    test11(dddd,7,"")
END FUNCTION

FUNCTION test_dd()
    test11(dd,-1,"")
    test11(dd,0,"Su")
    test11(dd,1,"Mo")
    test11(dd,2,"Tu")
    test11(dd,3,"We")
    test11(dd,4,"Th")
    test11(dd,5,"Fr")
    test11(dd,6,"Sa")
    test11(dd,7,"")
END FUNCTION

FUNCTION test_ddd()
    test11(ddd,-1,"")
    test11(ddd,0,"Sun")
    test11(ddd,1,"Mon")
    test11(ddd,2,"Tue")
    test11(ddd,3,"Wed")
    test11(ddd,4,"Thu")
    test11(ddd,5,"Fri")
    test11(ddd,6,"Sat")
    test11(ddd,7,"")
END FUNCTION

FUNCTION test_mmmm()
    test11(mmmm,1,"January")
    test11(mmmm,2,"February")
    test11(mmmm,3,"March")
    test11(mmmm,4,"April")
    test11(mmmm,5,"May")
    test11(mmmm,6,"June")
    test11(mmmm,7,"July")
    test11(mmmm,8,"August")
    test11(mmmm,9,"September")
    test11(mmmm,10,"October")
    test11(mmmm,11,"November")
    test11(mmmm,12,"December")
END FUNCTION

FUNCTION test_mmm()
    test11(mmm,1,"Jan")
    test11(mmm,2,"Feb")
    test11(mmm,3,"Mar")
    test11(mmm,4,"Apr")
    test11(mmm,5,"May")
    test11(mmm,6,"Jun")
    test11(mmm,7,"Jul")
    test11(mmm,8,"Aug")
    test11(mmm,9,"Sep")
    test11(mmm,10,"Oct")
    test11(mmm,11,"Nov")
    test11(mmm,12,"Dec")
END FUNCTION