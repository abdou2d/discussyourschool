class Post < ActiveRecord::Base
	belongs_to :student

	acts_as_votable

	validates_presence_of :title, :content, :school_name
	validates_presence_of :anonymous, :allow_blank => true
	
end
