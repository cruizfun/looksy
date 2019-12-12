class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :bra_size
      t.integer :top_size
      t.integer :dress_size
      t.integer :pant_size
      t.integer :headshot_id
      t.integer :shoe_size

      t.timestamps
    end
  end
end
