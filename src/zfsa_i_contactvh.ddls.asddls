@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Contact Value Help'

define view entity ZFSA_I_CONTACTVH
  as select from ZFSA_I_CONTACT
{
  key ID,
  
      @ObjectModel.text.element: ['CountryName']
      @UI.textArrangement: #TEXT_ONLY
      @EndUserText.label: 'Country'
  key Country,
  
      @Consumption.valueHelpDefault.display: false
      Name,
      
      City,
      Postcode,
      
      @Consumption.filter.hidden: true
      @Consumption.valueHelpDefault.display: false
      _Country._Text[1: Language = $session.system_language].CountryName as CountryName
}
