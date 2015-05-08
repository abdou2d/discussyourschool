class StudentsController < ApplicationController
    autocomplete :school, :name, :full => true

    before_action :can_change, only: [:edit, :update]
    before_action :require_no_authentication_student, only: [:new, :create]

    def show
        @student = Student.friendly.find(params[:id])

        @posts_owner = @student.posts
        @posts_visitor = @student.posts.where.not(anonymous: '1')
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)

        if @student.save
            SignupStudent.confirm_email(@student).deliver
            redirect_to @student, notice: "Parabéns! Agora, é necessário confirmar o cadastro. Acesse seu email e confirme!"
        else
            render action: :new
        end
    end

    def edit
        @student = Student.friendly.find(params[:id])
    end

    def update
        @student = Student.friendly.find(params[:id])

        if @student.update(student_params)
            redirect_to @student, notice: 'Perfil editado com sucesso!'
        else
            render action: :edit
        end
    end

    private

    def student
        @student ||= Student.friendly.find(params[:id])
    end

    def can_change
        unless student_signed_in? && current_student = student
            redirect_to student_path(params[:id])
        end
    end

    def student_params
        params.require(:student).permit(:school_name, :name, :birthday, :grade, :email, :password, :password_confirmation)
    end

end
