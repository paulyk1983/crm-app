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

  get '/contacts' => 'contacts#index'
  post '/contacts' => 'contacts#create'
  get '/contacts/new' => 'contacts#new'
  get '/contacts/:id' => 'contacts#show'
  get '/contacts/:id/edit' => 'contacts#edit'
  patch '/contacts/:id' => 'contacts#update'
  delete '/contacts/:id' => 'contacts#destroy'

   get '/quotes' => 'quotes#index'
   post '/quotes' => 'quotes#create'
   get '/quotes/new' => 'quotes#new'
   get '/quotes/:id' => 'quotes#show'
   get '/quotes/:id/edit' => 'quotes#edit'
   patch '/quotes/:id' => 'quotes#update'
   post '/send_quote' => 'quotes#send_quote' 

   get '/products' => 'products#index'
   post '/products' => 'products#create'
   get '/products/new' => 'products#new'
   get '/products/:id' => 'products#show'
   get 'products/:id/edit' => 'products#edit'
   patch 'products/:id' => 'products#update'
   delete 'products/:id' => 'products#destroy'

   get '/companies' => 'companies#index'
   post '/companies' => 'companies#create'
   get '/companies/new' => 'companies#new'
   get '/companies/:id' => 'companies#show'
   get 'companies/:id/edit' => 'companies#edit'
   patch 'companies/:id' => 'companies#update'
   delete 'companies/:id' => 'companies#destroy'

  namespace :api do
    namespace :v1 do
      get '/contacts' => 'contacts#index'

      get '/companies' => 'companies#index'
      post '/companies' => 'companies#create'

      get '/inquiries' => 'inquiries#index'
      post '/inquiries' => 'inquiries#create'

      post '/emails' => 'emails#create'

      get '/products' => 'products#index'
      get '/products/new' => 'products#new'
      post '/products' => 'products#create'

      get '/quotes' => 'quotes#index'
      get '/quotes/new' => 'quotes#new'
      post '/quotes' => 'quotes#create'

      get '/companies' => 'companies#index'
      get '/companies/new' => 'companies#new'
      post '/companies' => 'companies#create'
    end
  end

  root to: 'home#show'
  post '/home' => 'home#testpost'
end
