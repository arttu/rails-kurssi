class ExerciseGroupMailer < ActionMailer::Base
  

  def email_to_attendees(email, sent_at = Time.now)
    subject    email[:subject]
    recipients email[:recipients]
    from       "Ilmo 2.0"
    sent_on    sent_at
    
    body       :message => email[:message]
  end

end
