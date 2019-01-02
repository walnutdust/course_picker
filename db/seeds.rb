# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Course.delete_all

file = File.read('pretty1819.json')
data_hash = JSON.parse(file)

data = []

data_hash.each do |course|
  object =   {
    "wms_acad_year": course["WMS_ACAD_YEAR"],
    "offered": course["OFFERED"],
    "strm": course["STRM"],
    "crse_id": course["CRSE_ID"],
    "effdt": course["EFFDT"],
    "subject": course["SUBJECT"],
    "catalog_nbr": course["CATALOG_NBR"],
    "class_section": course["CLASS_SECTION"],
    "class_nbr": course["CLASS_NBR"],
    "consent": course["CONSENT"],
    "grading_basis": course["GRADING_BASIS"],
    "ssr_component": course["SSR_COMPONENT"],
    "descr": course["DESCR"],
    "units_minimum": course["UNITS_MINIMUM"],
    "course_title_long": course["COURSE_TITLE_LONG"],
    "wms_first_name1": course["WMS_FIRST_NAME1"],
    "wms_mid_name1": course["WMS_MID_NAME1"],
    "wms_last_name1": course["WMS_LAST_NAME1"],
    "url_1": course["URL_1"],
    "wms_first_name2": course["WMS_FIRST_NAME2"],
    "wms_mid_name2": course["WMS_MID_NAME2"],
    "wms_last_name2": course["WMS_LAST_NAME2"],
    "url_2": course["URL_2"],
    "wms_first_name3": course["WMS_FIRST_NAME3"],
    "wms_mid_name3": course["WMS_MID_NAME3"],
    "wms_last_name3": course["WMS_LAST_NAME3"],
    "url_3": course["URL_3"],
    "wms_first_name4": course["WMS_FIRST_NAME4"],
    "wms_mid_name4": course["WMS_MID_NAME4"],
    "wms_last_name4": course["WMS_LAST_NAME4"],
    "url_4": course["URL_4"],
    "wms_first_name5": course["WMS_FIRST_NAME5"],
    "wms_mid_name5": course["WMS_MID_NAME5"],
    "wms_last_name5": course["WMS_LAST_NAME5"],
    "url_5": course["URL_5"],
    "wms_first_name6": course["WMS_FIRST_NAME6"],
    "wms_mid_name6": course["WMS_MID_NAME6"],
    "wms_last_name6": course["WMS_LAST_NAME6"],
    "url_6": course["URL_6"],
    "wms_stnd_mtg_pat1": course["WMS_STND_MTG_PAT1"],
    "wms_start_time1": course["WMS_START_TIME1"],
    "wms_end_time1": course["WMS_END_TIME1"],
    "wms_facil_descr1": course["WMS_FACIL_DESCR1"],
    "wms_stnd_mtg_pat2": course["WMS_STND_MTG_PAT2"],
    "wms_start_time2": course["WMS_START_TIME2"],
    "wms_end_time2": course["WMS_END_TIME2"],
    "wms_facil_descr2": course["WMS_FACIL_DESCR2"],
    "wms_stnd_mtg_pat3": course["WMS_STND_MTG_PAT3"],
    "wms_start_time3": course["WMS_START_TIME3"],
    "wms_end_time3": course["WMS_END_TIME3"],
    "wms_facil_descr3": course["WMS_FACIL_DESCR3"],
    "wms_attr_srch": course["WMS_ATTR_SRCH"],
    "wms_class_format": course["WMS_CLASS_FORMAT"],
    "wms_rqmt_eval": course["WMS_RQMT_EVAL"],
    "wms_extra_info": course["WMS_EXTRA_INFO"],
    "wms_extra_info2": course["WMS_EXTRA_INFO2"],
    "wms_instr_oth": course["WMS_INSTR_OTH"],
    "wms_prereqs": course["WMS_PREREQS"],
    "wms_enrl_pref": course["WMS_ENRL_PREF"],
    "wms_dept_notes": course["WMS_DEPT_NOTES"],
    "wms_matl_fee": course["WMS_MATL_FEE"],
    "wms_exp_enrl": course["WMS_EXP_ENRL"],
    "wms_enrl_limit": course["WMS_ENRL_LIMIT"],
    "wms_nc": course["WMS_NC"],
    "campus": course["CAMPUS"],
    "wms_descr140": course["WMS_DESCR140"],
    "wms_short_descr": course["WMS_SHORT_DESCR"],
    "wms_descr_srch": course["WMS_DESCR_SRCH"],
    "wms_distrib_notes": course["WMS_DISTRIB_NOTES"]
  }

  data << object
end

Course.create!(data)
