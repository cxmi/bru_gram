class Hashtag < ActiveRecord::Base

	has_and_belongs_to_many :photos

	def self.parse(caption)
		tags = []
		text.scan(/#\w+/).each do |tag|
			tags << Hashtag.find_or_initialize_by(tag: tag)
		end
		tags
	end
end
