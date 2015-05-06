Rails.application.routes.draw do

  resources :schools

  resources :students do
      get :autocomplete_school_name, :on => :collection
  end

  resource :confirmation_school, only: [:show]
  resource :confirmation_student, only: [:show]
  resource :notify_school, only: [:new, :create]

  root 'home#index'
end
