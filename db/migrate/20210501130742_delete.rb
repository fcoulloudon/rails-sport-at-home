class Delete < ActiveRecord::Migration[6.1]
  def change
    remove_column :rents, :start_date
    remove_column :rents, :end_date
  end
end
