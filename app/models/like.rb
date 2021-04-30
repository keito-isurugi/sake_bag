class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post_review

  validates_uniqueness_of :post_review_id, scope: :user_id
end
