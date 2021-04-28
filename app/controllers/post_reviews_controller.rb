class PostReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @post_review = current_user.post_reviews.build if logged_in?
  end

  def create
    @post_review = current_user.post_reviews.build(post_review_params)
    if @post_review.save
      flash[:success] = "レビューを投稿しました！"
      redirect_to user_url(current_user.id)
    else
      render 'post_reviews/new'
    end
  end

  def show 
    @post_review = PostReview.find(params[:id])
    @user = @post_review.user
  end

  def index
  end

  def edit
    @post_review = PostReview.find(params[:id])
  end

  def update
    @post_review = PostReview.find(params[:id])
    if @post_review.update(post_review_params)
      flash[:success] = "変更内容が保存されました"
      redirect_to @post_review
    else
      render 'edit'
    end
  end

  def destroy  
    PostReview.find(params[:id]).destroy
    flash[:success] = "レビューを削除しました"
    redirect_to user_url(current_user.id)
  end

  private

  def post_review_params
    params.require(:post_review).permit(:sake_type, :sake_image_name, :sake_maker, :sake_name, :sake_price, :sake_amoutn, :sake_rate, :content, )
  end

end
