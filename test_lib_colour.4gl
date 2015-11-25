IMPORT FGL lib_colour

&include "test_inc.4gl"

FUNCTION test_lib_colour()
    test21(add,"&FF0000","&00FF00","&FFFF00")
    test21(add,"&405060","&806040","&C0B0A0")
    test21(add,"&435261","&846546","&C7B7A7")
    test21(add,"&FFFFFF","&010101","&FFFFFF")
    test21(add,"&FFFFFF","&000000","&FFFFFF")
    
    test21(subtract,"&FFFFFF","&00FF00","&FF00FF")
    test21(subtract,"&FFFFFF","&FF0000","&00FFFF")
    test21(subtract,"&FFFFFF","&0000FF","&FFFF00")
    test21(subtract,"&C7B7A7","&435261","&846546")
    test21(subtract,"&C7B7A7","&846546","&435261")
    test21(subtract,"&000000","&010101","&000000")
    test21(subtract,"&010101","&000000","&010101")

    test31(mix,"&000000","&00FF00",0.5,"&007F00")
    test31(mix,"&000000","&00FF00",0.25,"&003F00")
    test31(mix,"&000000","&00FF00",0.75,"&00BF00")
    test31(mix,"&000000","&FFFFFF",0.5,"&7F7F7F")
    test31(mix,"&FF0000","&00FF00",0.5,"&7F7F00")
END FUNCTION