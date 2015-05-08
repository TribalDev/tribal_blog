class ChangeCategoryTitleToTopic < ActiveRecord::Migration
  def change
    rename_column :categories, :title, :topic
  end
end
