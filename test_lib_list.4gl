IMPORT FGL lib_list

&include "test_inc.4gl"

FUNCTION test_lib_list()
DEFINE l lib_list.listType

    LET l = lib_list.create()
    test11(display,l,"[]")
    test11(lib_list.length,l,"0")

    CALL lib_list.append(l,"the")
    test11(display,l,'["the"]')
    test11(lib_list.length,l,"1")
    
    CALL lib_list.replace(l,1,"The")
    test11(display,l,'["The"]')
    test11(lib_list.length,l,"1")

    CALL lib_list.append(l,"browns")
    test11(display,l,'["The","browns"]')
    test11(lib_list.length,l,"2")

    CALL lib_list.replace(l,2,"brown")
    test11(display,l,'["The","brown"]')
    test11(lib_list.length,l,"2")

    CALL lib_list.insert(l,2,"quick")
    test11(display,l,'["The","quick","brown"]')
    test11(lib_list.length,l,"3")
    
    CALL lib_list.append(l,"fox")
    test11(display,l,'["The","quick","brown","fox"]')
    test11(lib_list.length,l,"4")

    CALL lib_list.remove(l,1)
    test11(display,l,'["quick","brown","fox"]')
    test11(lib_list.length,l,"3")

    test21(in,l,"The", 0)
    test21(in,l,"quick", 1)
    test21(in,l,"brown", 1)
    test21(in,l,"fox", 1)

    test21(position,l,"The", 0)
    test21(position,l,"quick", 1)
    test21(position,l,"brown", 2)
    test21(position,l,"fox", 3)

    test21(lib_list.count,l,"xxx",0)
    test21(lib_list.count,l,"fox",1)
    CALL lib_list.append(l,"fox")
    test21(lib_list.count,l,"fox",2)

    LET l = lib_list.create_from_string("red,green,blue,yellow",",")
    test11(display,l,'["red","green","blue","yellow"]')
    test11(lib_list.length,l,"4")
    test21(in,l,"blue",1)
    test21(in,l,"purple",0)
    
    
END FUNCTION