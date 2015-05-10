class NotifySchoolsController < ApplicationController
    def new
    end

    def create
        school = School.find_by(email: params[:email])
        email_school = params[:email]

        if school.present?
            redirect_to new_notify_school_path, notice: t('flash.alert.school_already_registered')
        else
            NotifySchool.send_notification_to_school(email_school).deliver
            redirect_to new_notify_school_path, notice: t('flash.notice.email_notification_school_sent')
        end
    end
end
