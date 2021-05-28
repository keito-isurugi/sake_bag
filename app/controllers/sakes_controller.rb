class SakesController < ApplicationController

  def new
    @sake = Sake.new
    @sake.post_reviews.build
    @post_review = PostReview.new
    @user = User.new
  end
  
  def create 
    @sake = Sake.new(sake_params)
    @post_review = PostReview.new
    @user = current_user
    @post_review.user_id = @user.id
    @post_review.save
    if @sake.save
      flash[:success] = 'お酒を登録しました！'
      redirect_to user_url(current_user.id)
    else
      render 'new'
    end
  end
  
  def show
    @sake = Sake.find(params[:id])
    @post_reviews = @sake.post_reviews
  end
  
  def index
    @index_sakes = Sake.paginate(page: params[:page], per_page: 18)
    @post_review = PostReview.new
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy 
  end
  
  def search
    if params[:sake_name].present?
      @sakes = Sake.where('sake_name LIKE ?', "%#{params[:sake_name]}%")
    else
      @sakes = Sake.none
    end
  end
  
  def postreview
    @sake = Sake.find(params[:id])
  end

  private

  def sake_params
    params.require(:sake).permit(:sake_type, :sake_maker, :sake_name, :sake_price, :sake_image,  post_reviews_attributes: [:id, :sake_rate, :sake_image_name, :content, :sake_id, :user_id])
  end

  
end
