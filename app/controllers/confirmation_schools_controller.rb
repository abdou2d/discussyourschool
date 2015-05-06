class ConfirmationSchoolsController < ApplicationController
    def show
        school = School.find_by(confirmation_token: params[:token])

        if school.present?
            school.confirm!

            redirect_to school, notice: "Cadastro confirmado com sucesso! Incentive seus alunos a participarem!"
        else
            redirect_to root_path
        end
    end
end
