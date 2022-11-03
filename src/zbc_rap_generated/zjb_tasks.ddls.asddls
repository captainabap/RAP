@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Generated Task Management '
define root view entity ZJB_TASKS
  as select from zbc_tasks as Tasks
{
  key task_key as TaskKey,
  summary as Summary,
  status as Status,
  project as Project,
  description as Description,
  @Semantics.user.createdBy: true
  assignee as Assignee,
  type as Type,
  author as Author,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  changed_at as ChangedAt,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  due_date as DueDate,
  solution as Solution,
  priority as Priority,
  product as Product
  
}
