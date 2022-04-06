class AddImageName1ToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :image_name1, :string
  end
end
