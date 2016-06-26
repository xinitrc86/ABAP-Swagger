CLASS zcl_swag_example_handler DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES zif_swag_handler.

    TYPES:
      BEGIN OF ty_structure,
        foo TYPE string,
        bar TYPE string,
      END OF ty_structure.

    METHODS the_real_stuff
      IMPORTING
        !iv_foo        TYPE string OPTIONAL
        !iv_bar        TYPE string OPTIONAL
      RETURNING
        VALUE(rs_data) TYPE ty_structure.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SWAG_EXAMPLE_HANDLER IMPLEMENTATION.


  METHOD the_real_stuff.

    CONCATENATE iv_foo iv_bar INTO rs_data-foo.
    rs_data-bar = iv_bar.

  ENDMETHOD.


  METHOD zif_swag_handler~meta.

    APPEND INITIAL LINE TO rt_meta ASSIGNING FIELD-SYMBOL(<ls_meta>).
    <ls_meta>-description = 'this is the description' ##NO_TEXT.
    <ls_meta>-url-regex = '/swag/(\w*)/'.
    APPEND 'IV_FOO' TO <ls_meta>-url-group_names.
    <ls_meta>-method = 'GET'.
    <ls_meta>-handler = 'THE_REAL_STUFF'.

  ENDMETHOD.
ENDCLASS.