ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  map.resources :users
  map.resources :subjects
  map.resource :account, :controller => "users"
  map.resources :users
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :subjects
end
