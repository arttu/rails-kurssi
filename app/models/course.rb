class Course < ActiveRecord::Base
  belongs_to :subject
  
  has_many :exercise_groups, :dependent => :destroy
end
