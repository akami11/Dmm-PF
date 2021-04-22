Rails.application.routes.draw do
  get "/", to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, :except => [:index, :new, :create]
  resources :foods
  resources :categories, :except => [:new]
  resources :recipes
  resources :tips, :except => [:index, :show] do
    resource :likes,only:[:create,:destroy]
  end
  get "search", to: "searchs#search"
  get "sort", to: "sorts#sort"
end
