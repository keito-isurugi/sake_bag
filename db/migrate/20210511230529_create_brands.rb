class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :sake_name
      t.string :sake_image
      t.string :sake_type
      t.string :sake_maker
      t.string :sake_price

      t.timestamps
    end
    add_index :brands, :sake_name  
  end
end
