CLASS zbc_db_cleanup DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.
  PRIVATE SECTION.

    METHODS delete_invalid_taskkeys.
ENDCLASS.



CLASS zbc_db_cleanup IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
  "  INSERT into zbc_statust values @( value #( status = 'NEW'   ) ).
*    update zbc_users set user_id = upper( left( concat( left( firstname , 1 ) , lastname ), 12 ) ).
*     update zbc_tasks set task_key = replace( task_key, '_', '-' ).
*     insert zbc_comments from ( select c~task_id ,
*                                       t~task_key,
*                                       c~comment_nr,
*                                       comment_text,
*                                       c~author,
*                                       c~changed_at,
*                                       c~created_at
*                                  from zbc_comments as c
*                                  left outer join zbc_tasks as t
*                                  on c~task_id = t~task_id ).
*    delete from zbc_comments where task_key = ''.
    delete_invalid_taskkeys( ).
  ENDMETHOD.


  METHOD delete_invalid_taskkeys.

delete from zbc_tasks where right( task_key, length( task_key ) - instr( task_key, '-' ) ) = ''.
  ENDMETHOD.

ENDCLASS.
