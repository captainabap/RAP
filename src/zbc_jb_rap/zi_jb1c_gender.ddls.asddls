@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Gender Value Help'
define view entity zi_jb1c_gender
  as select from dd07t
{
  key valpos     as value_position,
      @Semantics.language: true
  key ddlanguage as language,
      domvalue_l as value,
      ddtext     as text
}
where
  domname = 'ZBC_GENDER'
