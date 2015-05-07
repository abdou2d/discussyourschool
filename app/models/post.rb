class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	belongs_to :student

	acts_as_votable

	validates_presence_of :title, :content, :school_name
	validates_presence_of :anonymous, :allow_blank => true

end
