class SchoolsController < ApplicationController

    def show
        @school = School.find(params[:id])
    end

    def new
        @school = School.new
    end

    def create
        @school = School.new(school_params)

        if @school.save
            SignupSchool.confirm_email(@school).deliver
            redirect_to @school, notice: 'Parabéns! Agora, é necessário confirmar o cadastro. Acesse seu email e confirme!'
        else
            render action: :new
        end
    end

    def edit
        @school = School.find(params[:id])
    end

    def update
        @school = School.find(params[:id])

        if @school.update(school_params)
            redirect_to @school, notice: 'Perfil da escola editado com sucesso!'
        else
            render action: :edit
        end
    end

    private

    def school_params
        params.require(:school).permit(:name, :email, :mec_code, :phone, :password, :password_confirmation)
    end

end
