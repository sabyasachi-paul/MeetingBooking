# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'admin')
Role.create(name: 'default')
Room.create(name: "Meeting-Room-1")
Room.create(name: "Meeting-Room-2")
Room.create(name: "Meeting-Room-3")
u = User.new
u.email = "admin@admin.com"
u.password = "admin123"
u.first_name = "Admin"
u.last_name = "User"
u.password_confirmation = "admin123"
r = Role.find_by_name("admin")
u.role = r
u.save!