class Subject < ActiveRecord::Base
  
  has_many :courses, :dependent => :destroy
  
  validates_length_of :name, :minimum => 3
end
