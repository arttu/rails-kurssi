# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def current_time
    t = Time.now
    "#{t.day}.#{t.month}.#{t.year} #{t.strftime("%H:%M")}"
  end
  def nl2br(s)
    s.gsub(/\n/,'<br />')
  end
end
