class Sake < ApplicationRecord
  has_many :post_reviews, dependent: :destroy
  accepts_nested_attributes_for :post_reviews
  validates :sake_name, presence: true, length: { maximum: 30 }
  mount_uploader :sake_image, ImageUploader #画像アップロード用
end
