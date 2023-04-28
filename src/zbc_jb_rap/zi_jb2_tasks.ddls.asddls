@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks'
@Metadata.allowExtensions: true
@UI.headerInfo.typeName: 'Task (singular)'
@UI.headerInfo.typeNamePlural: 'Tasks'

define root view entity zi_jb2_tasks
  as select from zbc_tasks
  
  association [1] to ZI_JB2_USERS as _Assignee
  on $projection.Assignee =  _Assignee.UserId
  
  association [0..*] to zi_jb2_status_text as _StatusText
  on $projection.Status = _StatusText.Status
  
  association [1] to zi_jb3_projects as _Project
  on $projection.Project = _Project.ProjectKey
{
  key task_key    as TaskKey,
      summary     as Summary,
      
      @ObjectModel.text.association: '_StatusText'
      status      as Status,
      
      @ObjectModel.text.association: '_Project'
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
      _StatusText,
      _Project
}
