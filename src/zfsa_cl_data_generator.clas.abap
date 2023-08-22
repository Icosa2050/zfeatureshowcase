CLASS zfsa_cl_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.

    CLASS-METHODS: generate_random_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS: _delete_table_content.
    CLASS-METHODS: _delete_bo_data.

ENDCLASS.



CLASS ZFSA_CL_DATA_GENERATOR IMPLEMENTATION.


  METHOD generate_random_data.
    _delete_table_content( ).

    INSERT zfsa_root_a  FROM TABLE @( lcl_fsa_root=>generate( ) ).
    INSERT zfsa_chart_a FROM TABLE @( lcl_fsa_chart=>generate( ) ).
    INSERT zfsa_child_a FROM TABLE @( lcl_fsa_child=>generate( ) ).
    INSERT zfsa_nav     FROM TABLE @( lcl_fsa_navigation=>generate( ) ).
    INSERT zfsa_gch_a   FROM TABLE @( lcl_fsa_grandchild=>generate( ) ).
    INSERT zfsa_contact FROM TABLE @( lcl_fsa_contact=>generate( ) ).
    INSERT zfsa_critlty FROM TABLE @( lcl_fsa_criticality=>generate( ) ).

    COMMIT WORK.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    generate_random_data( ).
    out->write( |Data generation: Completed| ) ##NO_TEXT .
  ENDMETHOD.


  METHOD _delete_bo_data.
    SELECT FROM zfsa_root_a
      FIELDS id INTO TABLE @DATA(lt_actives). "#EC CI_NOWHERE

    CHECK lt_actives IS NOT INITIAL.

    SELECT FROM zfsa_root_d
      FIELDS id INTO TABLE @DATA(lt_drafts). "#EC CI_NOWHERE

    IF lt_drafts IS NOT INITIAL.
      MODIFY ENTITIES OF ZFSA_R_RootTP
        ENTITY Root
          EXECUTE Discard FROM
            VALUE #( FOR draft in lt_drafts ( %key-id = draft-id ) )
        FAILED DATA(failed)
          REPORTED DATA(reported).

      COMMIT ENTITIES.
    ENDIF.

    MODIFY ENTITIES OF ZFSA_R_RootTP
      ENTITY Root
        UPDATE
          FIELDS ( DeleteHidden )
          WITH VALUE #( FOR active IN lt_actives (  %key-id = active-id
                                                    DeleteHidden = abap_false ) )
        FAILED failed
        REPORTED reported.

    MODIFY ENTITIES OF ZFSA_R_RootTP
      ENTITY Root
        DELETE FROM
          VALUE #( FOR active in lt_actives ( %key-id = active-id ) )
        FAILED failed
        REPORTED reported.

  ENDMETHOD.


  METHOD _delete_table_content.
    _delete_bo_data( ).

    DELETE FROM zfsa_contact. "#EC CI_NOWHERE
    DELETE FROM zfsa_critlty. "#EC CI_NOWHERE
    DELETE FROM zfsa_nav. "#EC CI_NOWHERE

    COMMIT WORK.
  ENDMETHOD.
ENDCLASS.

