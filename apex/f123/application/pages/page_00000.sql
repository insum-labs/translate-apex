prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>123
,p_default_id_offset=>0
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(11091851475349838)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20211202151436'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22487018638049270)
,p_plug_name=>'{footer}'
,p_icon_css_classes=>'fa-language'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(10971277124349730)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11261507004773289)
,p_name=>'P0_LANG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(22487018638049270)
,p_prompt=>'Language'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'APP_LANGUAGES'
,p_lov=>'.'||wwv_flow_api.id(11222141717250108)||'.'
,p_field_template=>wwv_flow_api.id(11064899261349793)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(11226323513279714)
,p_name=>'change language'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_LANG'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11226661078279717)
,p_event_id=>wwv_flow_api.id(11226323513279714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_preference( p_preference => ''FSP_LANGUAGE_PREFERENCE''',
'                       , p_value      => :P0_LANG',
'                       );',
''))
,p_attribute_02=>'P0_LANG'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(11226408894279715)
,p_event_id=>wwv_flow_api.id(11226323513279714)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.component_end;
end;
/
