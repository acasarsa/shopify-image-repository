class DropSessionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :sessions do |t|
    end
  end
end
