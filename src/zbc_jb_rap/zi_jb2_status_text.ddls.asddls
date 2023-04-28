@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status text'
define root view entity zi_jb2_status_text 
as 
select from zbc_status_text{
    key status as Status,
    
    @Semantics.language: true
    key language as Language,
    
    @Semantics.text: true
    text as Text
}
