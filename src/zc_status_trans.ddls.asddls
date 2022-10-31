@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transitions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_status_trans 
as projection on zi_status_trans 
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
    key StatusFrom,
      @UI: { lineItem:       [ { position: 20 } ] }
   key StatusTo,
      @UI: { lineItem:       [ { position: 30 } ] }
    Text,
    /* Associations */
    _StatusFrom  : redirected to parent zc_status,
    _StatusTo : redirected to zc_status
}
