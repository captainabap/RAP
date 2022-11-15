@EndUserText.label: 'Status Maintenance'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Search.searchable: true
define  root view entity zc_status 
  provider contract transactional_query
  as projection on zi_status {

         @UI.facet: [ {  id: 'Tasks', 
                       purpose: #HEADER ,
                      type:     #IDENTIFICATION_REFERENCE,
                      label: 'Status Value',
                      position: 10 } ,
                      
                      {  id: 'Translations',
                      label: 'Translations', 
                      purpose:  #STANDARD,
                      type:     #LINEITEM_REFERENCE,                     
                      position: 25,
                      targetElement: '_Texts' },
                      
                      {  id: 'Transitions',
                      label: 'Transitions', 
                      purpose:  #STANDARD,
                      type:     #LINEITEM_REFERENCE,                     
                      position: 29,
                      targetElement: '_StatusTransitions' },
                      
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
          
    key Status,
    
      @UI: { identification: [ { position: 20 } ],
             selectionField: [ { position: 20 } ] ,
             lineItem:       [ { position: 20 } ] }
    @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 20 }]   
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    _StatusText.Text as StatusText : localized ,
    
    /* Associations */
    _StatusTransitions : redirected to composition child zc_status_trans, 
    
      @Search.defaultSearchElement: true
    _Texts : redirected to composition child zc_status_text
    
    }
