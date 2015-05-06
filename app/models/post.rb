class Post < ActiveRecord::Base
	belongs_to :student
	validates_presence_of :title, :content, :school_name
end
