class NewsfeedEvent < ActiveRecord::Base
  named_scope :newest, lambda { |amount| {:order => "created_at desc", :limit => amount}}
end
