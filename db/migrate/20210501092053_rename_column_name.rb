class RenameColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_type, :user_type
  end
end