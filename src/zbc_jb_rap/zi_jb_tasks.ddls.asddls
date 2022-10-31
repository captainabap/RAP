@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true 
define view entity zi_jb_tasks as 

select from zbc_tasks

association [1..1] to zi_jb_users as _Author
on $projection.Author = _Author.UserId

association [1..1] to zi_jb_users as _Assignee
on $projection.Assignee = _Assignee.UserId

association [1..*] to zi_jb_comments as _Comments
on $projection.TaskId = _Comments.TaskId

association [0..*] to zi_jb_status_text as _StatusText
on $projection.Status = _StatusText.Status

 {
      @UI.facet: [ {  id: 'Tasks',
                       purpose: #HEADER ,
                      type:     #IDENTIFICATION_REFERENCE,
                      label: 'Identifikation',
                      position: 10 } ,
                      
                   {  id: 'Comments',
                      label: 'Comments', 
                      purpose:  #STANDARD,
                      type:     #LINEITEM_REFERENCE,                     
                      position: 25,
                      targetElement: '_Comments' },
                      
                      {  id: 'Details',
                       purpose: #STANDARD ,
                      type:     #FIELDGROUP_REFERENCE,
                      label: 'Details',
                      position: 20 ,
                      targetQualifier: 'Details'}  ]          
      @UI: { identification: [ { position: 10 } ],
             selectionField: [ { position: 10 } ] ,
             lineItem:       [ { position: 10 } ] }
    key task_id as TaskId,
    
      @UI: { identification: [ { position: 20 } ],
             selectionField: [ { position: 20 } ] ,
             lineItem:       [ { position: 20 } ] }
    @Search:{ defaultSearchElement: true,
              fuzzinessThreshold: 1,
              ranking: #HIGH }
    task_key as TaskKey,
    
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @UI: { identification: [ { position: 30 } ],
             selectionField: [ { position: 30 } ] ,
             lineItem:       [ { position: 30 } ] }
    summary as Summary,
    
      @UI: { identification: [ { position: 40 } ],
             selectionField: [ { position: 40 } ] ,
             lineItem:       [ { position: 40 } ] }
    @ObjectModel.text.association: '_StatusText' 
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_JB_STATUS_TEXT',
                                                     element: 'Status' } } ]
    status as Status,
    
    @UI.fieldGroup: [ { qualifier: 'Details' }]
    project as Project,
    
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    @UI.fieldGroup: [ { qualifier: 'Details' }]
    description as Description,
    
    @EndUserText.label: 'Assignee'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_JB_USERS',
                                                     element: 'UserId' } } ]      
      @UI: { identification: [ { position: 50 } ],
             selectionField: [ { position: 50 } ] ,
             lineItem:       [ { position: 50 } ] }
    assignee as Assignee,
    type as Type,
          @UI: { identification: [ { position: 60 } ],
             selectionField: [ { position: 60 } ] ,
             lineItem:       [ { position: 60 } ] }
    @EndUserText.label: 'Author'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_JB_USERS',
                                                     element: 'UserId' } } ]      
    author as Author,
    changed_at as ChangedAt,
    created_at as CreatedAt,
    due_date as DueDate,
    solution as Solution,
    priority as Priority,
    product as Product,
    
    //Assiciations
    _Author,
    _Assignee,
    
    _Comments,
    _StatusText
}
