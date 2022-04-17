class AddColumnsToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :age_gender, :text
    add_column :communities, :place, :text
    add_column :communities, :rule, :text
  end
end
