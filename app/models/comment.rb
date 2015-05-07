class Comment < ActiveRecord::Base
    belongs_to :student
    belongs_to :school
    belongs_to :post

    validates_presence_of :content

    acts_as_votable
end
