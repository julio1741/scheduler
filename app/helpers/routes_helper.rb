module RoutesHelper

  def self.resolve_routes
    unresolved_routes = Route.not_resolved

    unresolved_routes.each do |ur|

      range = [ur.starts_at, ur.ends_at]

      available_vehicles = vehicles_with_capacity(range, load_sum)
      available_drivers = get_available_drivers(range)

      vehicle = available_vehicles.first
      driver = available_drivers.first

      #Validaciones
      next if vehicle.nil? or driver.nil?
      next if not can_drive_on_comunes?(driver, ur)
      next if not can_do_stop_amount?(driver, ur)

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

  #valida si un coductor maneja por las comunas de la ruta
  def self.can_drive_on_comunes? driver, route
    route_comunes = route.cities.split(",")
    driver_comunes = driver.cities.split(",")
    (route_comunes - driver_comunes).empty?
  end

  #valida si un coductor puede realizar la cantidad de paradas requeridas
  def self.can_do_stop_amount? driver, route
    drive_stop_amount = driver.stops_amount
    route_stop_amount = route.stops_amount
    return true if drive_stop_amount.nil?
    return true if route_stop_amount.nil?
    return true if drive_stop_amount >= route_stop_amount
  end

  #Filtar vehiculos con capacidad para una ruta
  def self.vehicles_with_capacity range, load_sum
    get_available_vehicles.select{|v| v.capacity >= load_sum}
  end

end
