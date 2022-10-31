@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Transitions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_status_trans 
as 
select from zbc_status_trans 
association to parent  zi_status as _StatusFrom on $projection.StatusFrom = _StatusFrom.Status
association  [1] to zi_status as _StatusTo   on $projection.StatusTo   = _StatusTo.Status

{
    key status_from as StatusFrom,
    key status_to as StatusTo,
    text as Text,
    //Associations
    _StatusTo,
    _StatusFrom
}
