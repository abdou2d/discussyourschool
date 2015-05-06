class StudentsController < ApplicationController

    def show
        @student = Student.find(params[:id])
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
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])

        if @student.update(student_params)
            redirect_to @school, notice: 'Perfil editado com sucesso!'
        else
            render action: :edit
        end
    end

    private

    def student_params
        params.require(:student).permit(:school_name, :name, :birthday, :grade, :email, :password, :password_confirmation)
    end

end
