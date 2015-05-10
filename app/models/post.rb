class Post < ActiveRecord::Base

	extend FriendlyId

	has_many :comments, dependent: :destroy

	belongs_to :student, :counter_cache => true

	acts_as_votable

	validates_presence_of :title, :content, :school_name, :slug
	validates_presence_of :anonymous, :allow_blank => true

	friendly_id :title, use: [:slugged, :history]

end
