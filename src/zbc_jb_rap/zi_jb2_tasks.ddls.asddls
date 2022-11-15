@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks'
@Metadata.allowExtensions: true
@UI.headerInfo.typeName: 'Task (singular)'
@UI.headerInfo.typeNamePlural: 'Tasks'

define root view entity zi_jb2_tasks
  as select from zbc_tasks
  
  association [1] to ZI_JB2_USERS as _Assignee
  on $projection.Assignee =  _Assignee.UserId
  
  association [1] to ZI_JB2_USERS as _Author
  on $projection.Assignee =  _Author.UserId
{
  key task_key    as TaskKey,
      summary     as Summary,
      status      as Status,
      project     as Project,
      description as Description,
      assignee    as Assignee,
      type        as Type,
      author      as Author,
      changed_at  as ChangedAt,
      created_at  as CreatedAt,
      due_date    as DueDate,
      solution    as Solution,
      priority    as Priority,
      product     as Product,
      
      _Assignee,
      _Author
}
