class PostReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def post_review_form
  end

  def create
    @post_review = current_user.post_reviews.build(post_reviews_params)
    if @post_reviews.save
      flash[:success] = "レビューを投稿しました！"
      redirect_to  root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy  
  end

  private

  def post_reviews_params
    params.require(:post_review).permit(:content)
  end

end
