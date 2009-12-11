class CourseRegistration < ActiveRecord::Base
  
  belongs_to :exercise_group
  belongs_to :user
  has_many :students, :source => :user
  
  def self.top_5_attendeed_courses
    counts = count(:group => "exercise_group_id", :order => "count_all desc", :limit => 5, :include => :exercise_group)
    arr = []
    counts.each_pair { |eg_id, count|
      arr << [ExerciseGroup.find(eg_id).course, count]
    }
    arr
  end
end
