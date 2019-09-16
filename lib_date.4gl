IMPORT util



FUNCTION days_in_month(m SMALLINT,y SMALLINT) RETURNS SMALLINT

    CASE m
        WHEN 2
            IF util.Date.isLeapyear(y) THEN
                RETURN 29
            ELSE
                RETURN 28
            END IF
        WHEN 4 RETURN 30
        WHEN 6 RETURN 30
        WHEN 9 RETURN 30
        WHEN 11 RETURN 30
        OTHERWISE
            RETURN 31
    END CASE
END FUNCTION



FUNCTION days_in_year(y SMALLINT) RETURNS SMALLINT

    RETURN IIF(util.Date.isLeapyear(y),366,365)
END FUNCTION



FUNCTION first_of_month(m SMALLINT,y SMALLINT) RETURNS DATE
    RETURN MDY(m,1,y)
END FUNCTION



FUNCTION last_of_month(m SMALLINT,y SMALLINT)
    RETURN MDY(m,days_in_month(m,y),y)
END FUNCTION


FUNCTION add_months(d DATE,m SMALLINT) RETURNS DATE

    LET d=  (d + m UNITS MONTH)
    RETURN d
END FUNCTION



FUNCTION add_years(d DATE,y SMALLINT) RETURNS DATE

    LET d= (d + y UNITS YEAR)
    RETURN d
END FUNCTION



FUNCTION dddd(l_day SMALLINT) RETURNS STRING

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION dd(l_day SMALLINT) RETURNS STRING

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day2.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION ddd(l_day SMALLINT) RETURNS STRING

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day3.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION mmmm(l_month SMALLINT) RETURNS STRING

    CASE
        WHEN l_month < 1
            RETURN ""
        WHEN l_month > 12
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.month.%1", l_month USING "<<"))
    END CASE
END FUNCTION

FUNCTION mmm(l_month SMALLINT) RETURNS STRING

    CASE
        WHEN l_month < 1
            RETURN ""
        WHEN l_month > 12
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.month3.%1", l_month USING "<<"))
    END CASE
END FUNCTION
        
    
    

