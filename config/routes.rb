Rails.application.routes.draw do

  get 'post_comments/create'
  get 'post_comments/new'
  get 'post_comments/destroy'
  root 'home#top'
  get 'home/about' => 'home#about'



  devise_for :users


  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :post_comments, only: [:new, :create, :destroy, :edit, :update]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index]

  resources :relationships, only: [:create, :destroy]

  resources :home, only: [:top, :about]


end
