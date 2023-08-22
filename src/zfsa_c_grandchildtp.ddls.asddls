@EndUserText.label: 'Grandchild TP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZFSA_C_GRANDCHILDTP
  as projection on ZFSA_R_GrandchildTP
{
  key ID,
      ParentID,
      RootID,
      StringProperty,
      /* Associations */
      _Child : redirected to parent ZFSA_C_ChildTP,
      _Root : redirected to ZFSA_C_RootTP
}
