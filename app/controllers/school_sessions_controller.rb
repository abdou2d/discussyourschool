class SchoolSessionsController < ApplicationController

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
    end

end
