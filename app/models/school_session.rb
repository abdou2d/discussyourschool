class SchoolSession
    include ActiveModel::Model

    attr_accessor :email, :password

    validates_presence_of :email, :password

    def initialize(session, attributes={})
        @session = session
        @email = attributes[:email]
        @password = attributes[:password]
    end

    def authenticate!
        school = School.authenticate(@email, @password)

        if school.present?
            store(school)
        else
            errors.add(:base, :invalid_login)
            false
        end
    end

    def store(school)
        @session[:school_id] = school.id
    end

    def current_school
        School.find(@session[:school_id])        
    end

    def school_signed_in?
        @session[:school_id].present?
    end

    def destroy
        @session[:school_id] = nil
    end

end
