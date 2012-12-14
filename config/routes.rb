Alpha::Application.routes.draw do
  get "misc/index"

  root to: "misc#index"

  resources :users, only: [:new, :create]

  resource :sessions
end