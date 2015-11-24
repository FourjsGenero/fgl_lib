

FUNCTION getArgumentExists(l_arg)
DEFINE l_arg STRING

DEFINE i INTEGER

    FOR i = 1 TO base.Application.getArgumentCount()
        IF l_arg = base.Application.getArgument(i) THEN
            RETURN TRUE
        END IF
    END FOR
    RETURN FALSE
END FUNCTION



FUNCTION getArgumentPosition(l_arg)
DEFINE l_arg STRING

DEFINE i INTEGER

    FOR i = 1 TO base.Application.getArgumentCount()
        IF l_arg = base.Application.getArgument(i) THEN
            RETURN i
        END IF
    END FOR
    RETURN 0
END FUNCTION



FUNCTION getArgumentParameterCount(l_arg)
DEFINE l_arg STRING
DEFINE i INTEGER

DEFINE l_count INTEGER
DEFINE l_start INTEGER

    LET l_start = getArgumentPosition(l_arg)
    IF l_start = 0 THEN
        RETURN 0
    END IF
    
    LET l_count = 0
    FOR i = (l_start+1) TO base.Application.getArgumentCount()
        IF base.Application.getArgument(i) MATCHES "\-*" THEN
            EXIT FOR
        ELSE
            LET l_count = l_count + 1
        END IF
    END FOR
                
    RETURN l_count
END FUNCTION



FUNCTION getArgumentParameter(l_arg, l_idx)
DEFINE l_arg STRING
DEFINE l_idx INTEGER

DEFINE l_start INTEGER
DEFINE l_count INTEGER

    IF l_idx < 1 THEN
        RETURN NULL
    END IF

    LET l_start = getArgumentPosition(l_arg)
    IF l_start = 0 THEN
        RETURN NULL
    END IF
    
    LET l_count = getArgumentParameterCount(l_arg)
    IF l_count < l_idx THEN
        RETURN NULL
    END IF
    
    RETURN base.Application.getArgument(l_start+l_idx)
END FUNCTION