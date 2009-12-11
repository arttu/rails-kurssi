class ExerciseGroup < ActiveRecord::Base
  belongs_to :course
  
  has_many :course_registrations, :autosave => true
  
  has_many :students, :through => :course_registrations, :source => :user, :autosave => true
  
  named_scope :starting_this_year, :conditions => ["starts_at >= ? and starts_at < ?", Date.new(Time.now.year), Date.new(Time.now.year) + 1.year]
  
  def register_student!(student)
    self.students << student unless self.course.exercise_groups.map(&:students).flatten.include?(student)
  end
  
  def send_email_to_attendees(opts)
    email = {:subject => opts[:email][:subject], :message => opts[:email][:message]}
    
    email[:recipients] = self.students.map(&:email).compact.join('; ')
    return if email[:recipients].size.zero?
    
    mail = ExerciseGroupMailer.create_email_to_attendees(email)
    ExerciseGroupMailer.deliver(mail)
  end
  
  def description
    "#{self.starts_at.strftime("%a")} #{self.starts_at.strftime("%H")}-#{self.ends_at.strftime("%H")} #{self.classroom}"
  end
end
