@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks'
@Metadata.allowExtensions: true
define root view entity ZI_jb5_tasks as select from zbc_tasks
composition [0..*] of zi_jb5_comments as _Comments

association [1] to zi_jb2_status_text as _StatusText
on $projection.Status = _StatusText.Status

association [1] to ZI_JB2_USERS as _Assignee
on $projection.Assignee = _Assignee.UserId

association [1] to zi_jb3_projects as _Project
on $projection.Project = _Project.ProjectKey

 {
    key task_key as TaskKey,
    
    summary as Summary,
    
    @ObjectModel.text.association: '_StatusText'
    status as Status,
    
    @ObjectModel.text.association: '_Project'
    project as Project,
    
    @UI.multiLineText: true
    description as Description,
    
    @ObjectModel.text.association: '_Assignee'
    assignee as Assignee,
    type as Type,
    author as Author,
    changed_at as ChangedAt,
    created_at as CreatedAt,
    due_date as DueDate,
    solution as Solution,
    priority as Priority,
    product as Product,
    
    _Comments ,
    _StatusText,
    _Assignee,
    _Project
}
