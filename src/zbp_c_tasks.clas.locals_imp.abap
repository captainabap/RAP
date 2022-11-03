CLASS lhc_zc_tasks DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS cancel FOR MODIFY
      IMPORTING keys FOR ACTION zc_tasks~cancel.

ENDCLASS.

CLASS lhc_zc_tasks IMPLEMENTATION.

  METHOD cancel.
    MODIFY ENTITIES OF zc_tasks IN LOCAL MODE
      ENTITY zc_tasks
     UPDATE FIELDS ( status )
     WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                     status = 'CANCELED' ) ).


  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
