class AddOverviewToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :overview, :text
  end
end
