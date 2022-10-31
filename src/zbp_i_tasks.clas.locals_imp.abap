CLASS lhc_zi_tasks DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_tasks RESULT result.
    METHODS copy FOR MODIFY
      IMPORTING keys FOR ACTION zi_tasks~copy.
    METHODS close FOR MODIFY
      IMPORTING keys FOR ACTION zi_tasks~close.

ENDCLASS.

CLASS lhc_zi_tasks IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD copy .

  ENDMETHOD.

  METHOD close.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_TASKS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_TASKS IMPLEMENTATION.

  METHOD adjust_numbers.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
