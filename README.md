# Scheduler
Aplicado a la asignación de rutas de vehículos de una flota y a un equipo de conductores disponibles.


# Especificaciones:

```sh
Ruby: 2.6.3p62
Rails 6.0.0
PostgreSQL 11.4
```

# Modelos

| Modelo | Columnas |
| ------ | ------ |
| Vehicle | (id: integer, capacity: integer, load_type: string, driver_id: integer, owner: boolean, created_at: datetime, updated_at: datetime) |
| Driver | (id: integer, name: string, phone: string, email: string, vehicle_id: integer, cities: string, created_at: datetime, updated_at: datetime, stops_amount: integer |
| Route | (id: integer, starts_at: datetime, ends_at: datetime, load_type: string, load_sum: integer, cities: string, driver_id: integer, vehicle_id: integer, created_at: datetime, updated_at: datetime, resolved: boolean, stops_amount: integer) |


# Datos
- Las comunas se manejas através de un String concatenado. Ejemplo: ["Cerrillos","Cerro Navia","Conchalí"]
- Las comunas de los conductores se manejan de la misma forma que en punto anterior. 

# Logrado
- En la raiz de la App se encuentra dos tablas que indican las rutas asignadas y las no asignadas aun
- El core de la app donde se realizan las asignaciones se engatilla al hacer click en "Asignar!"
- Se pueden Crear vehiculos
- Se pueden Crear Conductores
- La lógica mas importante en el mètodo "resolve_routes" que se encuentra en el RoutesHelper
- En este mismo helper(RoutesHelper) agregue las validaciones correspondientes.

# No Logrado
- Falto validar los tipos de carga(load_type)
- Llenas con mas data el seed.rb
- Hacer mas pruebas para validar todo