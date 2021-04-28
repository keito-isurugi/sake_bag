class PostReview < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  validates :user_id, presence: true
  validates :sake_name, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :sake_image_name, ImageUploader #画像アップロード用
end
