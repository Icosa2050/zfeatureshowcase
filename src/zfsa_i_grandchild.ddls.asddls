@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Grandchild'

define view entity ZFSA_I_GRANDCHILD
  as select from zfsa_gch_a
{
  key id              as ID,
      parent_id       as ParentID,
      root_id         as RootID,

      @EndUserText.label : 'String Property'
      string_property as StringProperty
}
