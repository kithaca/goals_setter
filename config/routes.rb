Rails.application.routes.draw do

  resources :users do
    resources :goals, only: :index
  end

  resources :goals, except: :index

  resource :session
end
