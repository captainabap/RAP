@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Interface View'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
} 
@Metadata.allowExtensions: true
define view entity ZI_EX1_USERS
  as select from zbc_users
      
{
  key user_id       as UserId,
      firstname     as Firstname,
      lastname      as Lastname,
      email         as Email,
      gender        as Gender,
      date_of_birth as DateOfBirth
}
