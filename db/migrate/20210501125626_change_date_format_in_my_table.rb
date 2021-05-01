class ChangeDateFormatInMyTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :rents, :start_date
    remove_column :rents, :end_date
    add_column :rents, :start_date, :integer
    add_column :rents, :end_date, :integer
  end
end
