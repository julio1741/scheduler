class AddStopsAmountToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :stops_amount, :integer
  end
end
