IMPORT util 

PUBLIC TYPE listType util.JSONArray

FUNCTION create()
    RETURN util.JSONArray.create()
END FUNCTION

FUNCTION create_from_string(s, delimiter)
DEFINE s STRING
DEFINE delimiter STRING

DEFINE j listType
DEFINE tok base.StringTokenizer

    LET j = create()
    LET tok = base.StringTokenizer.create(s,delimiter)
    WHILE tok.hasMoreTokens()
        CALL append(j,tok.nextToken())
    END WHILE
    RETURN j
END FUNCTION
    
FUNCTION length(j)
DEFINE j listType
    RETURN j.getLength()
END FUNCTION

FUNCTION append(j,o)
DEFINE j listType
DEFINE o STRING
    CALL j.put(j.getLength()+1,o)
END FUNCTION

FUNCTION insert(j,i,o)
DEFINE j listType
DEFINE i INTEGER
DEFINE o STRING

DEFINE k INTEGER

    FOR k = j.getLength() TO (i) STEP -1
        CALL j.put(k+1,j.get(k))
    END FOR
    CALL j.put(i,o)
END FUNCTION


FUNCTION replace(j,i,o)
DEFINE j listType
DEFINE i INTEGER
DEFINE o STRING
    CALL j.put(i,o)
END FUNCTION

FUNCTION get(j,i)
DEFINE j listType
DEFINE i INTEGER

    RETURN j.get(i)
END FUNCTION

FUNCTION remove(j,i)
DEFINE j listType
DEFINE i INTEGER
    CALL j.remove(i)
END FUNCTION

FUNCTION display(j)
DEFINE j listType
    RETURN j.toString()
END FUNCTION

FUNCTION in(j, value)
DEFINE j listType
DEFINE value STRING
DEFINE i INTEGER
    RETURN IIF(position(j,value) > 0, TRUE, FALSE)
END FUNCTION

FUNCTION position(j, value)
DEFINE j listType
DEFINE value STRING
DEFINE i INTEGER

    FOR i = 1 TO j.getLength()
        IF j.get(i) = value THEN
            RETURN i
        END IF
    END FOR
    RETURN 0
END FUNCTION

FUNCTION count(j, value)
DEFINE j listType
DEFINE value STRING

DEFINE count INTEGER

DEFINE i INTEGER

    LET count = 0
    FOR i = 1 TO j.getLength()
        IF j.get(i) = value THEN
            LET count = count + 1
        END IF
    END FOR
    RETURN count
END FUNCTION