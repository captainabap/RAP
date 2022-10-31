@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Value Help View'
@Search.searchable: true
define view entity zvh_users as select from zbc_users
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Search.ranking: #HIGH  //If a match in the ID is found
    key user_id as UserId,
    
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    firstname as Firstname,
    
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    lastname as Lastname,
    
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    email as Email
}
