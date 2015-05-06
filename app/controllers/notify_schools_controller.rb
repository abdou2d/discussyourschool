class NotifySchoolsController < ApplicationController
    def new
    end

    def create
        school = School.find_by(email: params[:email])
        email_school = params[:email]

        if school.present?
            redirect_to new_notify_school_path, notice: "Escola já cadastrada! :D"
        else
            NotifySchool.send_notification_to_school(email_school).deliver
            redirect_to new_notify_school_path, notice: "Email enviado xD"
        end
    end
end
