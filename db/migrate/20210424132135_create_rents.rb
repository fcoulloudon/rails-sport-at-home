class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.integer :equipment_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
