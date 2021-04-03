class CreatePostReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :post_reviews do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_reviews, [:user_id, :created_at]
  end
end
