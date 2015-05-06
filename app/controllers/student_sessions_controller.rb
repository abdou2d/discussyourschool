class StudentSessionsController < ApplicationController

    def new
        @student_session = StudentSession.new(session)
    end

    def create
        @student_session = StudentSession.new(session, params[:student_session])

        if @student_session.authenticate!
            redirect_to root_path, notice: "Login feito!"
        else
            render :new
        end
    end

    def destroy
    end

end
