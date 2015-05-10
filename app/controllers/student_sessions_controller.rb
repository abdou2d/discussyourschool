class StudentSessionsController < ApplicationController

    before_action :require_no_authentication_student, only: [:new, :create]
    before_action :require_authentication_student, only: [:destroy]

    def new
        @student_session = StudentSession.new(session)
    end

    def create
        @student_session = StudentSession.new(session, params[:student_session])

        if @student_session.authenticate!
            redirect_to root_path, notice: t('flash.notice.login_was_made')
        else
            render :new
        end
    end

    def destroy
        student_session.destroy
        redirect_to root_path, notice: t('flash.notice.logout_was_made')
    end

end
