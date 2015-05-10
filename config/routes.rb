Rails.application.routes.draw do

    scope "(:locale)", locale: /en|pt/ do
        get 'password_resets/new'

        resources :schools do
            member do
                put "like", to: "schools#like"
                put "unlike", to: "schools#unlike"
                put "dislike", to: "schools#dislike"
                put "undislike", to: "schools#undislike"
            end
        end

        resources :password_reset_students
        resources :password_reset_schools

        resources :students do
            get :autocomplete_school_name, :on => :collection
        end

        resources :posts do
            resources :comments, only: [:create, :destroy] do
                member do
                    put "like", to: "comments#like"
                    put "unlike", to: "comments#unlike"
                end
            end

            member do
                put "like", to: "posts#like"
                put "unlike", to: "posts#unlike"
            end

            member do
                put :close
            end

            member do
                put :reopen
            end

            get :autocomplete_school_name, :on => :collection
        end

        resource :confirmation_school, only: [:show]
        resource :confirmation_student, only: [:show]

        resource :notify_school, only: [:new, :create]

        resource :school_sessions, only: [:create, :new, :destroy]
        resource :student_sessions, only: [:create, :new, :destroy]
    end

    get '/:locale' => 'home#index', locale: /en|pt/
    root 'home#index'
end
