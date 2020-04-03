class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :productID
      t.string :productName
      t.decimal :averageCost
      t.string :category
      t.string :dateReleased
      t.text :description
      t.string :productImage

      t.timestamps
    end
  end
end
