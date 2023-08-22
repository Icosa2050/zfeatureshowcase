@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Child TP'

define view entity ZFSA_R_CHILDTP
  as select from ZFSA_I_Child
  composition [0..*] of ZFSA_R_GrandchildTP as _Grandchild
  association to parent ZFSA_R_RootTP       as _Root on $projection.ParentID = _Root.ID
{
  key ID,
      ParentID,
      StringProperty,
      FieldWithPercent,
      BooleanProperty,
      CriticalityCode,
      StreamFile,
      StreamFilename,
      StreamMimeType,
      /* Associations */
      _Criticality,
      _Grandchild,
      _Root
}
