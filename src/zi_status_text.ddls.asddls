@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Text'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_status_text 
as 
select from zbc_status_text 

association  to parent zi_status as _Status on $projection.Status = _Status.Status 
{
    @ObjectModel.text.element: ['Text']
    key status as Status,
    
    @Semantics.language: true
    key language as Language,
    
    @Semantics.text: true
    text as Text,
    
    //Associations
    _Status
}
