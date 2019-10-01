class AddImageNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_name, :string
  end
end
