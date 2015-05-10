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
            errors.add(:base, :invalid_login)
            false
        end
    end

    def store(student)
        @session[:student_id] = student.id
    end

    def current_student
        Student.find(@session[:student_id])        
    end

    def student_signed_in?
        @session[:student_id].present?
    end

    def destroy
        @session[:student_id] = nil
    end

end
