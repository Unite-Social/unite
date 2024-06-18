# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



puts "Criando org"
  g = User.create(name:"greenpeace", phone:"66688888", organization:true, cnpj: "0202020202021", organization_type: "ong", description:"testetestetes", email: "green@teste.com", password: "123123" )
  h = User.create(name:"greenpeace2", phone:"66688888", organization:true, cnpj: "0202020202022", organization_type: "ong", description:"testetestetes", email: "green2@tgreen.com", password: "123123")
puts "Org criado"


puts "Create user"
user2 = User.create(name:"Jucabala", phone:"222111666", cpf:"12345678900", email:"teste@teste.com", password:"123123")
user1 = User.create(name:"greenpeace", phone:"66688888", organization:true, cnpj: "0202020202021", organization_type: "Ong", description:"testetestetes", email: "green@teste.com", password: "123123" )


puts "Criando chat"
Chatroom.create(name: "general")
chat1 = User.create(email: "sebastien@lewagon.org", nickname: "Sebastien", password: "123123", name:"Tião Galinha", phone:"123456789")
chat2 = User.create(email: "boris@lewagon.org", nickname: "Boris", password: "123123",name:"João Grilo", phone:"123456789")

puts "User: #{chat1.name}, #{chat2.name} created!"
