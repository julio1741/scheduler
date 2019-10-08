class Route < ApplicationRecord
  #belongs_to :user_id

  #Rutas no asignadas aun
  scope :not_resolved, -> { where(resolved: false) }

  #Rutas asignadas
  scope :resolved, -> { where(resolved: true) }

  #Vehiculos no ocupados
  scope :available_vehicles, -> { where(vehicle_id: nil) }

  #Conductor no ocupado
  scope :available_drivers, -> { where(driver_id: nil) }

  #Verifica si esta asignado un rango de fecha a alguna ruta
  scope :assigned_range, -> (needed_range) do
    resolved.where("(? BETWEEN routes.starts_at AND routes.ends_at
            OR ? BETWEEN routes.starts_at AND routes.ends_at)
            OR routes.starts_at BETWEEN ? AND ?
            OR routes.ends_at BETWEEN ? AND ?
            ", needed_range.first, needed_range.last, needed_range.first, needed_range.last, needed_range.first, needed_range.last)
  end

end