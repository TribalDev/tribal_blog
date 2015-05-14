class AddPostToImages < ActiveRecord::Migration
  def change
    add_column :images, :post_id, :integer
    add_index :images, :post_id
  end
end
