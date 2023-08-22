@EndUserText.label: 'Country Collective Value Help'

@ObjectModel.collectiveValueHelp.for.element: 'Country'

// Search Term #CollectiveValueHelp
define abstract entity ZFSA_D_COUNTRYCVH
{
  @Consumption.valueHelpDefinition:[
    // 'Default' VH
    { 
      entity: { name:'I_Country' },
      label: 'Search by Country' 
    },
    // additional VH, set qualifier
    { 
      entity: { name:'ZFSA_I_ContactVH',
                element:'Country' },
      label: 'Search by Contact',
      qualifier: 'ContactSearch' 
    },
    // additional VH, set qualifier
    { 
      entity: { name:'I_RegionVH',
                element:'Country' },
      additionalBinding: [{ localElement:'Region',
                            element:'Region'  }],
      label: 'Search by Region',
      qualifier:  'RegionSearch' 
    }
  ]
  Country : land1;
  Region  : regio;
}
