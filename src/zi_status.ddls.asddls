@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Maintenance'
define root view entity zi_status as select from zbc_statust

composition [0..*] of zi_status_trans as _StatusTransitions 
composition [0..*] of zi_status_text as _Texts 
association [0..*] to zi_status_text as _StatusText on $projection.Status = _StatusText.Status
{
    @ObjectModel.text.association: '_StatusText'
    key status as Status,
    _StatusTransitions,
    _StatusText,
    _Texts
}
