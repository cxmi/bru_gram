class CommentsController < ApplicationController
	before_action :authenticate_user!

def new
	@comment = Comment.new
end 

def create
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.create(comment_params)
	@comment.user = current_user

	if @comment.save
	redirect_to photo_path(@photo)
	else
		render :new
	end
end

def edit
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.find(params[:id])
end

def update
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.find(params[:id])

	if @comment.update(comment_params)
		redirect_to photo_path(@photo)
	else
		render :edit
	end

end

def destroy
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.find(params[:id])
	@comment.destroy
	redirect_to photo_path(@photo)
end




def comment_params
	params.require(:comment).permit(:body)
end

end 