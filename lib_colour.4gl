IMPORT FGL lib_number
IMPORT util

PUBLIC TYPE colourType CHAR(7)  -- where first digit is &
TYPE rgbType CHAR(2)

&define n2h(p1) IIF(p1=0,"00", IIF(p1<16, "0"||util.Integer.toHexString(p1).toUpperCase(), util.Integer.toHexString(p1).toUpperCase()))
&define h2n(p1) util.Integer.parseHexString(p1)


FUNCTION add(c1 colourType,c2 colourType) RETURNS colourType

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    
    LET r3 = n2h(lib_number.min(255,h2n(r1) + h2n(r2)))
    LET g3 = n2h(lib_number.min(255,h2n(g1) + h2n(g2)))
    LET b3 = n2h(lib_number.min(255,h2n(b1) + h2n(b2)))

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION

FUNCTION mix(c1 colourType,c2 colourType,p FLOAT) RETURNS colourType

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    LET r3 = n2h(((1-p)*h2n(r1) + p*h2n(r2)))
    LET g3 = n2h(((1-p)*h2n(g1) + p*h2n(g2)))
    LET b3 = n2h(((1-p)*h2n(b1) + p*h2n(b2)))

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION

FUNCTION subtract(c1 colourType,c2 colourType) RETURNS colourType

DEFINE result colourType

DEFINE r1,r2,g1,g2,b1,b2,r3,g3,b3 rgbType

    CALL split(c1) RETURNING r1,g1,b1
    CALL split(c2) RETURNING r2,g2,b2

    LET r3 = n2h(lib_number.max(0,h2n(r1) - h2n(r2)))
    LET g3 = n2h(lib_number.max(0,h2n(g1) - h2n(g2)))
    LET b3 = n2h(lib_number.max(0,h2n(b1) - h2n(b2)))

    LET result = rgb(r3,g3,b3)
    RETURN result
END FUNCTION



FUNCTION red(c colourType) RETURNS rgbType
    RETURN c[2,3]
END FUNCTION

FUNCTION green(c colourType) RETURNS rgbType
    RETURN c[4,5]
END FUNCTION

FUNCTION blue(c colourType) RETURNS rgbType
    RETURN c[6,7]
END FUNCTION

FUNCTION rgb(r rgbType,g rgbType,b rgbType) RETURNS colourType
DEFINE c colourType
    LET c= "&",r,g,b
    RETURN c
END FUNCTION

FUNCTION split(c colourType) RETURNS (rgbType, rgbType, rgbType)
    RETURN red(c), green(c), blue(c)
END FUNCTION