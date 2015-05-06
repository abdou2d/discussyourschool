class StudentSession
    include ActiveModel::Model

    attr_accessor :email, :password

    validates_presence_of :email, :password

    def initialize(session, attributes={})
        @session = session
        @email = attributes[:email]
        @password = attributes[:password]
    end

    def authenticate!
        student = Student.authenticate(@email, @password)

        if student.present?
            store(student)
        else
            errors.add(:base, "Email ou senha inválidos!")
        end
    end

    def store(student)
        @session[:student_id] = student.id
    end

    def current_user
        User.find(@session[:user_id])        
    end

    def user_signed_in?
        @session[:user_id].present?
    end

    def destroy
        @session[:user_id] = nil
    end

end
