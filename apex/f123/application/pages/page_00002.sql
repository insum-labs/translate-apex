prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(11091851475349838)
,p_name=>'public page'
,p_alias=>'PUBLIC-PAGE'
,p_step_title=>'public page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20211202211718'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(11227403725279725)
,p_name=>'your user'
,p_template=>wwv_flow_api.id(11002210977349749)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :APP_USER',
'from dual',
'UNION ALL',
'select apex_util.get_session_lang',
'from dual;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(11032323032349768)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(11227555207279726)
,p_query_column_id=>1
,p_column_alias=>':APP_USER'
,p_column_display_sequence=>10
,p_column_heading=>':app User'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(22581567900132016)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(11227356925279724)
,p_branch_name=>'public page branch'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'FUNCTION_BODY'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_retval boolean := false;',
'begin',
'',
'if apex_util.get_session_lang is null then',
'    ait_translate_util.set_app_lang(p_application_id => :APP_ID);',
'    l_retval := true;',
'end if;',
'',
'return l_retval;',
'end;'))
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
