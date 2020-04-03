class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :userID
      t.string :username
      t.string :password
      t.binary :userType

      t.timestamps
    end
  end
end
