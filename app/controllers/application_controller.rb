class ApplicationController < ActionController::Base

  	delegate :current_student, :student_signed_in?, to: :student_session
  	delegate :current_school, :school_signed_in?, to: :school_session

    helper_method :current_student, :current_school, :student_signed_in?, :school_signed_in?

    protect_from_forgery with: :exception


	def student_session
		StudentSession.new(session)
	end

	def school_session
		SchoolSession.new(session)
	end

	def require_authentication_student
		unless student_signed_in?
			redirect_to root_path, notice: "Precisa estar logado como estudante!"
		end
	end

	def require_authentication_school
		unless school_signed_in?
			redirect_to root_path, notice: "Precisa estar logado como escola!"
		end
	end

	def require_no_authentication_student
		if student_signed_in?
			redirect_to root_path, notice: "Já se encontra logado como estudante!"
		end
	end

	def require_no_authentication_school
		if school_signed_in?
			redirect_to root_path, notice: "Já se encontra logado como escola!"
		end
	end
end
