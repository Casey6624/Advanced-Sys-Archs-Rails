class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :productName
      t.string :brandName
      t.decimal :averageCost
      t.string :category
      t.string :dateReleased
      t.text :description
      t.binary :productImage

      t.timestamps
    end
  end
end
