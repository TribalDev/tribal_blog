class RemoveNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :comments, :name, :string
  end
end
