prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 123
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(11158567107370927)
,p_name=>'GREETING_MESSAGE'
,p_message_text=>'Good morning!'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(11218711938145444)
,p_name=>'GREETING_MESSAGE'
,p_message_language=>'fr'
,p_message_text=>'Bienvenue!'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(11341520079004792)
,p_name=>'GREETING_MESSAGE'
,p_message_language=>'fr-ca'
,p_message_text=>'Good morning!'
);
wwv_flow_api.component_end;
end;
/
