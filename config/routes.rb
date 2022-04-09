Rails.application.routes.draw do
  get '/' => "home#top"
  get "commu/top" => "commu#top"

  get "signup" => "users#new"
  post "users/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post 'users/:id/update' => "users#update"
  get 'users/:id/edit' => "users#edit"
  get 'users/:id' => "users#show"
  
  get "commu/new" => "commu#new"
  post "commu/create" => "commu#create"
  get "commu/narrow_down" => "commu#narrow_down"
  get "commu/:id" => "commu#show"
  # get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
