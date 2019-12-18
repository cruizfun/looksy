class AddHeadshotIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :headshot_id, :integer
  end
end
