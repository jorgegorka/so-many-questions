Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/articles", to: "articles#index"
  # put "/articles/:id", to: "articles#update"
  resources :user_sessions, only: [:new, :create, :destroy] # login and logout only
  resources :password_resets, only: [:create, :edit, :update]
  resources :companies

  resources :articles, controller: :management

  namespace :private do 
    resources :articles do 
      # member do 
      #   put :approve
      # end
      resources :article_approval, only: [:update]
      
      # collection do 
      #   put :search
      # end
      resources :articles_search, only: [:index]
      
      resources :comments, shallow: true
      resources :authors
    end
  end
  # scope :private do 
  #   resources :articles
  # end

  # scope module: :private do 
  #   resources :articles
  # end
  # resources :comments, only: [:index, :show, :create]
  # resources :author, except: [:index]
  resource :company 
  root "public#index"
end
