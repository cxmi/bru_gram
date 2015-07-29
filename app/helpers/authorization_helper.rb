module AuthorizationHelper
	def can_edit_photo?(photo)
		photo.user == current_user
	end


	def can_edit_comment?(comment)
		comment.user == current_user
	end

end
