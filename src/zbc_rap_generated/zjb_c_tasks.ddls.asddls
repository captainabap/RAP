@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZJB_TASKS'
define root view entity ZJB_C_TASKS
  as projection on ZJB_TASKS
{
  key taskkey,
  summary,
  status,
  project,
  description,
  type,
  author,
  changedat,
  duedate,
  solution,
  priority,
  product
  
}
