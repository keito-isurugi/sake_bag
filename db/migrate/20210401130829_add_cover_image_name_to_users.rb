class AddCoverImageNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cover_image_name, :string
  end
end
