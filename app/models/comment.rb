class Comment < ActiveRecord::Base
	belongs_to :photo, :user
	validates :body, presence: true
end
