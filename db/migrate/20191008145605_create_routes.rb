class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.datetime, :starts_at
      t.datetime, :ends_at
      t.string, :load_type
      t.integer, :load_sum
      t.array, :cities
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
