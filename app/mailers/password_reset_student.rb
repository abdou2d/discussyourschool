class PasswordResetStudent < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

    def password_reset(student)
        @student = student

        mail({
            to: student.email,
            bcc: ['Sign up <signup@discussyourschool.com>'],
            subject: "Reset password"
        })
    end
end
