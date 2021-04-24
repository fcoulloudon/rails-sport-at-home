class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :title
      t.string :description
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
