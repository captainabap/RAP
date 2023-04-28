CLASS zbc_rap_message DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    CONSTANTS:
      BEGIN OF validation_failed,
        msgid TYPE symsgid VALUE 'ZBC_RAP_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MSGV1',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF validation_failed,

      BEGIN OF action_successful,
        msgid TYPE symsgid VALUE 'ZBC_RAP_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'ACTION',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF action_successful.

    DATA:
      msgv1  TYPE string,
      msgv2  TYPE string,
      msgv3  TYPE string,
      msgv4  TYPE string,
      action TYPE string.


    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        severity  TYPE if_abap_behv_message=>t_severity OPTIONAL
        msgv1     TYPE string OPTIONAL
        msgv2     TYPE string OPTIONAL
        msgv3     TYPE string OPTIONAL
        msgv4     TYPE string OPTIONAL
        action    TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbc_rap_message IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    if_abap_behv_message~m_severity = severity.
    me->msgv1    = msgv1    .
    me->msgv2    = msgv2    .
    me->msgv3    = msgv3    .
    me->msgv4    = msgv4    .
    me->action   = action   .
  ENDMETHOD.
ENDCLASS.
