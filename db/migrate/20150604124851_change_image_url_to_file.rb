class ChangeImageUrlToFile < ActiveRecord::Migration
  def change
    rename_column :images, :url, :file
  end
end

