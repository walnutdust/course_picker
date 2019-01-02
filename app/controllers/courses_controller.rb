class CoursesController < ApplicationController

  def index
    @courses = Course.search(params[:search], params[:semester])

    brownies = []

    if cookies[:selected_courses]
      brownies = JSON.parse(cookies[:selected_courses])

      if params[:button]
        if brownies.include? params[:button]
          brownies.delete(params[:button])
        else
          brownies << params[:button]
        end
      end

    else
      brownies << params[:button]

    end


    cookies[:selected_courses] = JSON.generate(brownies)

    @selected_courses = brownies
    @selected_courses_full = []



    if brownies
      brownies.each do |brownie|
        data = Course.find_by(class_nbr: brownie, offered: "Y")
        if data
          @selected_courses_full << data
        end
      end
    end

    @course_params = params


  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:search, :semester, :button)
  end



end
