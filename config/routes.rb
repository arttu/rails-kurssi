ActionController::Routing::Routes.draw do |map|
  map.resources :courses

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :courses
end
