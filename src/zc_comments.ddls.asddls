@EndUserText.label: 'Comments'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zc_comments 
as 
projection on ZI_COMMENTS 
{
    key TaskKey,
    key CommentNr,
    CommentText,
    Author,
    ChangedAt,
    CreatedAt,
    /* Associations */
    _Task : redirected to parent zc_tasks
}
