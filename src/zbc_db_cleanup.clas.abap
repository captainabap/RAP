CLASS zbc_db_cleanup DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.
  PRIVATE SECTION.

    METHODS delete_invalid_taskkeys.
    METHODS clean_task_key.
    METHODS clean_user_id.
ENDCLASS.



CLASS zbc_db_cleanup IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
  "  INSERT into zbc_statust values @( value #( status = 'NEW'   ) ).
*   clean_user_id( ).
*delete from zbc_users where firstname = ''.
"   clean_task_key( ).

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
  "  delete_invalid_taskkeys( ).
*  update zbc_tasks set project = left( task_key , instr( task_key, '-' ) - 1 ).
  update zbc_tasks set changed_at = '00000000.0000000' where changed_at = '20220101.000000'.
  ENDMETHOD.


  METHOD delete_invalid_taskkeys.

delete from zbc_tasks where right( task_key, length( task_key ) - instr( task_key, '-' ) ) = ''.
  ENDMETHOD.


  METHOD clean_task_key.

    UPDATE zbc_tasks SET task_key = replace( task_key, '_', '-' ).

  ENDMETHOD.


  METHOD clean_user_id.

select u~user_id ,
       lpad(  cast( row_number( ) over( order by user_id ) as char ), 10, '0' ) as num
from zbc_users as u
into table @data(mapping).

loop at mapping into data(ls_mapping).
    UPDATE zbc_tasks SET author = ls_mapping-user_id
                   where author = ls_mapping-num.

    UPDATE zbc_tasks SET assignee = ls_mapping-user_id
                   where assignee = ls_mapping-num.
endloop.
  ENDMETHOD.

ENDCLASS.
