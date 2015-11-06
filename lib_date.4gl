

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
        
    
    

