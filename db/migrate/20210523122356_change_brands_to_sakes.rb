class ChangeBrandsToSakes < ActiveRecord::Migration[6.1]
  def change
    rename_table :brands, :sakes
  end
end
