class AddDateRelasedToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :dateReleased, :date
  end
end
