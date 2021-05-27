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
      render 'new'
    end
  end

  def show 
    @post_review = PostReview.find(params[:id])
    @user = @post_review.user
    @sake = @post_review.sake
    @like = Like.new
    @comment = Comment.new
    @comments = @post_review.comments.order(created_at: :desc)
    
  end

  def index
    @index_post_reviews = PostReview.paginate(page: params[:page], per_page: 18)
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
    params.require(:post_review).permit(:sake_type, :sake_image_name, :sake_maker, :sake_name, :sake_price, :sake_amoutn, :sake_rate, :content, :sake_id )
  end

end
