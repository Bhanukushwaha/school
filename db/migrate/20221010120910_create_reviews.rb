class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :rating
      t.integer :product_id

      t.timestamps
    end
  end
end
