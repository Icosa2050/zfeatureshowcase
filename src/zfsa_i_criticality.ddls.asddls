@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Criticality'
@ObjectModel : { resultSet.sizeCategory: #XS }

define view entity ZFSA_I_CRITICALITY
  as select from zfsa_critlty
{
      @ObjectModel.text.element: ['Name'] // Search Term #DisplayTextAndID
  key code  as Code,

      name  as Name,
      descr as Description
}
