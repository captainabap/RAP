@EndUserText.label: 'Status Text'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zc_status_text
  as projection on zi_status_text
{
      @UI.facet: [{    id: 'Details',
                        purpose: #STANDARD ,
                        type:     #FIELDGROUP_REFERENCE,
                        label: 'Details',
                        position: 20 ,
                        targetQualifier: 'Details'}  ]

      @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 10 }]
      @UI: { lineItem:       [ { position: 10 } ] }
  key Status,


      @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 20 }]
      @UI: { lineItem:       [ { position: 20 } ] }
  key Language,


      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @UI.fieldGroup: [ { qualifier: 'Details' ,
                        position: 30 }]
      @UI: { lineItem:       [ { position: 30 } ] }
      Text,
      /* Associations */
      _Status : redirected to parent zc_status
}
