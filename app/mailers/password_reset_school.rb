class PasswordResetSchool < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

    def password_reset(school)
        @school = school

        mail({
            to: school.email,
            bcc: ['Sign up <signup@discussyourschool.com>'],
            subject: I18n.t('email.reset_password_school.subject')
        })
    end
end
