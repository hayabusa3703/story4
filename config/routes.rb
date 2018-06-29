Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :storys do
    resources :comments, only: [:create]
    resources :new, only: [:index, :new]
    member do
      delete :destroy
      patch :update
    end
  end
  resources :categorys , only: [:index, :show] do
    member do
      get :newest
    end
  end

  resources :storys, only: [:edit, :update, :new, :create]
  resources :latest, only: [:index, :show]
  resources :legend, only: [:index, :show]
  resources :likes,  only: [:create, :destroy]
  resources :users,  only: [:show]
end
