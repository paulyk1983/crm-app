Rails.application.routes.draw do
  devise_for :users
  get '/dashboard' => 'dashboard#show'

  namespace :api do
    namespace :v1 do
      get '/companies' => 'companies#index'
      post '/companies' => 'companies#create'
    end
  end

  root to: 'home#show'
end
