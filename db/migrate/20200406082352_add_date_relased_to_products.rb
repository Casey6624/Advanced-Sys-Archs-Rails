class AddDateRelasedToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :dateReleased, :date
  end
end
