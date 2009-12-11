ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  map.resources :users
  map.resources :subjects do |subjects|
    subjects.resources :courses do |courses|
      courses.resources :course_exams, :member => {:register => :post}
      courses.resources :exercise_groups, :member => {:register => :post, :email_form => :get, :send_email => :post}
    end
  end
  map.resources :courses, :path_prefix => '/subjects/:subject_id'
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.connect 'account/:login', :controller => "users", :action => "show"
  map.connect 'account/:login/become_a_friend', :controller => "users", :action => "become_a_friend"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :subjects
end
