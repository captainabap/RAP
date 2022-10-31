@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comments'
define view entity zi_comments 
as 
select from zbc_comments

association to parent zi_tasks as _Task 
on $projection.TaskKey = _Task.TaskKey
 {
    key task_key as TaskKey,
    key comment_nr as CommentNr,
    comment_text as CommentText,
    
    @Semantics.user.createdBy: true
    author as Author,
    
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
    
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    
    _Task
}
