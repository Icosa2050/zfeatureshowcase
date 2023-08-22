@EndUserText.label: 'Change progress parameter'
define abstract entity ZFSA_D_CHANGEPROGRESSP
{
  @EndUserText.label: 'Change Progress'
  // Search Term #ParameterDefaultValue
  @UI.defaultValue : '60'
  progress : abap.int4;

}
