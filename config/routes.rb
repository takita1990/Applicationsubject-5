Rails.application.routes.draw do
	devise_for :users
  root to: 'home#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :destroy, :index, :new]

 get "/home/about" => "home#about"
end