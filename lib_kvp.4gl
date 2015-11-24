IMPORT util 

PUBLIC TYPE kvpType util.JSONObject




FUNCTION create()
    RETURN util.JSONObject.create()
END FUNCTION



FUNCTION length(j)
DEFINE j kvpType
    RETURN j.getLength()
END FUNCTION



FUNCTION set(j,k,v)
DEFINE j kvpType
DEFINE k,v STRING
    CALL j.put(k,v)
END FUNCTION



FUNCTION get(j,k)
DEFINE j kvpType
DEFINE k STRING

    RETURN j.get(k)
END FUNCTION



FUNCTION remove(j,k)
DEFINE j kvpType
DEFINE k STRING
    CALL j.remove(k)
END FUNCTION



FUNCTION display(j)
DEFINE j kvpType
    RETURN j.toString()
END FUNCTION



FUNCTION in(j, k)
DEFINE j kvpType
DEFINE k STRING

    RETURN IIF(position(j,k) > 0, TRUE, FALSE)
END FUNCTION

FUNCTION position(j, k)
DEFINE j kvpType
DEFINE k STRING
DEFINE i INTEGER

    FOR i = 1 TO j.getLength()
        IF j.name(i) = k THEN
            RETURN i
        END IF
    END FOR
    RETURN 0
END FUNCTION
