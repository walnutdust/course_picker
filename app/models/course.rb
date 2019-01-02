class Course < ApplicationRecord

  def self.search(search, semester)
    if search
      result = Course.where(offered: "Y").where.not(wms_facil_descr1: "Cancelled")
      result = result.where("(subject || ' ' || catalog_nbr || ' ' || course_title_long) LIKE ?
        OR (subject ||  catalog_nbr || ' ' || course_title_long) LIKE ?",  "%#{search}%", "%#{search}%" )
    else
      result = Course.where(offered: "Y").where.not(wms_facil_descr1: "Cancelled")
    end

    if semester
      result.where(strm: semester)
    else
      result
    end
  end

  def course_name_with_number
    "#{subject} #{catalog_nbr} - #{class_section} (#{course_semester(strm)}): " +" #{course_title_long}"
  end

  def course_semester(semester)
    if semester == 1191
      "Fall"
    elsif semester == 1192
      "Winter"
    elsif semester == 1193
      "Spring"
    end
  end

  def course_distributions
    result = ""

    wms_attr_srch.split(",").each do |distribution|
      if distribution == "DIV_D1"
        result += " Division I;"
      elsif distribution == "DIV_D2"
        result += " Division II;"
      elsif distribution == "DIV_D3"
        result += " Division III;"
      elsif distribution == "DPE_DPE"
        result += " Difference, Power, and Equity;"
      elsif distribution == "WAC_WAC"
        result += " Writing-Intensive;"
      elsif distribution == "QFR_QFR"
        result += " Quantitative/Formal Reasoning (QFR);"
      end
    end

    result[1..-2]

  end

  def course_instructors
    result = []

    if wms_first_name1 != " "
      data = wms_first_name1 + " "
      if wms_mid_name1 != " "
        data += wms_mid_name1 + " "
      end
      data += wms_last_name1

      result << data
      result << url_1
    end

    if wms_first_name2 != " "
      data = wms_first_name2 + " "
      if wms_mid_name2 != " "
        data += wms_mid_name2 + " "
      end
      data += wms_last_name2

      result << data
      result << url_2
    end

    if wms_first_name3 != " "
      data = wms_first_name3 + " "
      if wms_mid_name3 != " "
        data += wms_mid_name3 + " "
      end
      data += wms_last_name3

      result << data
      result << url_3
    end

    if wms_first_name4 != " "
      data = wms_first_name4 + " "
      if wms_mid_name4 != " "
        data += wms_mid_name4 + " "
      end
      data += wms_last_name4

      result << data
      result << url_4
    end

    if wms_first_name5 != " "
      data = wms_first_name5 + " "
      if wms_mid_name5 != " "
        data += wms_mid_name5 + " "
      end
      data += wms_last_name5

      result << data
      result << url_5
    end

    if wms_first_name6 != " "
      data = wms_first_name6 + " "
      if wms_mid_name6 != " "
        data += wms_mid_name6 + " "
      end
      data += wms_last_name6

      result << data
      result << url_6
    end

    result

  end



  def course_time
    data = ""

    if wms_stnd_mtg_pat1 != " "
      data += (wms_stnd_mtg_pat1 + " " + wms_start_time1 + " - " + wms_end_time1 + " " + wms_facil_descr1)
    end
    if wms_stnd_mtg_pat2 != " "
      data += "; " + (wms_stnd_mtg_pat2 + " " + wms_start_time2 + " - " + wms_end_time2 + " " + wms_facil_descr2)
    end
    if wms_stnd_mtg_pat3 != " "
      data += "; " + (wms_stnd_mtg_pat3 + " " + wms_start_time3 + " - " + wms_end_time3 + " " + wms_facil_descr3)
    end

    data
  end

  def course_only_time
    data = ""

    if wms_stnd_mtg_pat1 != " "
      data += (wms_stnd_mtg_pat1 + " " + wms_start_time1 + " - " + wms_end_time1)
    end
    if wms_stnd_mtg_pat2 != " "
      data += "; " + (wms_stnd_mtg_pat2 + " " + wms_start_time2 + " - " + wms_end_time2)
    end
    if wms_stnd_mtg_pat3 != " "
      data += "; " + (wms_stnd_mtg_pat3 + " " + wms_start_time3 + " - " + wms_end_time3)
    end

    data
  end


  def course_time_parsed

    data = []

    if wms_stnd_mtg_pat1 != " " && wms_stnd_mtg_pat1 != "TBA"
      wms_stnd_mtg_pat1.split("").each do |i|
        data << day_time_conversion(i, wms_start_time1, wms_end_time1)
      end
    end
    if wms_stnd_mtg_pat2 != " "
      wms_stnd_mtg_pat2.split("").each do |i|
        data << day_time_conversion(i, wms_start_time2, wms_end_time2)
      end
    end
    if wms_stnd_mtg_pat3 != " "
      wms_stnd_mtg_pat3.split("").each do |i|
        data << day_time_conversion(i, wms_start_time3, wms_end_time3)
      end
    end

    data.flatten

  end

  def day_time_conversion(day, start_time, end_time)
    case day
    when "M"
      return [time_conversion(start_time), time_conversion(end_time)]
    when "T"
      return [1440 + time_conversion(start_time), 1440 + time_conversion(end_time)]
    when "W"
      return [1440 * 2 + time_conversion(start_time), 1440 * 2 + time_conversion(end_time)]
    when "R"
      return [1440 * 3 + time_conversion(start_time), 1440 * 3 + time_conversion(end_time)]
    when "F"
      return [1440 * 4 + time_conversion(start_time), 1440 * 4 + time_conversion(end_time)]
    end
  end

  def time_conversion(time)
    return  time.split(":")[0].to_i * 60 + time.split(":")[1].to_i
  end


  def check(d, slot)
    timeslots = course_time_parsed


    (0..timeslots.count - 1).step(2) do |n|

      #if the course starts before the start time of the time slot and ends after the time slot starts, return true
      if (timeslots[n] < d * 1440 + slot * 15 + 8 * 60) &&  (timeslots[n + 1] > d * 1440 + slot * 15 + 8 * 60)
        return true
      #if the course starts in the time slot, return true
      elsif (timeslots[n] > d * 1440 + slot * 15 + 8 * 60) &&  (timeslots[n] < d * 1440 + slot * 15 + 8 * 60)
        return true
      end
    end

    return false
  end

end
