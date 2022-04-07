class AddCreatedByToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :created_by, :string
  end
end
