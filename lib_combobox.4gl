

FUNCTION populate_sql(l_fieldname, l_sql, l_format_string)
DEFINE l_fieldname STRING
DEFINE l_sql STRING
DEFINE l_format_string STRING

DEFINE l_cb ui.ComboBox
DEFINE l_sqlh base.SqlHandle
DEFINE l_first BOOLEAN
DEFINE l_column_count SMALLINT

    LET l_first = TRUE

    LET l_cb = ui.ComboBox.forName(l_fieldname)
    IF l_cb is NULL THEN
        RETURN
    END IF
    CALL l_cb.clear()

    LET l_sqlh  = base.SqlHandle.create()
    CALL l_sqlh.prepare(l_sql)
    CALL l_sqlh.open()
    WHILE TRUE
        CALL l_sqlh.fetch()
        IF SQLCA.SQLCODE = NOTFOUND THEN
            EXIT WHILE
        END IF
        IF l_first THEN
            LET l_column_count = l_sqlh.getResultCount()
            LET l_first = FALSE
            IF l_column_count > 2  THEN
                EXIT WHILE
            END IF
            IF l_column_count <= 0 THEN
                EXIT WHILE
            END IF
        END IF
        CASE
            WHEN l_column_count = 1 
                CALL l_cb.addItem(l_sqlh.getResultValue(1), l_sqlh.getResultValue(1))
            WHEN l_column_count = 2 AND l_format_string IS NULL
                CALL l_cb.addItem(l_sqlh.getResultValue(1), l_sqlh.getResultValue(2))
            WHEN l_column_count = 2
                CALL l_cb.addItem(l_sqlh.getResultValue(1), SFMT(l_format_string,l_sqlh.getResultValue(1) CLIPPED, l_sqlh.getResultValue(2) CLIPPED)) 
        END CASE
    END WHILE
    CALL l_sqlh.close()
END FUNCTION
    

    