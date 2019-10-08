module RoutesHelper

  def self.resolve_routes
    unresolved_routes = Route.not_resolved

    unresolved_routes.each do |ur|

      range = [ur.starts_at, ur.ends_at]

      available_vehicles = get_available_vehicles(range)
      available_drivers = get_available_drivers(range)

      vehicle = available_vehicles.first
      driver = available_drivers.first

      next if vehicle.nil? or driver.nil?

      ur.driver_id = driver.id
      ur.vehicle_id = vehicle.id
      ur.resolved = true
      ur.save
    end

  end

  def self.get_available_vehicles range
     Vehicle.where.not(id:Route.assigned_range(range).pluck(:vehicle_id))
  end

  def self.get_available_drivers range
    Driver.where.not(id:Route.assigned_range(range).pluck(:driver_id))
  end
end
