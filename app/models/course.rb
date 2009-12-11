class Course < ActiveRecord::Base
  belongs_to :subject
  
  has_many :exercise_groups, :dependent => :destroy
  has_many :course_exams, :dependent => :destroy
end
