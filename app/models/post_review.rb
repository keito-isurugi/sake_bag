class PostReview < ApplicationRecord
  belongs_to :user
  belongs_to :sake, optional: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :sake_image_name, ImageUploader #画像アップロード用

  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end

end
