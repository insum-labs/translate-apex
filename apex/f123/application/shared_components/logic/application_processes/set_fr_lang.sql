prompt --application/shared_components/logic/application_processes/set_fr_lang
begin
--   Manifest
--     APPLICATION PROCESS: SET_FR_LANG
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(11235282991396245)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_FR_LANG'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_preference( p_preference => ''FSP_LANGUAGE_PREFERENCE''',
'                        , p_value      => ''fr''',
'                        );'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
wwv_flow_api.component_end;
end;
/
