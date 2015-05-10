class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    delegate :current_student, :student_signed_in?, to: :student_session
    delegate :current_school, :school_signed_in?, to: :school_session

    helper_method :current_student, :student_signed_in?
    helper_method :current_school, :school_signed_in?

    before_action do
    	I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
    	{ locale: I18n.locale }
    end

	def student_session
		StudentSession.new(session)
	end

	def school_session
		SchoolSession.new(session)
	end

	def require_authentication_student
		unless student_signed_in?
			redirect_to root_path, alert: t('flash.alert.student_must_be_logged')
		end
	end

	def require_authentication_school
		unless school_signed_in?
			redirect_to root_path, alert: t('flash.alert.school_must_be_logged')
		end
	end

	def require_no_authentication_student
		if student_signed_in?
			redirect_to root_path, alert: t('flash.alert.already_logged_student')
		end
	end

	def require_no_authentication_school
		if school_signed_in?
			redirect_to root_path, alert: t('flash.alert.already_logged_school')
		end
	end
end
