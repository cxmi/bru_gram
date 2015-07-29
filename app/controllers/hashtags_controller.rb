# Note the hashtags controller does not acutally work

class HashtagsController < ApplicationController

	def show
		@hashtag = Hashtag.find(params[:id])
	end


end