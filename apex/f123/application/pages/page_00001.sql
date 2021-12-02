prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(11091851475349838)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'translation'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20211202215841'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11104509568349917)
,p_plug_name=>'translation'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(10992480448349743)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11225859531279709)
,p_plug_name=>'Hello, welcome to this multi-lingual application!'
,p_icon_css_classes=>'fa-language'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(10992480448349743)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>unistr('Today''s inspirational quote is courtesy of Walt Disney : "All our dreams can come true, if we have the courage to pursue them.\201D')
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(11226742168279718)
,p_plug_name=>'environment'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(10982647615349737)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'owa_util.print_cgi_env;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11226888540279719)
,p_name=>'P1_BROWSER_LANG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(11226742168279718)
,p_prompt=>'Browser Lang'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(11064899261349793)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(11227137275279722)
,p_name=>'P1_BROWSER_LANG_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(11226742168279718)
,p_prompt=>'Browser Lang'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(11064899261349793)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(11226953571279720)
,p_computation_sequence=>10
,p_computation_item=>'P1_BROWSER_LANG'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'owa_util.get_cgi_env(param_name => ''HTTP_ACCEPT_LANGUAGE'')'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(11227237877279723)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'browser language plsql'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_http_accept_language varchar2(4000);',
'begin',
'    l_http_accept_language := owa_util.get_cgi_env(param_name => ''HTTP_ACCEPT_LANGUAGE'');',
'    ',
'    select column_value',
'    into :P1_BROWSER_LANG_1',
'    from table(apex_string.split(l_http_accept_language, '',''))',
'    fetch first 1 rows only;',
'',
'    --:P1_BROWSER_LANG_1 := l_http_accept_language;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
