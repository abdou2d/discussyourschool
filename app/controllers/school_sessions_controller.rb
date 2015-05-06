class SchoolSessionsController < ApplicationController

    before_action :require_no_authentication_school, only: [:new, :create]
    before_action :require_authentication_school, only: [:destroy]

    def new
        @school_session = SchoolSession.new(session)
    end

    def create
        @school_session = SchoolSession.new(session, params[:school_session])

        if @school_session.authenticate!
            redirect_to root_path, notice: "Login feito!"
        else
            render :new
        end
    end

    def destroy
        school_session.destroy
        redirect_to root_path, notice: "Logout feito com sucesso!"
    end

end
