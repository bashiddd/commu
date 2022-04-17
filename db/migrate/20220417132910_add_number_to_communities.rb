class AddNumberToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :number, :integer
  end
end
