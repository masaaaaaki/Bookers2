Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => 'home#about'



  devise_for :users



  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index]

  resources :home, only: [:top, :about]

end
