@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projects'
@Metadata.allowExtensions: true
define root view entity zi_jb3_projects 
as 
select from zbc_projects {
                                         
    key project_key as ProjectKey,    
       
    @Semantics.text: true                           
    name as Name,
    project_manager as ProjectManager,  
    
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,    
    
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt
}
