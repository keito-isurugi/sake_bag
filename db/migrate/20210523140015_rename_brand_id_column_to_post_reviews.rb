class RenameBrandIdColumnToPostReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_reviews, :brand_id, :sake_id
  end
end
