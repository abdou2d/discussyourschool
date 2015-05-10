class PasswordResetSchool < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

    def password_reset(school)
        @school = school

        mail({
            to: school.email,
            bcc: ['Sign up <signup@discussyourschool.com>'],
            subject: "Reset password"
        })
    end
end
