class Comment < ActiveRecord::Base
	belongs_to :photo
	validates :body, presence: true
end