class AddResolvedToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :resolved, :boolean
  end
end
