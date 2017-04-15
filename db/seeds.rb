# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create!(username: 'admin',
								 email: 'admin@admin.com',
								 password: 'password', 
								 password_confirmation: 'password', 
								 employee_name: 'Giorgo Picolo', 
								 admin: true, 
								 is_activ: false,
								 pay_per_hour: 150,
								 craftmanship_id: 1)
								 
Employee.create!(username: 'kokot',
								 email: 'kokot@mail.net',
								 password: 'kokoko', 
								 password_confirmation: 'kokoko', 
								 employee_name: 'Kokoto Veliky', 
								 admin: false, 
								 is_activ: true,
								 pay_per_hour: 100,
								 craftmanship_id: 2)

Employee.create!(username: 'bohous',
								 email: 'bohous@mail.net',
								 password: 'bohous', 
								 password_confirmation: 'bohous', 
								 employee_name: 'Bohusu Koprdelnik', 
								 admin: false, 
								 is_activ: true,
								 pay_per_hour: 120,
								 craftmanship_id: 3)
	

Craftmanship.create!(title: "administrators" )
Craftmanship.create!(title: "builders" )
Craftmanship.create!(title: "foresters" )

Project.create!(title: "Construction projects")
Project.create!(title: "Forest projects")
Project.create!(title: "Other projects")

					
