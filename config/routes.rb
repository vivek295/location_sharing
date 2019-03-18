Rails.application.routes.draw do
  root 'feeds#home'
  
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  resources :users do
    collection do
      get :user_list
    end
  end

  resources :posts
  resources :subscriptions, only: [:create, :destroy]
end
