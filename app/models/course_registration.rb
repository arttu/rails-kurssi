class CourseRegistration < ActiveRecord::Base
  
  belongs_to :exercise_group
  belongs_to :user
  has_many :students, :source => :user
end
