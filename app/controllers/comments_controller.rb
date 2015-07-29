class CommentsController < ApplicationController

def create
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.create(comment_params)
	redirect_to photo_path(@photo)
end

def edit
	@photo = Photo.find(params[:photo_id])
	@comment = @photo.comments.find(params[:id])
end

def update
	@photo = Photo.find(params[:photo_id]
	@comment = @photo.comment.find(params[:id])

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