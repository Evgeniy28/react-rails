Rails.application.routes.draw do
  resources :lifts
  root to: 'lifts#index'
end
