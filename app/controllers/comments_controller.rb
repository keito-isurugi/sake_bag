class CommentsController < ApplicationController

  def create
    @post_review = PostReview.find(params[:post_review_id])
    @comment = @post_review.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    # render "post_reviews/show"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    # render "post_reviews/show"
    redirect_back(fallback_location: root_path)
  end
  
  private
  def comment_params 
    params.require(:comment).permit(:content, :post_review_id, :user_id)
  end
end
