class Datetime < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :start_date, :datetime
    add_column :rents, :end_date, :datetime
  end
end
