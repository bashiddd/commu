Rails.application.routes.draw do
  get "signup" => "users#new"
  post "users/create" => "users#create"
  post "login" => "users#login"
  # get 'users/:id' => "users#show"
  # get 'posts/index'
  get '/' => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
