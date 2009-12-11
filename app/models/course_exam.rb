class CourseExam < ActiveRecord::Base
  belongs_to :course

  has_many :course_exam_registrations, :autosave => true
  has_many :students, :through => :course_exam_registrations, :source => :user, :autosave => true

  def register_student!(student)
    self.students << student unless self.students.include?(student)
  end
end
