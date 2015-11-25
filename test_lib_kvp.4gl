IMPORT FGL lib_kvp
&include "test_inc.4gl"

FUNCTION test_lib_kvp()
DEFINE k lib_kvp.kvpType

    LET k = lib_kvp.create()
    test11(display,k,"{}")
    test11(lib_kvp.length,k,"0")

    CALL lib_kvp.set(k,"x",100)
    test11(display,k,'{"x":"100"}')
    test11(lib_kvp.length,k,"1")

    CALL lib_kvp.set(k,"y",200)
    test11(display,k,'{"x":"100","y":"200"}')
    test11(lib_kvp.length,k,"2")

    test21(get,k,"x","100")
    test21(get,k,"y","200")
    
    CALL lib_kvp.set(k,"y",300)
    test11(display,k,'{"x":"100","y":"300"}')
    test11(lib_kvp.length,k,"2")
    
    CALL lib_kvp.remove(k,"y")
    test11(display,k,'{"x":"100"}')
    test11(lib_kvp.length,k,"1")
    
    CALL lib_kvp.set(k,"y",200)
    CALL lib_kvp.set(k,"z",300)

    test21(in,k,"w",0)
    test21(in,k,"x",1)
    test21(in,k,"y",1)
    test21(in,k,"z",1)

    test21(position,k,"w",0)
    test21(position,k,"x",1)
    test21(position,k,"y",2)
    test21(position,k,"z",3)

    LET k = kvp9("k1","v1","k2","v2","k3","v3","k4","v4","k5","v5","k6","v6","k7","v7","k8","v8","k9","v9")
    test21(get,k,"k1","v1")
    test21(get,k,"k7","v7")
    test21(get,k,"k9","v9")

    
END FUNCTION