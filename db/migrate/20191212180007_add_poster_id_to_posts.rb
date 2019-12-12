class AddPosterIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :poster_id, :integer
  end
end
