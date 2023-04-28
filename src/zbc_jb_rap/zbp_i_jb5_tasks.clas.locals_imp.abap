CLASS lhc_zi_jb5_tasks DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_jb5_tasks RESULT result.

*    METHODS get_instance_features FOR INSTANCE FEATURES
*      IMPORTING keys REQUEST requested_features FOR zi_jb5_tasks RESULT result.

    METHODS cancel FOR MODIFY
      IMPORTING keys FOR ACTION zi_jb5_tasks~cancel.

    METHODS fillchangefields FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zi_jb5_tasks~fillchangefields.

    METHODS validateassignee FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_jb5_tasks~validateassignee.

ENDCLASS.

CLASS lhc_zi_jb5_tasks IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD cancel.
    MODIFY ENTITIES OF zi_jb5_tasks IN LOCAL MODE
           ENTITY zi_jb5_tasks
           UPDATE FIELDS ( status )
           WITH  VALUE #( FOR key IN keys ( %tky = key-%tky
                                         status = 'CANCELED' ) ).


  ENDMETHOD.

  METHOD fillchangefields.
    get TIME STAMP FIELD data(ts).
    MODIFY ENTITIES OF zi_jb5_tasks IN LOCAL MODE
           ENTITY zi_jb5_tasks
           UPDATE FIELDS ( ChangedAt
                           CreatedAt
                           author )
           WITH  VALUE #( FOR key IN keys ( %tky = key-%tky
                                            changedat = ts
                                            author = sy-uname ) ).



  ENDMETHOD.

  METHOD validateassignee.

    SELECT DISTINCT status
      FROM zbc_status_text
      INTO TABLE @DATA(status_texts).

    READ ENTITIES OF zi_jb5_tasks IN LOCAL MODE
      ENTITY zi_jb5_tasks
        FIELDS ( assignee ) "the field to validate
        WITH CORRESPONDING #( keys )
      RESULT DATA(tasks).


    LOOP AT tasks INTO DATA(task) .
      IF NOT line_exists( status_texts[ status = task-status ] ).

        APPEND VALUE #( %tky = task-%tky ) TO failed-zi_jb5_tasks.

        APPEND VALUE #( %tky = task-%tky
                        %msg = NEW zbc_rap_message(
                           msgv1 = |Status "{ task-status }" invalid|
                           textid = zbc_rap_message=>validation_failed
                           severity = if_abap_behv_message=>severity-error )
                         %element-status = if_abap_behv=>mk-on
                      ) TO reported-zi_jb5_tasks.


      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
