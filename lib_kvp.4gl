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

FUNCTION kvp1(k1,v1)
DEFINE k1,v1 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    RETURN j
END FUNCTION

FUNCTION kvp2(k1,v1,k2,v2)
DEFINE k1,v1,k2,v2 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    RETURN j
END FUNCTION


FUNCTION kvp3(k1,v1,k2,v2,k3,v3)
DEFINE k1,v1,k2,v2,k3,v3 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    RETURN j
END FUNCTION

FUNCTION kvp4(k1,v1,k2,v2,k3,v3,k4,v4)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    RETURN j
END FUNCTION

FUNCTION kvp5(k1,v1,k2,v2,k3,v3,k4,v4,k5,v5)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4,k5,v5 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    CALL j.put(k5,v5)
    RETURN j
END FUNCTION

FUNCTION kvp6(k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    CALL j.put(k5,v5)
    CALL j.put(k6,v6)
    RETURN j
END FUNCTION

FUNCTION kvp7(k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    CALL j.put(k5,v5)
    CALL j.put(k6,v6)
    CALL j.put(k7,v7)
    RETURN j
END FUNCTION

FUNCTION kvp8(k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7,k8,v8)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7,k8,v8 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    CALL j.put(k5,v5)
    CALL j.put(k6,v6)
    CALL j.put(k7,v7)
    CALL j.put(k8,v8)
    RETURN j
END FUNCTION

FUNCTION kvp9(k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7,k8,v8,k9,v9)
DEFINE k1,v1,k2,v2,k3,v3,k4,v4,k5,v5,k6,v6,k7,v7,k8,v8,k9,v9 STRING
DEFINE j kvpType
    LET j = create()
    CALL j.put(k1,v1)
    CALL j.put(k2,v2)
    CALL j.put(k3,v3)
    CALL j.put(k4,v4)
    CALL j.put(k5,v5)
    CALL j.put(k6,v6)
    CALL j.put(k7,v7)
    CALL j.put(k8,v8)
    CALL j.put(k9,v9)
    RETURN j
END FUNCTION

