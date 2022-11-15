@EndUserText.label: 'Tasks'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo: { typeName: 'Task',
                  typeNamePlural: 'Tasks',
                  title.value: 'summary',
                  
                  typeImageUrl: 'https://cdn-icons-png.flaticon.com/512/1233/1233173.png'
                 
}
@UI.selectionVariant: [{qualifier: 'test', 
filter: 'Project = BW4' , 
text: 'SelktionFariant' ,
 id: '234'} ]
@UI.presentationVariant: [{ id: 'default', 
                            sortOrder: [{by: 'ChangedAt'}] ,
                            text: 'Text'}]
@Search.searchable: true
@OData.publish: true
define root view entity zc_tasks
  provider contract transactional_query
  as projection on zi_tasks
{
      @UI.facet: [ 

                   {  id: 'Comments',
                   label: 'Comments',
                   purpose:  #STANDARD,
                   type:     #LINEITEM_REFERENCE,
                   position: 29,
                   targetElement: '_Comments' },

                   { id: 'Details',
                   purpose: #STANDARD ,
                   type:     #FIELDGROUP_REFERENCE,
                   label: 'Details',
                   position: 20 ,
                   targetQualifier: 'Details'} ,
                   
                   { id: 'Description',
                   purpose: #STANDARD ,
                   type:     #FIELDGROUP_REFERENCE,
                   label: 'Description',
                   position: 5 ,
                   targetQualifier: 'Description'} ,

                   { id: 'Properties',
                   purpose: #STANDARD ,
                   type:     #FIELDGROUP_REFERENCE,
                   label: 'Properties',
                   position: 20 ,
                   targetQualifier: 'Properties'}  ]

      @UI.lineItem:[ { position: 10 },
                     { type: #FOR_ACTION, 
                       dataAction : 'cancel', 
                       label: 'Cancel Tasks' 
                       } ,
                     { type: #FOR_ACTION, 
                       dataAction : 'copy', 
                       label: 'Copy Task' 
                       } ]
                     
      @UI: { identification: [ { position: 10 } ],
             selectionField: [{ position: 20 } ] }
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 1 }]
      
      @Search:{ defaultSearchElement: true,
                fuzzinessThreshold:   0.95,
                ranking:              #HIGH }
  key TaskKey,

      @UI: { identification: [ { position: 20 } ],
           lineItem:       [ { position: 20 } ] }

      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 5 }]

      @Search:{ defaultSearchElement: true,
                fuzzinessThreshold:   0.80}
      Summary,

      @UI: { identification: [ { position: 10 } ],
             lineItem:       [ { position: 10 } ] }

      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 50 }]
      Status,

      @ObjectModel.text.association: '_Project'
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 40 }]
      Project,
      @UI.multiLineText: true
      @UI.fieldGroup: [ { qualifier: 'Description' ,
                          position: 30 }]
      Description,
      
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 20 }]
 
      @ObjectModel.text.association: '_Assignee'                         
      Assignee,
      Type,
      

      @UI.fieldGroup: [ { qualifier: 'Details' ,
                          position: 10 }, 
                        { qualifier: 'Properties' ,
                          position: 70 } ]
      
      @ObjectModel.text.association: '_Author'
      Author,
      
      @UI.fieldGroup: [ { qualifier: 'Properties' ,
                          position: 80 }]
      ChangedAt,
      
      @UI.fieldGroup: [ { qualifier: 'Properties' ,
                          position: 90 }]
      CreatedAt,
      DueDate,
      Solution,
      
      @UI.fieldGroup: [ { qualifier: 'Properties' ,
                          position: 10 }]
      Priority,
      Product,
      /* Associations */
      _Assignee,
      _Author,
      _Comments : redirected to composition child zc_comments,
      _Project
} 
