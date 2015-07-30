module AuthorizationHelper
	def can_edit_photo?(photo)
		photo.user == current_user
	end


	def can_edit_comment?(comment)
		comment.user == current_user
	end

	def photo_with_hashtag_links(photo)
		photo.caption.gsub(/#\w+/) do |tag|
			link_to tag, hashtag_path(Hashtag.find_by(tag: tag))
		end.html_safe
	end

# 	in index html:
# 	<% @hashtag.photos.each do |photo| %>
# 	<%= photo_with_hashtag_links(photo) %><br>
# <% end %>

end
