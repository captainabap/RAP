@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comments'
define view entity zi_jb5_comments
  as select from zbc_comments
  association to parent ZI_jb5_tasks as _Tasks on $projection.TaskKey = _Tasks.TaskKey
{

      @UI.facet: [ { label: 'Details',
    targetQualifier: 'Details',
    type: #FIELDGROUP_REFERENCE,
    purpose: #STANDARD,
    position: 10
  },
   { id: 'User',
                      purpose:  #STANDARD,
                      type:     #IDENTIFICATION_REFERENCE,
                      label:    'User',
                      position: 10 } ]
  key task_key     as TaskKey,

      @UI.identification:[ { position: 10 }]
  key comment_nr   as CommentNr,

      @UI.multiLineText: true
      @UI.identification:[ { position: 10 }]
      @UI.lineItem: [{ position: 20 }]
      comment_text as CommentText,

      @UI.identification:[ { position: 10 }]
      @UI.lineItem: [{ position: 30 }]
      author       as Author,


      @UI.identification:[ { position: 10 }]
      @UI.lineItem: [{ position: 40 }]
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at   as ChangedAt,
      created_at   as CreatedAt,
      _Tasks // Make association public
}
