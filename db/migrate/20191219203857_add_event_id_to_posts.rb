class AddEventIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :event_id, :integer
  end
end
