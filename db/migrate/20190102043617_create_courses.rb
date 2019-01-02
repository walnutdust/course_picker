class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|

      t.integer :wms_acad_year
      t.string :offered
      t.integer :strm
      t.integer :crse_id
      t.date :effdt
      t.string :subject
      t.integer :catalog_nbr
      t.integer :class_section
      t.integer :class_nbr
      t.string :consent
      t.string :grading_basis
      t.string :ssr_component
      t.string :descr
      t.integer :units_minimum
      t.string :course_title_long
      t.string :wms_first_name1
      t.string :wms_mid_name1
      t.string :wms_last_name1
      t.string :url_1
      t.string :wms_first_name2
      t.string :wms_mid_name2
      t.string :wms_last_name2
      t.string :url_2
      t.string :wms_first_name3
      t.string :wms_mid_name3
      t.string :wms_last_name3
      t.string :url_3
      t.string :wms_first_name4
      t.string :wms_mid_name4
      t.string :wms_last_name4
      t.string :url_4
      t.string :wms_first_name5
      t.string :wms_mid_name5
      t.string :wms_last_name5
      t.string :url_5
      t.string :wms_first_name6
      t.string :wms_mid_name6
      t.string :wms_last_name6
      t.string :url_6
      t.string :wms_stnd_mtg_pat1
      t.string :wms_start_time1
      t.string :wms_end_time1
      t.string :wms_facil_descr1
      t.string :wms_stnd_mtg_pat2
      t.string :wms_start_time2
      t.string :wms_end_time2
      t.string :wms_facil_descr2
      t.string :wms_stnd_mtg_pat3
      t.string :wms_start_time3
      t.string :wms_end_time3
      t.string :wms_facil_descr3
      t.string :wms_attr_srch
      t.string :wms_class_format
      t.string :wms_rqmt_eval
      t.string :wms_extra_info
      t.string :wms_extra_info2
      t.string :wms_instr_oth
      t.string :wms_prereqs
      t.string :wms_enrl_pref
      t.string :wms_dept_notes
      t.string :wms_matl_fee
      t.integer :wms_exp_enrl
      t.integer :wms_enrl_limit
      t.string :wms_nc
      t.string :campus
      t.string :wms_descr140
      t.string :wms_short_descr
      t.text :wms_descr_srch
      t.string :wms_distrib_notes

      t.timestamps
    end
  end
end
