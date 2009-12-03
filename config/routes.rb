ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  map.resources :users
  map.resources :subjects do |subjects|
    subjects.resources :courses do |courses|
      courses.resources :exercise_groups, :member => {:register => :post, :email_form => :get, :send_email => :post}
    end
  end
  map.resources :courses, :path_prefix => '/subjects/:subject_id'
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :subjects
end
