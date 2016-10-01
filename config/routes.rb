Rails.application.routes.draw do
  devise_for :users
  
  get '/dashboard' => 'dashboard#show'

  get '/inquiries' => 'inquiries#index'
  get '/inquiries/:id' => 'inquiries#show'
  get '/inquiries/:id/edit' => 'inquiries#edit'
  patch '/inquiries/:id' => 'inquiries#update'

  get '/messages/new' => 'messages#new'
  post '/messages' => 'messages#create'

  get '/test_form' => 'test_form#show'

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
