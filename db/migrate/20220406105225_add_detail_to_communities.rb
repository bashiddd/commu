class AddDetailToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :detail, :text
  end
end
