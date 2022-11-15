CLASS lhc_zi_tasks DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_tasks RESULT result.
*    METHODS copy FOR MODIFY
*      IMPORTING keys FOR ACTION zi_tasks~copy.
    METHODS close FOR MODIFY
      IMPORTING keys FOR ACTION zi_tasks~close.

ENDCLASS.

CLASS lhc_zi_tasks IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD copy .
*    data copies type table for  CREATE zi_tasks.
*    data(parameters) = keys[ 1 ]-%param.
*    read entity zi_tasks
*    ALL FIELDS
*    WITH value #( for key in keys ( taskkey = key-taskkey ) )
*    RESULT data(originals).
*
*    copies  = corresponding #( originals ).
*
*    loop at copies ASSIGNING FIELD-SYMBOL(<copy>).
*    <copy>-TaskKey = <copy>-taskkey && '_CP'.
*    <copy>-%cid = <copy>-taskkey.
*    <copy>-project = parameters-projectkey.
*    <copy>-summary = parameters-summary.
*    endloop.
*
*    modify entities of zi_tasks in LOCAL MODE
*    entity zi_tasks
*    create fields (  project  summary author status description )
*    with copies
*    MAPPED data(mapped_create).
*
*    mapped-zi_tasks = mapped_create-zi_tasks.
*
*
*  ENDMETHOD.

  METHOD close.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_TASKS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

*    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_TASKS IMPLEMENTATION.

*  METHOD adjust_numbers.
*
*    LOOP AT mapped-zi_tasks INTO DATA(ls_task)
*      where %key-taskkey is initial.
*
*      READ ENTITY IN LOCAL MODE zi_tasks
*        ALL FIELDS
*        WITH VALUE #( ( %pid = ls_task-%pid ) )
*        RESULT DATA(result).
*
*      DATA(project) = result[ 1 ]-project.
*
*      SELECT  SINGLE MAX(
*                   CAST( right( task_key,
*                                length( task_key ) - instr( task_key, '-' ) )
*                            AS INT4 ) ) AS max_key
*
*        FROM zbc_tasks
*        WHERE project = @project
*        INTO @DATA(max_key).
*
*      DATA(nextKey) = |{ project }-{ max_key + 1 }|.
*
*      SELECT SINGLE task_key
*        FROM zbc_tasks
*        WHERE task_key = @nextKey
*        INTO @DATA(dummy).
*      ASSERT sy-subrc <> 0. "The key should not exists
*
*      APPEND VALUE #( %key-taskkey = nextKey
*                      %pid = ls_task-%pid ) TO mapped-zi_tasks.
*    ENDLOOP.
*
*  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
