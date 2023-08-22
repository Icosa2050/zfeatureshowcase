@EndUserText.label: 'Child TP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

@Search.searchable: true

define view entity ZFSA_C_CHILDTP
  as projection on ZFSA_R_ChildTP
{
  key ID,
      ParentID,

      @Search: { defaultSearchElement: true, fuzzinessThreshold: 0.9 }
      StringProperty,

      FieldWithPercent,
      BooleanProperty,
      CriticalityCode,
      StreamFilename, // Search Term #Stream
      
      // Search Term #Stream
      @Semantics.largeObject: {
        acceptableMimeTypes: [ 'image/*', 'application/*' ],
        cacheControl.maxAge: #MEDIUM,
        contentDispositionPreference: #INLINE, // #ATTACHMENT - download as file
                                                   // #INLINE - open in new window
        fileName: 'StreamFilename',
        mimeType: 'StreamMimeType'
      }
      StreamFile,
      
      // Search Term #Stream
      @Semantics.mimeType: true
      StreamMimeType,
      
      /* Associations */
      _Criticality,
      _Grandchild : redirected to composition child ZFSA_C_GrandchildTP,
      _Root : redirected to parent ZFSA_C_RootTP
}
