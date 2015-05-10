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
            redirect_to @school, notice: 'Parabéns! Agora, é necessário confirmar o cadastro. Acesse seu email e confirme!'
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
            redirect_to @school, alert: 'Perfil da escola editado com sucesso!'
        else
            render action: :edit
        end
    end

    private

    def school_params
        params.require(:school).permit(:name, :email, :mec_code, :phone, :password, :password_confirmation)
    end

    def school
        @school ||= School.friendly.find(params[:id])
    end

end
