Rails.application.routes.draw do
  get '/' => "home#top"
  get "commu/top" => "commu#top"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get 'users/:id' => "users#show"
  get "commu/create" => "commu#create"
  # get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
