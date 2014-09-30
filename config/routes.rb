Rails.application.routes.draw do
  resources :ads do
    patch "done", on: :member
  end
  resources :users

  
  get "login/new", as: :login
  post "login/create"
  delete "login/destroy", as: :logout

  root 'ads#index'
end
