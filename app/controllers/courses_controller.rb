class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.first(params[:id])
  end
end
