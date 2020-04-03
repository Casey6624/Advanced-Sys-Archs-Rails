class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :profileID
      t.integer :userID
      t.string :fullName
      t.string :DoB
      t.string :address
      t.string :city
      t.string :country
      t.string :profileImage

      t.timestamps
    end
  end
end
