class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewID
      t.string :authorName
      t.integer :productRating
      t.text :reviewText
      t.string :dateOfReview

      t.timestamps
    end
  end
end
