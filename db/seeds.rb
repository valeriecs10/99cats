# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.create!(name: "Pikachu", color: "Orange", birth_date: "2015-12-21", sex: "M", description: "Aggressively cuddly, yet independent")
Cat.create!(name: "Olive", color: "Black", birth_date: "2017-04-08", sex: "F", description: "Indoor only, calm temperment")

CatRentalRequest.create!(cat_id: 1, start_date: "2021-01-15", end_date: "2021-01-22")
CatRentalRequest.create!(cat_id: 2, start_date: "2021-02-12", end_date: "2021-02-16")
CatRentalRequest.create!(cat_id: 1, start_date: "2021-02-12", end_date: "2021-02-16")
CatRentalRequest.create!(cat_id: 1, start_date: "2021-01-01", end_date: "2021-03-31")