class SignupSchool < ActionMailer::Base

    default from: 'no-reply@discussyourschool.com'

    def confirm_email(school)
        @school = school

        @confirmation_link = confirmation_school_url({
            token: @school.confirmation_token
        })

        mail({
            to: school.email,
            bcc: ['Sign up <signup@discussyourschool.com>'],
            subject: I18n.t('email.confirm_signup_school.subject')
        })
    end

end
