@EndUserText.label: 'Change criticality parameter'
define abstract entity ZFSA_D_CHANGECRITICALITYP
{
    @EndUserText.label: 'Change Criticality'
    // Search Term #ValueHelpParameter
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZFSA_I_Criticality',  element: 'Code' }}]
    // Search Term #ParameterDefaultValue
    @UI.defaultValue : #( 'ELEMENT_OF_REFERENCED_ENTITY: CriticalityCode')
    criticality_code : zfsa_criticality;
}
