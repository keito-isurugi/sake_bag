class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  

  def index  
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @post_reviews = @user.post_reviews.paginate(page: params[:page], per_page: 10)
    if logged_in?
      @post_review = current_user.post_reviews.build
    end
    @sake = Sake.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "ようこそ、SAKE BAGへ！"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "変更内容が保存されました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  def following
    @title = "フォロー中"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def likes
    @user = User.find_by(id: params[:id])
    @like = Like.where(user_id: @user.id)
    @likes = @like.paginate(page: params[:page], per_page: 18)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :image_name, :cover_image_name, :comment,  :password, :password_confirmation)
  end

  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
