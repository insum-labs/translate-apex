prompt --application/shared_components/user_interface/lovs/app_languages
begin
--   Manifest
--     APP_LANGUAGES
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(11222141717250108)
,p_lov_name=>'APP_LANGUAGES'
,p_lov_query=>'.'||wwv_flow_api.id(11222141717250108)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(11222423244250110)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'English (US)'
,p_lov_return_value=>'en-us'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(11222823500250111)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'French (France)'
,p_lov_return_value=>'fr'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(11340532685978649)
,p_lov_disp_sequence=>12
,p_lov_disp_value=>'French (Canada)'
,p_lov_return_value=>'fr-ca'
);
wwv_flow_api.component_end;
end;
/
