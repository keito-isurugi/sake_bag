class AddbrandIdToPostReview < ActiveRecord::Migration[6.1]
  def change
    add_column :post_reviews, :brand_id, :integer
  end
end
