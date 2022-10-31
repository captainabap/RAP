@EndUserText.label: 'Tasks'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view  entity zc_tasks 
as 
projection on ZI_TASKS {
    key TaskKey,
    Summary,
    Status,
    Project,
    Description,
    Assignee,
    Type,
    Author,
    ChangedAt,
    CreatedAt,
    DueDate,
    Solution,
    Priority,
    Product,
    /* Associations */
    _Assignee ,
    _Author  ,
    _Comments : redirected to composition child zc_comments,
    _Project 
}
