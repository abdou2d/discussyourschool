class PasswordResetSchoolsController < ApplicationController

    def new
    end

    def create
        school = School.find_by(email: params[:email])
        school.send_password_reset if school

        redirect_to root_url, :notice => t('flash.notice.reset_password_email_sent')
    end

    def edit
        @school = School.find_by(password_reset_token: params[:id])
    end

    def update
        @school = School.find_by(password_reset_token: params[:id])

        if @school.password_reset_sent_at < 3.hours.ago
            redirect_to new_password_reset_path, :alert => t('flash.alert.reset_password_expired')
        elsif @school.update(password_reset_school_params)
            redirect_to root_url, :notice => t('flash.notice.password_was_reseted')
        else
            render :edit
        end
    end

    def password_reset_school_params
		params.require(:school).permit(:password, :password_confirmation)
	end

end
