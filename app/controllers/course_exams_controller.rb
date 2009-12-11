class CourseExamsController < ApplicationController
  def register
    ce = CourseExam.find(params[:id])
    if ce.register_student!(@current_user)
      NewsfeedEvent.create(:text => "#{@current_user.login} thinks to take an exam: #{ce.name}")
      flash[:notice] = "You were registered to this course exam"
    end
    redirect_to subject_course_path(ce.course.subject, ce.course)
  end
end
