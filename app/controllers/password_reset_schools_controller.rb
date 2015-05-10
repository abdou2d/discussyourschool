class PasswordResetSchoolsController < ApplicationController

    def new
    end

    def create
        school = School.find_by(email: params[:email])
        school.send_password_reset if school

        redirect_to root_url, :notice => "Email sent with password reset instructions."
    end

    def edit
        @school = School.find_by(password_reset_token: params[:id])
    end

    def update
        @school = School.find_by(password_reset_token: params[:id])

        if @school.password_reset_sent_at < 3.hours.ago
            redirect_to new_password_reset_path, :alert => "Password reset has expired."
        elsif @school.update(password_reset_school_params)
            redirect_to root_url, :notice => "Password has been reset!"
        else
            render :edit
        end
    end

    def password_reset_school_params
		params.require(:school).permit(:password, :password_confirmation)
	end

end
