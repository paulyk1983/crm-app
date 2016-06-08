Rails.application.routes.draw do
  devise_for :users
  get '/dashboard' => 'dashboard#show'
  root to: 'home#show'
end
