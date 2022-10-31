@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Users'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_jb_users
  as select from zbc_users
{     
      @UI.facet: [ { purpose: #STANDARD ,
                     type:     #IDENTIFICATION_REFERENCE,
                     label: 'Identifikationsdaten' } ]

      @UI: { identification: [ { position: 10 } ],
             selectionField: [ { position: 10 } ] ,
             lineItem:       [ { position: 10 } ] }
             
  key user_id       as UserId,
  
      @UI: { identification:[ { position: 20 } ] }
      @UI.selectionField: [ { position: 20 } ] 
      @UI.lineItem: [ { position: 20 } ]
      firstname     as Firstname,
      
      @UI: { identification:[ { position: 30 } ] }
      @UI.selectionField: [ { position: 30 } ] 
      @UI.lineItem: [ { position: 30 } ]
      lastname      as Lastname,
      
      @UI.lineItem: [ { position: 60 } ]
      email         as Email,
      
      @UI.lineItem: [ { position: 80 } ]
      gender        as Gender,
      
      @UI: { identification:[ { position: 50 } ] }
      @UI.lineItem: [ { position: 50 } ]
      date_of_birth as DateOfBirth
}
