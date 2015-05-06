Rails.application.routes.draw do

  resources :schools
  resources :students

  resource :confirmation_school, only: [:show]
  resource :confirmation_student, only: [:show]

  root 'home#index'
end
