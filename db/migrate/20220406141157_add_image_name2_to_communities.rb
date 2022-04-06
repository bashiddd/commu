class AddImageName2ToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :image_name2, :string
  end
end
