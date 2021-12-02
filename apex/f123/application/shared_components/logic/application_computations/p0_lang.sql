prompt --application/shared_components/logic/application_computations/p0_lang
begin
--   Manifest
--     APPLICATION COMPUTATION: P0_LANG
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(11266125832831884)
,p_computation_sequence=>10
,p_computation_item=>'P0_LANG'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'SET_ITEM_EQUAL_THIS_PREFERENCE'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'FSP_LANGUAGE_PREFERENCE'
,p_computation_error_message=>'failed to set p0_lang'
);
wwv_flow_api.component_end;
end;
/
