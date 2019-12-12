class RemoveUserIdFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :user_id
  end
end
