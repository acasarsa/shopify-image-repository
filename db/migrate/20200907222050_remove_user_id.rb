class RemoveUserId < ActiveRecord::Migration[6.0]
  def up
    remove_column :posts, :user_id
  end
  def down
    add_column :posts, :user_id, :integer
  end
end
