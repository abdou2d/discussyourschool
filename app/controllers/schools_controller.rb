class SchoolsController < ApplicationController

    before_action :require_authentication_school, only: [:edit, :update]
    before_action :require_no_authentication_school, only: [:new, :create]

    def show
        @school = School.friendly.find(params[:id])
    end

    def new
        @school = School.new
    end

    def create
        @school = School.new(school_params)

        if @school.save
            SignupSchool.confirm_email(@school).deliver
            redirect_to root_path, notice: t('flash.notice.check_email_signup')
        else
            render action: :new
        end
    end

    def edit
        @school = School.friendly.find(params[:id])
    end

    def update
        @school = School.friendly.find(params[:id])

        if @school.update(school_params)
            redirect_to @school, notice: t('flash.notice.school_edited_succesfully')
        else
            render action: :edit
        end
    end

    private

    def school_params
        params.require(:school).permit(:name, :email, :mec_code, :phone, :password, :password_confirmation)
    end

<<<<<<< HEAD
=======
    def can_see_show
        unless school_signed_in? && current_school == school
            redirect_to root_path,alert: t('flash.alert.access_denied')
        end
    end

>>>>>>> d2d9a54cbe1dca2f12c27a0d974e2f6fba2b329b
    def school
        @school ||= School.friendly.find(params[:id])
    end

end
