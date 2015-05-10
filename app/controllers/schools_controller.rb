class SchoolsController < ApplicationController

    before_action :require_authentication_school, only: [:edit, :update]
    before_action :require_no_authentication_school, only: [:new, :create]

    def show
        @school = School.friendly.find(params[:id])

        @students = Student.where(school_name: @school.name)

        @students_problems = Student.where(school_name: @school.name).order("posts_count DESC").limit(5)
        @students_comments = Student.where(school_name: @school.name).order("comments_count DESC").limit(5)
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

    def like
		@school = School.find(params[:id])
		@school.liked_by current_student
  		redirect_to @school
	end

	def unlike
  		@school = School.find(params[:id])
  		@school.unliked_by current_student

  		redirect_to @school
	end

    def dislike
        @school = School.find(params[:id])
        @school.disliked_by current_student
        redirect_to @school
    end

    def undislike
        @school = School.find(params[:id])
        @school.undisliked_by current_student

        redirect_to @school
    end

    private

    def school_params
        params.require(:school).permit(:name, :email, :mec_code, :phone, :password, :password_confirmation)
    end

    def school
        @school ||= School.friendly.find(params[:id])
    end

end
