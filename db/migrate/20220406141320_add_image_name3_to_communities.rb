class AddImageName3ToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :image_name3, :string
  end
end
