prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 123
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_app_setting(
 p_id=>wwv_flow_api.id(11096569331349881)
,p_name=>'ACCESS_CONTROL_SCOPE'
,p_value=>'ACL_ONLY'
,p_is_required=>'N'
,p_valid_values=>'ACL_ONLY, ALL_USERS'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_api.id(11093379860349867)
,p_comments=>'The default access level given to authenticated users who are not in the access control list'
);
wwv_flow_api.component_end;
end;
/
