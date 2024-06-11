# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all


puts "Create user"
user2 = User.create(name:"Jucabala", phone:"222111666", cpf:"12345678900", email:"teste@teste.com", password:"123123")
user1 = User.create(name:"greenpeace", phone:"66688888", organization:true, cnpj: "0202020202021", organization_type: "Ong", description:"testetestetes", email: "green@teste.com", password: "123123" )

puts "Criando user"
  g = User.create(name:"greenpeace", phone:"66688888", organization:true, cnpj: "0202020202021", organization_type: "ong", description:"testetestetes", email: "green@teste.com", password: "123123" )
  f = User.create(name:"Jucabala", phone:"222111666", cpf:"12345678900", email:"teste@teste.com", password:"123123")

puts "User: #{user1.name}, #{user2.name} created!"
