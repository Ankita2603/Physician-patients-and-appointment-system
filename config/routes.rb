Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'physicians/:id/appointment', to: 'physicians#appointment', as: 'physicians_appointments'
  root 'sessions#new'
  resources :patients do 
    resources :appointments
  end
  resources :physicians
end
