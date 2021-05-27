class AddpostReviewIdToBrand < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :post_review_id, :integer
  end
end
