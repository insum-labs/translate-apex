prompt --application/shared_components/globalization/language
begin
--   Manifest
--     LANGUAGE MAP: 123
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(11159279752396046)
,p_translation_flow_id=>1236
,p_translation_flow_language_cd=>'fr'
,p_direction_right_to_left=>'N'
);
wwv_flow_api.create_language_map(
 p_id=>wwv_flow_api.id(11281151909919413)
,p_translation_flow_id=>1237
,p_translation_flow_language_cd=>'fr-ca'
,p_direction_right_to_left=>'N'
);
wwv_flow_api.component_end;
end;
/
