@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'User Management'
define root view entity zi_users 
as 
select from zbc_users{
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
    key user_id as UserId,
    
    @UI: { lineItem:       [ { position: 20 } ],
           selectionField: [ { position: 20 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 20 }]    
    firstname as Firstname,
    
    @UI: { lineItem:       [ { position: 30 } ],
           selectionField: [ { position: 30 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 30 }]  
    lastname as Lastname,
    
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 40 }]   
    email as Email,
    
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 50 }]   
    gender as Gender,
    
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 60 }]   
    date_of_birth as DateOfBirth
}
