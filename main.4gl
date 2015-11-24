MAIN

    -- Put one we are testing first so can see output
    CALL test_lib_list()
    RETURN

    CALL test_lib_number()
    CALL test_lib_date()
    CALL test_lib_string()

    -- Put one we are testing last so can see output
    CALL test_lib_string()
END MAIN