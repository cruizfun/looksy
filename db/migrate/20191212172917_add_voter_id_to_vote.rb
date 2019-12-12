class AddVoterIdToVote < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :voter_id, :integer
  end
end
