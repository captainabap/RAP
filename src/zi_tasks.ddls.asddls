@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks'
define root view entity zi_tasks 
as 
select from zbc_tasks
composition [0..*] of zi_comments as _Comments 

association [0..1] to zi_users as _Assignee
on $projection.Assignee = _Assignee.UserId

association [0..1] to zi_users as _Author
on $projection.Author = _Author.UserId

association [0..1] to zi_projects as _Project
on $projection.Project = _Project.ProjectKey
 
{
    key task_key as TaskKey,
    summary as Summary,
    status as Status,
    project as Project,
    description as Description,
    assignee as Assignee,
    type as Type,
    author as Author, 
    changed_at as ChangedAt,
    created_at as CreatedAt,
    due_date as DueDate,
    solution as Solution,
    priority as Priority,
    product as Product,
    // Make association public
    _Comments, 
    _Author, 
    _Assignee,
    _Project
}
