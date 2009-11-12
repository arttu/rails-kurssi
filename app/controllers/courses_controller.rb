class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(params[:course])
    
    if @course.save
      redirect_to course_path(@course)
    else
      render(:action => 'new')
    end
  end
end
