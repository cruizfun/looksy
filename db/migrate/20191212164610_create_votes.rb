class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :bestoutfit_id

      t.timestamps
    end
  end
end
