class ConfirmationStudentsController < ApplicationController
    def show
        student = Student.find_by(confirmation_token: params[:token])

        if student.present?
            student.confirm!

            redirect_to student, notice: "Cadastro confirmado com sucesso! Bora mudar sua escola?"
        else
            redirect_to root_path
        end
    end
end
