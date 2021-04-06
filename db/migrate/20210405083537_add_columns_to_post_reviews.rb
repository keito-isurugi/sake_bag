class AddColumnsToPostReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :post_reviews, :sake_image_name, :string
    add_column :post_reviews, :sake_type, :string
    add_column :post_reviews, :sake_maker, :string
    add_column :post_reviews, :sake_name, :string
    add_column :post_reviews, :sake_price, :string
    add_column :post_reviews, :sake_rate, :float
    add_column :post_reviews, :sake_amount, :string
  end
end
