Rails.application.routes.draw do

  resources :users do
    resources :goals, only: [:index, :new]
  end

  resources :goals, except: [:index, :new]

  resource :session
end
