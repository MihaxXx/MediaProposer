Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  namespace :api do
    get 'media', to: 'media#index'
    get 'media/:id', to: 'media#show'
    get 'media/search/:name', to: 'media#search'
    get 'media/search_remote/:name', to: 'media#search_remote'
    get 'images/:id', to: 'images#show'
    get 'reviews/by_user/:id', to: 'reviews#by_user'
    get 'reviews/by_media/:id', to: 'reviews#by_media'
  end
end
