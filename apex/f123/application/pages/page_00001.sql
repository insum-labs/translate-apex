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
,p_last_upd_yyyymmddhh24miss=>'20211202144847'
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
wwv_flow_api.component_end;
end;
/
