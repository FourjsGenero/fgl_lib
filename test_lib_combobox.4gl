IMPORT FGL lib_combobox

MAIN
DEFINE field1 CHAR(3)
DEFINE i INTEGER

    OPTIONS INPUT WRAP
    OPTIONS FIELD ORDER FORM
    
    CONNECT TO ":memory:"
    CALL init_database()

    OPEN WINDOW test_lib_combobox WITH FORM "test_lib_combobox"
   
    INPUT BY NAME field1 ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS=TRUE)
        ON ACTION next
            LET i = i + 1
            CASE i
                WHEN 1 
                    CALL lib_combobox.populate_sql("formonly.field1","SELECT code, name FROM country", NULL)
                WHEN 2 
                    CALL lib_combobox.populate_sql("formonly.field1","SELECT code, name FROM country", "%2 (%1)")
                WHEN 3
                    CALL lib_combobox.populate_sql("formonly.field1","SELECT code FROM country", NULL)
            END CASE
            NEXT FIELD CURRENT
        ON CHANGE field1
            MESSAGE field1
    END INPUT
END MAIN



FUNCTION init_database()
    CREATE TABLE country(code CHAR(3), name CHAR(40))
    INSERT INTO country VALUES ("NZL","New Zealand")
    INSERT INTO country VALUES ("AUS","Australia")
    INSERT INTO country VALUES ("MAS","Malaysia")
    INSERT INTO country VALUES ("GER","Germany")
    INSERT INTO country VALUES ("FRA","France")
    INSERT INTO country VALUES ("GBR","United Kingdon")
    INSERT INTO country VALUES ("ESP","Spain")
    INSERT INTO country VALUES ("USA","United States of America")
    INSERT INTO country VALUES ("MEX","Mexico")
END FUNCTION
    