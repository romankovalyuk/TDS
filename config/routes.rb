Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :rooms
  resources :devices

  resources :dashboards

  get "/" => "home#show"
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  delete '/signout' => 'auth0#destroy'
  get "/users" => "users#index"
  get "/profile" => "users#show"


end
