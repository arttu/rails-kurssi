class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :course_registrations
  has_many :course_exam_registrations
  
  has_many :friends, :through => :friendships
  has_many :friendships, :dependent => :destroy
  
  def friends_with?(user)
    return true if user == self || self.friends.include?(user)
  end
  
  def become_a_friend_with(user)
    self.friends << user
    NewsfeedEvent.create(:text => "#{self.login} added #{user.login} as a friend")
  end
end
