class Student < ActiveRecord::Base

    extend FriendlyId

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    acts_as_voter

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_BIRTHDAY_REGEX = /[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}/

    scope :confirmed, -> { where.not(confirmed_at: nil) }

    validates_presence_of :school_name, :name, :birthday, :email, :slug
    validates_uniqueness_of :name, :email

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :birthday, presence: true, format: { with: VALID_BIRTHDAY_REGEX }
    validates :password, presence: { on: :create }, length: { minimum: 6, allow_blank: true }

    validate :valid_date?

    friendly_id :name, use: [:slugged]

    has_secure_password

    def valid_date?
		if self.birthday
			begin
				Date.parse(self.birthday)
			rescue
				errors.add(:birthday, "Insira uma data correta")
			end
		end
	end

    before_create do |student|
        student.confirmation_token = SecureRandom.urlsafe_base64
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

    def self.authenticate(email, password)
        student = confirmed.find_by(email: email)

        if student.present?
            student.authenticate(password)
        end
    end

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!

        PasswordResetStudent.password_reset(self).deliver
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while Student.exists?(column => self[column])
    end

end
