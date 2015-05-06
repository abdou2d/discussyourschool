class School < ActiveRecord::Base

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    scope :confirmed, -> { where.not(confirmed_at: nil) }

    validates_presence_of :name, :email, :mec_code, :phone

    validates_uniqueness_of :name, :mec_code, :email

    validates_length_of :name, minimum: 10

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: { on: :create }, length: { minimum: 6, allow_blank: true }

    has_secure_password

    def self.is_valid?(school_name)
        school = confirmed.find_by(name: school_name)

        if school.present?
            true
        else
            false
        end
    end

    before_create do |school|
        school.confirmation_token = SecureRandom.urlsafe_base64
    end

    def confirm!
        return if confirmed?

        self.confirmed_at = Time.current
        self.confirmation_token = ''

        save!
    end

    def confirmed?
        confirmed_at.present?
    end

    def self.is_school_valid?(school_name)
        school = School.find_by(name: school_name)

        if school.present?
            true
        else
            false
        end
    end

    def self.authenticate(email, password)
        school = confirmed.find_by(email: email)

        if school.present?
            school.authenticate(password)
        end
    end

end
