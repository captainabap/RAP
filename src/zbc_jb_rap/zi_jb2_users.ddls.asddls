@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Interface View'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
} 
@Metadata.allowExtensions: true
define view entity ZI_JB2_USERS
  as select from zbc_users
  
  association [0..*] to zi_jb2_tasks as _TasksToDo
  on $projection.UserId = _TasksToDo.Assignee
  
//  association [0..*] to zi_jb2_tasks as _TasksCreated
//  on $projection.UserId = _TasksCreated.Author
      
{
  key user_id       as UserId,
      firstname     as Firstname,
      lastname      as Lastname,
      email         as Email,
      gender        as Gender,
      date_of_birth as DateOfBirth,
      
      //Associations
      _TasksToDo
//      _TasksCreated
}
