class ExerciseGroupsController < ApplicationController
  def register
    eg = ExerciseGroup.find(params[:id])
    if eg.register_student!(@current_user)
      flash[:notice] = "You were registered to this course"
    else
      flash[:notice] = "Your registration failed. Please check if you already are on some of the exercise groups."
    end
    redirect_to subject_course_path(eg.course.subject, eg.course)
  end

end