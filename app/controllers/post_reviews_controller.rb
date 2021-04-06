class PostReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def post_review_form
    @post_review = current_user.post_reviews.build if logged_in?
  end

  def create
    @post_review = current_user.post_reviews.build(post_review_params)
    if @post_review.save
      flash[:success] = "レビューを投稿しました！"
      redirect_to user_url(current_user.id)
    else
      render 'post_reviews/post_review_form'
    end
  end

  def destroy  
  end

  private

  def post_review_params
    params.require(:post_review).permit(:sake_type, :sake_image_name, :sake_maker, :sake_name, :sake_price, :sake_amoutn, :sake_rate, :content, )
  end

end
