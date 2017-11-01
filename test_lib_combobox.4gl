IMPORT FGL lib_combobox

MAIN
DEFINE field1, field2, field3 CHAR(3)
DEFINE i INTEGER

    OPTIONS INPUT WRAP
    OPTIONS FIELD ORDER FORM
    
    CONNECT TO ":memory:+driver='dbmsqt'"
    CALL init_database()

    OPEN WINDOW test_lib_combobox WITH FORM "test_lib_combobox"
   
    INPUT BY NAME field1, field2, field3 ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS=TRUE)
        BEFORE INPUT
            CALL lib_combobox.populate_sql("formonly.field1","SELECT code, name FROM country", NULL)
            CALL lib_combobox.populate_sql("formonly.field2","SELECT code, name FROM country", "%2 (%1)")
            CALL lib_combobox.populate_sql("formonly.field3","SELECT code FROM country", NULL)
        ON CHANGE field1
            DISPLAY SFMT("Value selected in field1 is %1", field1)
        ON CHANGE field2
            DISPLAY SFMT("Value selected in field2 is %1", field2)
        ON CHANGE field3
            DISPLAY SFMT("Value selected in field3 is %1", field3)
            
    END INPUT
END MAIN



FUNCTION init_database()
    CREATE TABLE country(code CHAR(3), name CHAR(40))
    INSERT INTO country VALUES ("NZL","New Zealand")
    INSERT INTO country VALUES ("AUS","Australia")
    INSERT INTO country VALUES ("MAS","Malaysia")
    INSERT INTO country VALUES ("GER","Germany")
    INSERT INTO country VALUES ("FRA","France")
    INSERT INTO country VALUES ("GBR","United Kingdom")
    INSERT INTO country VALUES ("ESP","Spain")
    INSERT INTO country VALUES ("USA","United States of America")
    INSERT INTO country VALUES ("MEX","Mexico")
END FUNCTION
    