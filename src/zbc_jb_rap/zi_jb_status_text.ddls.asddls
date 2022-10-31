@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_jb_status_text as 
select from zbc_status_text 
{  
      @UI: { lineItem:       [ { position: 10 } ] }
    key status as Status,    
    
      @UI: { lineItem:       [ { position: 20 } ] }
    @Semantics.language: true
    key language as Language,
    
    @Semantics.text: true
    
    text as Text
}
