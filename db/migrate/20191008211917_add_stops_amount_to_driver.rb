class AddStopsAmountToDriver < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :stops_amount, :integer
  end
end
