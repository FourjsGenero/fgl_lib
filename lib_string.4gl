FUNCTION string_replace(l_original, l_old, l_new, l_occurences)
DEFINE l_original, l_old, l_new STRING
DEFINE l_occurences INTEGER

DEFINE sb base.StringBuffer

    LET sb = base.StringBuffer.create()
    CALL sb.append(l_original)
    CALL sb.replace(l_old, l_new, l_occurences)
    RETURN sb.toString()
END FUNCTION



FUNCTION proper(l_original)
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



FUNCTION center(s,width)
DEFINE s STRING
DEFINE width INTEGER

DEFINE l INTEGER
DEFINE sb base.StringBuffer
DEFINE i INTEGER
DEFINE spaces_2_add STRING

    LET s = s.trim()
    LET l = s.getLength()
    IF l >=width THEN
        RETURN s
    END IF
    -- prefix with diff / 2 spaces
    LET spaces_2_add = (width-l)/2
    LET sb = base.StringBuffer.create()
    
    FOR i = 1 TO spaces_2_add
        CALL sb.append(" ")
    END FOR
    CALL sb.append(s)
    FOR i = 1 TO spaces_2_add
        CALL sb.append(" ")
    END FOR
    IF (width-l) MOD 2 = 1 THEN
        -- odd number of spaces to add, so add 1 at end
        CALL sb.append(" ")
    END IF
    RETURN sb.toString()
END FUNCTION



FUNCTION reverse(s)
DEFINE s STRING

DEFINE sb base.StringBuffer

DEFINE i INTEGER

    LET sb = base.StringBuffer.create()
    FOR i = s.getLength() TO 1 STEP -1
        CALL sb.append(s.getCharAt(i))
    END FOR
    RETURN sb.toString()
END FUNCTION
    

    
# Convert Base64 to Base64 safe url format
FUNCTION base64_to_base64url(s)
DEFINE  s   STRING

DEFINE  buf base.stringBuffer

    LET buf = base.StringBuffer.create()
    CALL buf.append(s)
    CALL buf.replace("+","-",0)
    CALL buf.replace("/","_",0)
    CALL buf.replace("=",NULL,0)
    RETURN buf.toString()
END FUNCTION


# Convert Base64 safe URL to Base64 format
FUNCTION base64url_to_base64(s)
DEFINE  s   STRING

DEFINE  buf base.stringBuffer

    LET buf = base.StringBuffer.create()
    CALL buf.append(s)
    CALL buf.replace("-","+",0)
    CALL buf.replace("_","/",0)
    CASE (s.getLength() MOD 4)
        WHEN 1
            RETURN NULL # ERROR (Illegal base64url string!)
        WHEN 2
            CALL buf.append("==")
        WHEN 3
            CALL buf.append("=")      
    END CASE
    RETURN buf.toString()
END FUNCTION  
    
        
    