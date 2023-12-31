@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root TP'

// Search Term #SemanticKey
@ObjectModel.semanticKey: ['StringProperty']

define root view entity ZFSA_R_ROOTTP
  as select from ZFSA_I_ROOT
  composition [0..*] of ZFSA_R_CHILDTP as _Child
  composition [0..*] of ZFSA_R_CHARTTP as _Chart
{
  key ID,
      StringProperty,
      ImageUrl,
      IntegerValue,
      IntegerValue   as RadialIntegerValue,
      ForecastValue,
      TargetValue,
      Dimensions,
      
      @EndUserText.label: 'Progress Indicator'
      IntegerValue   as ProgressIntegerValue,

      @EndUserText.label: 'Rating Indicator'
      StarsValue,

      // Search Term #ValueHelps BEGIN

      // Search Term #DependentFilter
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/FSA_I_Contact' , element: 'ID' },
                                           label: 'Contacts',
                                           additionalBinding: [{ element: 'Country',
                                                                 localElement: 'Country',
                                                                 usage: #FILTER }] }]
      ContactID,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/FSA_I_Criticality', element: 'Code' },
                                           additionalBinding: [{ element: 'Name',
                                                                 localElement: 'FieldWithCriticality',
                                                                 usage: #RESULT }] }]
      CriticalityCode,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UnitOfMeasureStdVH', element: 'UnitOfMeasure' } }]
      Uom,

      FieldWithQuantity,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      IsoCurrency,

      // Search Term #CollectiveValueHelp
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/FSA_D_CountryCVH',  element: 'Country' },
                                           additionalBinding: [{ element: 'Region', 
                                                                 localElement: 'Region' }]  }]
      Country,

      @Consumption.valueHelpDefinition: [{entity: { name: 'I_RegionVH', element: 'Region' },
                                          additionalBinding: [{ element: 'Country',
                                                                localElement: 'Country' }] }]
      Region,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/FSA_I_Navigation', element: 'ID' } }]
      NavigationID,
      // Search Term #ValueHelps END

      FieldWithCriticality,
      FieldWithPrice,
      FieldWithPrice as HarveyFieldWithPrice,
      DeleteHidden,
      UpdateHidden,
      FieldWithUrl,
      FieldWithUrlText,
      Email,
      Telephone,
      ValidFrom,
      ValidTo,
      Time,
      Timestamp,
      Description,
      DescriptionCustomGrowing,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Contact,
      _Country,
      _Criticality,
      _Currency,
      _Navigation,
      _Region,
      _UoM,
      _Child,
      _Chart
}
