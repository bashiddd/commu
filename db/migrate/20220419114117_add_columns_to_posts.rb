class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :commu_id, :integer
    add_column :posts, :user_id, :integer
  end
end
