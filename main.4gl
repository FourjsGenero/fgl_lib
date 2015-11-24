MAIN

    -- Put one we are testing first so can see output
    CALL test_lib_kvp()
    RETURN

    CALL test_lib_number()
    CALL test_lib_date()
    CALL test_lib_string()
    CALL test_lib_list()

END MAIN