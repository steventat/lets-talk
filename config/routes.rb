Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  get 'sessions/create'
  get 'sessions/new'
  get 'sessions/destroy'
  get 'passwords/create'
  get 'passwords/new'
  resources :passwords, controller: 'passwords', only: [:create, :new]
  resource :session, controller: 'sessions', only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tokens, only: [:create]
  root to: 'chats#show'
end
