module RoutesHelper

  def resolve_routes
    unresolved_routes = Route.not_resolved

    unresolved_routes.each do |ur|

      range = [ur.starts_at, ur.ends_at]

      available_vehicles = get_available_vehicles(range)
      available_drivers = get_available_drivers(range)

      next if available_vehicles.nil? or available_drivers.nil?
      vehicle = available_vehicles.first
      driver = available_drivers.first

      ur.driver_id = driver.id
      ur.vehicle_id = vehicle.id
      ur.resolved = true
      ur.save
    end

  end

  def get_available_vehicles range
     Vehicle.where.not(id:Route.assigned_range(range).pluck(:vehicle_id))
  end

  def get_available_drivers range
    Driver.where.not(id:Route.assigned_range(range).pluck(:driver_id))
  end
end
