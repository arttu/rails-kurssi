class ExerciseGroup < ActiveRecord::Base
  belongs_to :course
  
  named_scope :starting_this_year, :conditions => ["starts_at >= ? and starts_at < ?", Date.new(Time.now.year), Date.new(Time.now.year) + 1.year]
end
