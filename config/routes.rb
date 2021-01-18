Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :recipes
      resources :faqs
      resources :products
      # resources :users do
      #   resources :recipes do
      #     resources :ingredients
      #   end
      # end
      # resources :ingredients
      # resources :recipes do
      #   resources :ingredients
      # end


      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

    end
  end
end
