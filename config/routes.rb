Rails.application.routes.draw do
	devise_for :users
  root to: 'home#top'
  get "/home/about" => "home#about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  	resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy, :index, :new] do
    member do
     get :following, :followers
    end
  end

  post 'create/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'destroy/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
end