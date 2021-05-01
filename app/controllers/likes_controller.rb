class LikesController < ApplicationController


  def create
    @like = current_user.likes.create(post_review_id: params[:post_review_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(post_review_id: params[:post_review_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  


  private

  
end
