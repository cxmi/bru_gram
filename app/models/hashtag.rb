class Hashtag < ActiveRecord::Base

	has_and_belongs_to_many :photos

	# def self.parse(caption)

	# 	tags = []
	# 	caption.scan(/#\w+/).each do |tag|
	# 		tags << Hashtag.find_or_initialize_by(tag: tag)
	# 	end
	# 	tags
	# end


		def self.parse(caption)
		caption.scan(/#\w+/).map do |tag|
			tags << Hashtag.find_or_initialize_by(tag: tag)
		end
		
	end

end
