Rails.application.routes.draw do
  root 'home#top'
  get 'top' => "home#top"
  get "commu/top" => "commu#top"
  
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "users/create" => "users#new_reload"
  post "login" => "users#login"
  get "login" => "users#login_reload"
  post "logout" => "users#logout"
  
  post 'users/:id/update' => "users#update"
  get 'users/:id/update' => "users#update_reload"
  get 'users/:id/edit' => "users#edit"
  get "users/:id/commu" => "users#commu_index"
  get 'users/:id' => "users#show"
  
  get "commu/new" => "commu#new"
  post "commu/create" => "commu#create"
  get "commu/create" => "commu#new_reload"
  get "commu/narrow_down" => "commu#narrow_down"
  get "commu/:id" => "commu#show"
  get "commu/:id/edit" => "commu#edit"
  post "commu/:id/update" => "commu#update"
  get "commu/:id/update" => "commu#update_reload"
  
  get "members/:id" => "members#index"

  get "notifications/index" => "notifications#index"
  post "apply/:id" => "notifications#apply"
  post "approval/:id" => "members#approval"
  post "rejection/:id" => "members#rejection"

  get "posts/:id/new" => "posts#new"
  get "posts/:id" => "posts#index"
  post "posts/:id/create" => "posts#create"
  get "posts/:id/create" => "posts#create_reload"

  post "likes/:id" => "likes#new"
  post "likes/:id/destroy" => "likes#destroy"
  get "likes/:id/index" => "likes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
