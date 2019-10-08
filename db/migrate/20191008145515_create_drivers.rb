class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.references :vehicle_id
      t.string :cities

      t.timestamps
    end
  end
end
