class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :fullName
      t.string :DoB
      t.text :address
      t.string :city
      t.string :country
      t.binary :profileImage

      t.timestamps
    end
  end
end
