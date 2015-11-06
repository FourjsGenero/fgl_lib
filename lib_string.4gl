FUNCTION string_replace(l_original, l_old, l_new, l_occurences)
DEFINE l_original, l_old, l_new STRING
DEFINE l_occurences INTEGER

DEFINE sb base.StringBuffer

    LET sb = base.StringBuffer.create()
    CALL sb.append(l_original)
    CALL sb.replace(l_old, l_new, l_occurences)
    RETURN sb.toString()
END FUNCTION



FUNCTION toProperCase(l_original)
DEFINE l_original STRING

DEFINE l_length, l_pos INTEGER
DEFINE l_char STRING
DEFINE sb base.StringBuffer
DEFINE l_upper BOOLEAN

    LET sb = base.StringBuffer.create()
    LET l_upper = TRUE
    LET l_length = l_original.getLength()
    FOR l_pos = 1 TO l_length
        LET l_char = l_original.getCharAt(l_pos)
        IF l_upper THEN
            CALL sb.append(l_char.toUpperCase())
        ELSE
            CALL sb.append(l_char.toLowerCase())
        END IF
        LET l_upper = IIF(l_char=" ", TRUE, FALSE)
    END FOR
    RETURN sb.toString()
END FUNCTION


-- move to lib_number
FUNCTION number_suffix(l_number)
DEFINE l_number INTEGER

    IF l_number = 0 THEN
        RETURN ""
    END IF
    LET l_number = l_number MOD 100
    CASE
        WHEN l_number = 3
            RETURN "rd"
        WHEN l_number = 11
            RETURN "th"
        WHEN l_number MOD 10 = 1
            RETURN "st"
        WHEN l_number = 12
            RETURN "th"
        WHEN l_number MOD 10 = 2
            RETURN "nd"
        WHEN l_number = 13
            RETURN "th"
        WHEN l_number MOD 10 = 3
            RETURN "rd"
        OTHERWISE
            RETURN "th"
    END CASE
END FUNCTION
        
    
        
    