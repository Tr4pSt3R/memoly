require 'sidekiq/web'
Memoly::Application.routes.draw do
  resources :topics

  authenticate :user, lambda { |u| u.role_symbols.include?(:admin) } do
    mount RailsAdmin::Engine => '/rails_admin', :as => 'rails_admin'
    mount Sidekiq::Web, at: '/sidekiq'
  end

  root :to => "home#index"

  devise_for :users
  # , :controllers => { :sessions => "users/sessions" }

  devise_scope :users do
    get "/users/sign_out" => "sessions#destroy" 
    # get "/sign_in", :to => "users/sessions#new"
  end

  get "privacy",  to: "info#privacy"
  get "terms",    to: "info#terms"
  get "contact",  to: "info#contact"
  get "about",    to: "info#about"

  resources :users do 
    resources :posts do
      resources :comments
    end
    resources :memoids
    resources :releasetimes
  end

  resources :posts do 
    resources :comments
  end

  match 'register' => 'alpha_users#new'
  resources :alpha_users, :except => [:index]

  resources :users, :only => [:show]

  resources :posts,  :only => [:index]
end
