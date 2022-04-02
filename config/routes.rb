Rails.application.routes.draw do
  get 'commu/top'
  get "signup" => "users#new"
  post "users/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  # get 'users/:id' => "users#show"
  # get 'posts/index'
  get '/' => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
