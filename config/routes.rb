Rails.application.routes.draw do

  resources :schools

  resources :students do
      get :autocomplete_school_name, :on => :collection
  end

  resources :posts do
      resources :comments, only: [:create, :destroy]

      get :autocomplete_school_name, :on => :collection
      member do
        put "like", to: "posts#upvote"
      end
  end

  resource :confirmation_school, only: [:show]
  resource :confirmation_student, only: [:show]

  resource :notify_school, only: [:new, :create]

  resource :school_sessions, only: [:create, :new, :destroy]
  resource :student_sessions, only: [:create, :new, :destroy]

  root 'home#index'
end
