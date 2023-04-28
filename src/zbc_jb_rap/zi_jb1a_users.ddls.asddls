@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Interface View'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_JB1A_USERS
  as select from zbc_users
{
      @UI: { lineItem:       [ { position: 10 } ] }
  key user_id       as UserId,
   
      @UI: { lineItem:       [ { position: 20  } ] }
      firstname     as Firstname,
      
      @UI: { lineItem:       [ { position: 30, label: 'Nachname' } ] }
      lastname      as Lastname,
      
      @UI: { lineItem:       [ { position: 40  } ] }
      email         as Email,
      
      @UI: { lineItem:       [ { position: 50 } ] }
      gender        as Gender,
      
      @UI: { lineItem:       [ { position: 60 } ] }
      date_of_birth as DateOfBirth
}
