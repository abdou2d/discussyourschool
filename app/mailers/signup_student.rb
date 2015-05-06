class SignupStudent < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

    def confirm_email(student)
        @student = student

        @confirmation_link = confirmation_student_url({
            token: @student.confirmation_token
        })

        mail({
            to: student.email,
            bcc: ['Sign up <signup@discussyourschool.com>'],
            subject: "Confirme o seu cadastro"
        })
    end

end
