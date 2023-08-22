@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Grandchild TP'
define view entity ZFSA_R_GRANDCHILDTP
  as select from ZFSA_I_GRANDCHILD
  association        to parent ZFSA_R_CHILDTP as _Child on $projection.ParentID = _Child.ID
  association [0..1] to ZFSA_R_ROOTTP         as _Root  on $projection.RootID = _Root.ID
{
  key ID,
      ParentID,
      RootID,
      StringProperty,
      _Child,
      _Root
}
