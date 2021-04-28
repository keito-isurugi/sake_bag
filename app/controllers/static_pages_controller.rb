class StaticPagesController < ApplicationController

  def home
    @index_post_reviews = PostReview.paginate(page: params[:page])
    @users = User.all
  end

  def help
  end

  def about
  end

  def contact
  end

  def terms_of_service
  end

  def privacy_policy
  end
end
