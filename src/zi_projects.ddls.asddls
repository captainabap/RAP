@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projects'
define root view entity zi_projects 
as 
select from zbc_projects 

association [0..*] to zi_tasks as _Tasks
on $projection.ProjectKey = _Tasks.Project

{
         @UI.facet: [ {  id: 'Tasks',
                       purpose: #HEADER ,
                      type:     #IDENTIFICATION_REFERENCE,
                      label: 'Status Value',
                      position: 10 } ,
                                            
                      
                      {    id: 'Details',
                           purpose: #STANDARD ,
                           type:     #FIELDGROUP_REFERENCE,
                           label: 'Details',
                           position: 20 ,
                           targetQualifier: 'Details'}  ] 
                           
    @UI: { identification: [ { position: 10 } ],
           selectionField: [ { position: 10 } ] ,
           lineItem:       [ { position: 10 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 10 }]                           
    key project_key as ProjectKey,
    @UI: { identification: [ { position: 20 } ],
           lineItem:       [ { position: 20 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 20 }]          
    name as Name,
    
    @UI: {  lineItem:       [ { position: 10 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 30 }]   
    @Consumption.valueHelpDefinition: [{ entity: { name: 'ZVH_USERS',
                                                   element: 'UserId' } } ]                           
    project_manager as ProjectManager,    
    
    @UI: { identification: [ { position: 110 } ] }
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    
    @UI: { identification: [ { position: 120 } ] }
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
    
    @UI: { identification: [ { position: 130 } ] }
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    
    @UI: { identification: [ { position: 150 } ] }
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt
}
