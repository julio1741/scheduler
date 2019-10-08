# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Route.destroy_all
Driver.destroy_all
Vehicle.destroy_all

comunes = ["Cerrillos","Cerro Navia","Conchalí","Cerro Navia","Estación Central","Huechuraba","Independencia","La Cisterna","La Florida","La Granja","La Pintana","La Reina","Las Condes","Lo Barnechea","Lo Espejo","Lo Prado","Macul","Maipú","Ñuñoa","Padre Hurtado","Pedro Aguirre Cerda","Peñalolén","Pirque","Providencia","Pudahuel","Puente Alto","Quilicura","Quinta Normal","Recoleta","Renca","San Bernardo","San Joaquín","San José de Maipo","San Miguel","San Ramón","Santiago"] 

Driver.create(
	name: "Julio", 
	phone: "95676005", 
	email: "julio1741@gmail.com", 
	vehicle_id: nil, 
	cities: "Santiago, La Florida"
);

Driver.create(
	name: "Nicolas", 
	phone: "912345678", 
	email: "nicolas@routinguc.com", 
	vehicle_id: nil, 
	cities: "Santiago,Cerro Navia,Cerro Navia"
);

Vehicle.create(
	capacity:100, 
	load_type: "General", 
	driver_id: nil, 
	owner: false
);
Vehicle.create(
	capacity:150, 
	load_type: "Refrigerada", 
	driver_id: nil, 
	owner: false
);
Vehicle.create(
	capacity:200, 
	load_type: nil, 
	driver_id: nil, 
	owner: false
);

Route.create(
	starts_at: "2019-10-08 08:00:00", 
	ends_at: "2019-10-08 20:00:00", 
	load_type: "Refrigerada", 
	load_sum: 50, 
	cities: "Santiago", 
	driver_id: nil
);

Route.create(
	starts_at: "2019-10-08 13:00:00", 
	ends_at: "2019-10-08 15:00:00", 
	load_type: "General", 
	load_sum: 50, 
	cities: "Renca,Conchalí"
);
Route.create(
	starts_at: "2019-10-08 13:00:00", 
	ends_at: "2019-10-08 15:00:00", 
	load_type: nil, 
	load_sum: 120, 
	cities: "La Reina,Cerrillos"
);


p "Created #{Route.count} routes"
p "Created #{Driver.count} drivers"
p "Created #{Vehicle.count} routes"
