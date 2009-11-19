ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  map.resources :users
  map.resources :courses
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :courses
end
