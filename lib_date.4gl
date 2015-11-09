

FUNCTION is_leapyear(y)
DEFINE y SMALLINT
DEFINE d DATE

    LET d = MDY(2,29,y)
    IF d IS NULL THEN
        RETURN FALSE
    ELSE
        RETURN TRUE
    END IF
END FUNCTION



FUNCTION days_in_month(m,y)
DEFINE m SMALLINT
DEFINE y SMALLINT

    CASE m
        WHEN 2
            IF is_leapyear(y) THEN
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



FUNCTION days_in_year(y)
DEFINE y SMALLINT
    RETURN IIF(is_leapyear(y),366,365)
END FUNCTION



FUNCTION first_of_month(m,y)
DEFINE m, y SMALLINT
    RETURN MDY(m,1,y)
END FUNCTION



FUNCTION last_of_month(m,y)
DEFINE m,y SMALLINT
    RETURN MDY(m,days_in_month(m,y),y)
END FUNCTION


FUNCTION add_months(d,m,roundup)
DEFINE d DATE
DEFINE m SMALLINT
DEFINE roundup BOOLEAN

DEFINE dd,mm,yy INTEGER
DEFINE dim SMALLINT

    LET dd = DAY(d)
    LET mm = MONTH(d)
    LET yy = YEAR(d)

    LET mm = yy*12+mm+m
    LET yy = ((mm-1)/12)
    LET mm = (mm-1) MOD 12 + 1

    LET dim = days_in_month(mm,yy)
    IF dd > dim THEN
        IF roundup THEN
            LET mm = mm + 1
            IF mm > 12 THEN
                LET mm = 1
                LET yy = yy + 1
            END IF
            RETURN MDY(mm,1,yy)
        ELSE
            RETURN MDY(mm,dim,yy)
        END IF
    ELSE
        RETURN MDY(mm,dd,yy)
    END IF
END FUNCTION



FUNCTION add_years(d,y,roundup)
DEFINE d DATE
DEFINE y SMALLINT
DEFINE roundup BOOLEAN
    RETURN add_months(d,y*12,roundup)
END FUNCTION



FUNCTION dddd(l_day)
DEFINE l_day SMALLINT

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION dd(l_day)
DEFINE l_day SMALLINT

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day2.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION ddd(l_day)
DEFINE l_day SMALLINT

    CASE 
        WHEN l_day < 0 
            RETURN ""
        WHEN l_day > 6
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.day3.%1", l_day USING "&"))
    END CASE
END FUNCTION

FUNCTION mmmm(l_month)
DEFINE l_month SMALLINT

    CASE
        WHEN l_month < 1
            RETURN ""
        WHEN l_month > 12
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.month.%1", l_month USING "<<"))
    END CASE
END FUNCTION

FUNCTION mmm(l_month)
DEFINE l_month SMALLINT

    CASE
        WHEN l_month < 1
            RETURN ""
        WHEN l_month > 12
            RETURN ""
        OTHERWISE
            RETURN LSTR(SFMT("lib_date.month3.%1", l_month USING "<<"))
    END CASE
END FUNCTION
        
    
    

