CLASS zbc_create_bo_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zbc_create_bo_instances IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITY zi_jb5_tasks
        CREATE  FIELDS ( taskkey assignee author summary description status )
          WITH  VALUE #( ( taskkey = 'DMO-03'
                               %key-taskkey = 'DMO-03'
                               assignee     = sy-uname
                               author       = sy-uname
                               summary      = 'Create a new Task from ABAP'
                               description  = |Create a new Task using the \n MODIFRY ENTY Statement. \n test!|
                               status       = 'NEW' ) )
                             REPORTED DATA(create_rep)
                             FAILED DATA(create_fail) .
    LOOP AT  create_rep-zi_jb5_tasks  INTO DATA(ls_create_rep).
      out->write( ls_create_rep-%msg->if_message~get_text( ) ).
    ENDLOOP.

    COMMIT ENTITIES RESPONSE OF zi_jb5_tasks REPORTED DATA(lt_reported)
                                             FAILED   DATA(lt_failed).
    LOOP AT  lt_reported-zi_jb5_tasks  INTO DATA(ls_data).
      out->write( ls_data-%msg->if_message~get_text( ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
