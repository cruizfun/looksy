class RemoverHeadshotIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :headshot_id
  end
end
