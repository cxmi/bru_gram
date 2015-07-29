class Photo < ActiveRecord::Base
	has_many :comments 
	validates :image, :caption, :public, presence: true
	belongs_to :user
	
end
