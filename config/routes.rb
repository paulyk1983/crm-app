Rails.application.routes.draw do
  devise_for :users
  
  get '/dashboard' => 'dashboard#show'

  get '/inquiries/:id' => 'inquiries#show'

  get '/messages/new' => 'messages#new'
  post '/messages' => 'messages#create'

  namespace :api do
    namespace :v1 do
      get '/companies' => 'companies#index'
      post '/companies' => 'companies#create'

      get '/inquiries' => 'inquiries#index'
      post '/inquiries' => 'inquiries#create'

      post '/emails' => 'emails#create'
    end
  end

  root to: 'home#show'
end
