CLASS zbc_test_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zbc_test_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    read ENTITY zi_users

    ALL FIELDS

    WITH value #( ( userid = 'JBRANDEIS'  ) )

    RESULT data(lt_result).

    data(tmp) = lt_result[ 1 ]-%key.
    out->write( lt_result[ 1 ]-DateOfBirth ).
  ENDMETHOD.

ENDCLASS.
