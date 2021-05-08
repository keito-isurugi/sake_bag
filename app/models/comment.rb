class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_review
  validates :content, presence: true, length: { maximum: 140 }
end
