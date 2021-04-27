class AddUserRefToEquipments < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment, :user, null: false, foreign_key: true
  end
end
