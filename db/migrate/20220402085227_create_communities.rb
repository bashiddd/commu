class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :area
      t.string :genre

      t.timestamps
    end
  end
end
