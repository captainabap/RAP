@EndUserText.label: 'Comments'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: { typeName: 'Comment',
                  typeNamePlural: 'Comments',
                  title.value: 'CommentText'
}
define view entity zc_comments
  as projection on zi_comments
{
      @UI.facet: [
                  { id: 'Details',
                  purpose: #STANDARD ,
                  type:     #FIELDGROUP_REFERENCE,
                  label: 'Details',
                  position: 30 ,
                  targetQualifier: 'Details'},
                  { id: 'Comment',
                  purpose: #STANDARD ,
                  type:     #FIELDGROUP_REFERENCE,
                  label: 'Comment',
                  position: 20 ,
                  targetQualifier: 'Comment'} ]

      @UI.lineItem: [ { position: 10 } ]
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 1 }]
  key TaskKey,
  key CommentNr,
      @UI.multiLineText: true
      @UI.lineItem: [ { position: 20 } ]
      @UI.fieldGroup: [ { qualifier: 'Comment' ,
                          position: 2 }]
      CommentText,
      @UI.lineItem: [ { position: 30 } ]
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 3 }]
      Author,
      @UI.lineItem: [ { position: 40 } ]
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 4 }]
      ChangedAt,
      @UI.lineItem: [ { position: 50 } ]
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 5 }]
      CreatedAt,
      /* Associations */
      _Task : redirected to parent zc_tasks
}
