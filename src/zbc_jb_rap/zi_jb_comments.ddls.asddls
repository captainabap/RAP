@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comments'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_jb_comments as 
select from zbc_comments 

association [1..1] to zbc_users as _Author
on $projection.Author = _Author.user_id
{
      @UI: { lineItem:       [ { position: 10 } ] }
    key task_key as TaskKey,
      @UI: { lineItem:       [ { position: 20 } ] }
    key comment_nr as CommentNr,
    
      @UI: { identification: [ { position: 10 } ],
             lineItem:       [ { position: 30 } ] }
    @Semantics.text: true
    comment_text as CommentText,
    
      @UI: { identification: [ { position: 10 } ],
             lineItem:       [ { position: 40 } ] }
    author as Author,
    
      @UI: { identification: [ { position: 10 } ],
             lineItem:       [ { position: 50 } ] }
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
    
      @UI: { identification: [ { position: 10 } ],
             lineItem:       [ { position: 60 } ] }
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    
    //Associations
    _Author
}
