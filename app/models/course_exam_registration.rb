class CourseExamRegistration < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :students, :source => :user
end
