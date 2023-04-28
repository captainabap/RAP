"!@testing ZC_TASKS
CLASS ltc_zc_tasks
DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.
  PRIVATE SECTION.

    CLASS-DATA:
      environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS:
      "! In CLASS_SETUP, corresponding doubles and clone(s) for the CDS view under test and its dependencies are created.
      class_setup RAISING cx_static_check,
      "! In CLASS_TEARDOWN, Generated database entities (doubles & clones) should be deleted at the end of test class execution.
      class_teardown.

    DATA:
      act_results TYPE STANDARD TABLE OF zc_tasks WITH EMPTY KEY,
      lt_zi_tasks TYPE STANDARD TABLE OF zi_tasks WITH EMPTY KEY.

    METHODS:
      "! SETUP method creates a common start state for each test method,
      "! clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
      setup RAISING cx_static_check,
      prepare_testdata_set,
      "!  In this method test data is inserted into the generated double(s) and the test is executed and
      "!  the results should be asserted with the actuals.
      test_tasks_01 FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_zc_tasks IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create(
      i_for_entity = 'ZC_TASKS'
      i_dependency_list = VALUE #(
        ( name = 'zi_tasks' type ='CDS_VIEW' ) )
      ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD test_tasks_01.
    prepare_testdata_set( ).
    SELECT * FROM zc_tasks INTO TABLE @act_results.
    cl_abap_unit_assert=>fail( msg = 'Place your assertions here' ).
  ENDMETHOD.

  METHOD prepare_testdata_set.

    "Prepare test data for 'zi_tasks'
    lt_zi_tasks = VALUE #(
      (
        taskkey = 'asdf'
        summary = 'asdf'
        status = 'asdf'
        project = 'asdf'
      ) ).
    environment->insert_test_data( i_data =  lt_zi_tasks ).

  ENDMETHOD.

ENDCLASS.
