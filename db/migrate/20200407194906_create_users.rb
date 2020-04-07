class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :profiles, :user
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :userType

      t.timestamps
    end
    add_reference :profiles, :user, null: false, foreign_key: true
  end
end
