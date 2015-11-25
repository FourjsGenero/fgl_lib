IMPORT FGL lib_number

PUBLIC TYPE colourType CHAR(7)  -- where first digit is &
TYPE rgbType CHAR(2)

FUNCTION add(c1,c2)
DEFINE c1, c2 colourType

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    LET r3 = lib_number.number_2_hex(lib_number.min(255,lib_number.hex_2_number(r1) + lib_number.hex_2_number(r2)),2)
    LET g3 = lib_number.number_2_hex(lib_number.min(255,lib_number.hex_2_number(g1) + lib_number.hex_2_number(g2)),2)
    LET b3 = lib_number.number_2_hex(lib_number.min(255,lib_number.hex_2_number(b1) + lib_number.hex_2_number(b2)),2)

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION

FUNCTION mix(c1,c2,p)
DEFINE c1, c2 colourType
DEFINE p FLOAT

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    LET r3 = lib_number.number_2_hex(((1-p)*lib_number.hex_2_number(r1) + p*lib_number.hex_2_number(r2)),2)
    LET g3 = lib_number.number_2_hex(((1-p)*lib_number.hex_2_number(g1) + p*lib_number.hex_2_number(g2)),2)
    LET b3 = lib_number.number_2_hex(((1-p)*lib_number.hex_2_number(b1) + p*lib_number.hex_2_number(b2)),2)

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION

FUNCTION subtract(c1,c2)
DEFINE c1, c2 colourType

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    LET r3 = lib_number.number_2_hex(lib_number.max(0,lib_number.hex_2_number(r1) - lib_number.hex_2_number(r2)),2)
    LET g3 = lib_number.number_2_hex(lib_number.max(0,lib_number.hex_2_number(g1) - lib_number.hex_2_number(g2)),2)
    LET b3 = lib_number.number_2_hex(lib_number.max(0,lib_number.hex_2_number(b1) - lib_number.hex_2_number(b2)),2)

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION



FUNCTION red(c)
DEFINE c colourType
    RETURN c[2,3]
END FUNCTION

FUNCTION green(c)
DEFINE c colourType
    RETURN c[4,5]
END FUNCTION

FUNCTION blue(c)
DEFINE c colourType
    RETURN c[6,7]
END FUNCTION

FUNCTION rgb(r,g,b)
DEFINE r,g,b rgbType
DEFINE c colourType
    LET c= "&",r,g,b
    RETURN c
END FUNCTION

FUNCTION split(c)
DEFINE c colourType
    RETURN red(c), green(c), blue(c)
END FUNCTION