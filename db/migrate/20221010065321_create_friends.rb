class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.string :fastname
      t.string :lastname
      t.string :email
      t.string :gender
      t.integer :number

      t.timestamps
    end
  end
end
