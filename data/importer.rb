# Run from project root via. `ruby data/importer.rb`
require 'csv'
require_relative '../app/models/skill'
require_relative '../app/models/training_path'
require_relative '../lib/environment'

Environment.environment = "development"
source = "data/rp.csv"

CSV.foreach(source, headers: true) do |row|
  restaurant_name = row['restaurant name']
  city = row['city']
  state = row['state']
  cuissine = row['cuissine']

  restaurant = Restaurants.all.find{ |restaurant| restaurant.name == restaurant_name }
  restaurant ||= Restaurants.create(name: restaurant_name)
  puts "Imported #{skill_name} into #{training_path_name} with description #{skill_description}."
end
