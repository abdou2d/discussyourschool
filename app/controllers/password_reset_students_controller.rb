class PasswordResetStudentsController < ApplicationController

    def new
    end

    def create
        student = Student.find_by(email: params[:email])
        student.send_password_reset if student

        redirect_to root_url, :notice => "Email sent with password reset instructions."
    end

    def edit
        @student = Student.find_by(password_reset_token: params[:id])
    end

    def update
        @student = Student.find_by(password_reset_token: params[:id])

        if @student.password_reset_sent_at < 3.hours.ago
            redirect_to new_password_reset_path, :alert => "Password reset has expired."
        elsif @student.update(password_reset_student_params)
            redirect_to root_url, :notice => "Password has been reset!"
        else
            render :edit
        end
    end

    def password_reset_student_params
		params.require(:student).permit(:password, :password_confirmation)
	end

end
