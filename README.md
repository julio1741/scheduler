# scheduler
Scheduler, aplicado a la asignación de rutas de vehículos de una flota y a un equipo de conductores disponibles.



#Especificaciones:
Ruby: 2.6.3p62
Rails 6.0.0
PostgreSQL 11.4


#Migraciones:
rails g scaffold route starts_at:datetime, ends_at:datetime, load_type:string, load_sum:integer, cities:array, user:references
rails g scaffold vehicle capacity:integer, load_type:string, driver_id:references, owner:boolean 
rails g scaffold driver name:string phone:string, email:string, vehicle_id:references, cities:array

#Ambientación
Clonar repositorio
rake db:seed

