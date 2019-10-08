class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :capacity
      t.string :load_type
      t.references :driver_id
      t.boolean :owner

      t.timestamps
    end
  end
end
