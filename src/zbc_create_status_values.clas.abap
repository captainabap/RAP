CLASS zbc_create_status_values DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.
ENDCLASS.



CLASS zbc_create_status_values IMPLEMENTATION.



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
    update zbc_tasks set project = left( task_key, instr( task_key, '-' ) - 1 ).
  ENDMETHOD.

ENDCLASS.
