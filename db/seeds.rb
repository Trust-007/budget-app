# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create some users
User.create!([
    { name: 'Trust', email: 'simeontrust7@gmail.com.com', password: '123456', password_confirmation: '123456' },
    { name: 'Peter', email: 'simeonpeter8@gmail.com.com', password: '123456', password_confirmation: '123456' }
   ])

   #Create some categories
Category.create!([
    {name: 'Shipping', icon: 'https://media.gettyimages.com/id/600101128/photo/sea-bearing-cargo-ship.jpg?s=612x612&w=gi&k=20&c=td3GwO5C4JZSaqRplJWI4hrjBPFNIRUfsNpWvB5mNdY=', user_id: 1},
    {name: 'Exportation', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8TIvugEwwV0AxMthQSid9fh20OBIjUoiy84aYu5YGEiTBwDLwpgOk4K2Agpu3uxZU1jA&usqp=CAU', user_id: 2}
])

#Create some records
Record.create!([
    {name: 'Bill', amount: '80.0', user_id: 1},
    {name: 'Docking', amount: '3000.0', user_id: 1}
])