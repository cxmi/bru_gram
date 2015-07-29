class PhotosController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

def index
	@photos = Photo.all.order(created_at: :desc)
end

def show
	@photo = Photo.find(params[:id])
end

def new
	@photo = Photo.new
end

def create
	@photo = current_user.photos.build(photo_params)

	# @photo.caption.scan(/#\w+/).each do |tag|
	# 	@photo.hashtags << Hashtag.find_or_initialize_by(tag: tag)
	# end

	#can go to rails c and check Hashtag.all

	@photo.hashtags = Hashtag.parse(@photo.caption) 
	# <--- can just leave this one in def create for photos controller
	# we havent defined parse yet, we can create that method

	# inside of hashtag.rb:

	# def self.parse(caption)
	# 	tags = []
	# 	text.scan(/#\w+/).each do |tag|
	# 		tags << Hashtag.find_or_initialize_by(tag: tag)
	# 	end
	# 	tags
	# end
	# -----


	if @photo.save
		redirect_to photo_path(@photo)
	else
		render :new
	end
end

def edit
	@photo = Photo.find(params[:id])

	verify_can_edit_animal

end

def update
	@photo = Photo.find(params[:id])

	verify_can_edit_animal
end

def destroy
	verify_can_edit_photo
	@photo = Photo.find(params[:id])
		@photo.destroy

		redirect_to photos_path
end


private 

def photo_params
	params require(:photo).permit(:caption, :public, :image)
end

def verify_can_edit_photo 
	if @photo.user != current_user && !current_user.admin?
	redirect_to photos_path, alert: "You don’t have access to that."
	end
end


end 